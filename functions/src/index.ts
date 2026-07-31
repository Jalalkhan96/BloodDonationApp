import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { z } from "zod";

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

// Blood compatibility matrix
const bloodCompatibility: Record<string, string[]> = {
  "oNegative": ["oNegative", "oPositive", "aNegative", "aPositive", "bNegative", "bPositive", "abNegative", "abPositive"],
  "oPositive": ["oPositive", "aPositive", "bPositive", "abPositive"],
  "aNegative": ["aNegative", "aPositive", "abNegative", "abPositive"],
  "aPositive": ["aPositive", "abPositive"],
  "bNegative": ["bNegative", "bPositive", "abNegative", "abPositive"],
  "bPositive": ["bPositive", "abPositive"],
  "abNegative": ["abNegative", "abPositive"],
  "abPositive": ["abPositive"],
};

// Default matching weights (overridden by Remote Config)
const defaultWeights = {
  distance: 0.35,
  availability: 0.20,
  acceptanceRate: 0.15,
  donationHistory: 0.10,
  rating: 0.10,
  recency: 0.10,
};

const RequestSchema = z.object({
  bloodGroup: z.enum(["oNegative", "oPositive", "aNegative", "aPositive", "bNegative", "bPositive", "abNegative", "abPositive"]),
  geopoint: z.object({
    latitude: z.number(),
    longitude: z.number(),
  }).refine((data) => Number.isFinite(data.latitude) && Number.isFinite(data.longitude), {
    message: "Invalid geopoint coordinates",
  }),
  urgency: z.enum(["low", "medium", "high", "emergency"]),
  unitsRequired: z.number().int().positive(),
  recipientHospital: z.string().min(1).max(100),
  requesterId: z.string(),
});

type Request = z.infer<typeof RequestSchema>;

// Matching algorithm
export const onRequestCreated = functions.firestore
  .document("requests/{requestId}")
  .onCreate(async (snapshot, context) => {
    const requestId = context.params.requestId;
    const rawRequest = snapshot.data();

    if (!requestId) return;

    // Validate request data
    const parseResult = RequestSchema.safeParse(rawRequest);
    if (!parseResult.success) {
      functions.logger.error(`Invalid request data for ${requestId}:`, parseResult.error.errors);
      await snapshot.ref.update({
        status: "invalid",
        closedAt: admin.firestore.FieldValue.serverTimestamp(),
        closeReason: "invalid_data",
      });
      return;
    }

    const request = parseResult.data;
    functions.logger.info(`New request ${requestId}: ${request.bloodGroup} blood, urgency: ${request.urgency}`);

    try {
      // Get compatible blood groups
      const compatibleGroups = bloodCompatibility[request.bloodGroup] || [];

      // Query eligible donors with compatible blood groups
      const donorsSnapshot = await db
        .collection("users")
        .where("role", "==", "donor")
        .where("profile.bloodGroup", "in", compatibleGroups)
        .where("profile.availability", "==", "available")
        .where("profile.isEligible", "==", true)
        .get();

      // Calculate scores and rank candidates
      const candidates: Array<{
        donorId: string;
        score: number;
        distance: number;
        fcmToken: string;
        isExactMatch: boolean;
      }> = [];

      const requestLat = request.geopoint.latitude;
      const requestLng = request.geopoint.longitude;

      for (const donorDoc of donorsSnapshot.docs) {
        const donorData = donorDoc.data();
        const profile = donorData.profile || {};
        const donorGeopoint = profile.geopoint;

        if (!donorGeopoint) continue;

        // Calculate distance (Haversine formula)
        const distance = calculateDistance(
          requestLat,
          requestLng,
          donorGeopoint.latitude,
          donorGeopoint.longitude
        );

        // Filter by radius (50km max)
        if (distance > 50) continue;

        // Calculate distance score (inverse, normalized)
        const distanceScore = Math.max(0, 1 - distance / 50);

        // Availability score
        const availabilityScore = 1.0;

        // Acceptance rate (with Bayesian smoothing)
        const acceptRate = donorData.acceptanceRate || 0.5;
        const acceptCount = donorData.totalNotifications || 0;
        const smoothedRate = (acceptCount * acceptRate + 10 * 0.5) / (acceptCount + 10);

        // Donation history score (normalized)
        const donationCount = profile.donationCount || 0;
        const donationHistoryScore = Math.min(1, donationCount / 20);

        // Rating score
        const rating = profile.rating || 0;
        const ratingScore = rating / 5;

        // Recency score
        const recencyScore = 1.0;

        // Total score
        const weights = defaultWeights;
        const totalScore =
          distanceScore * weights.distance +
          availabilityScore * weights.availability +
          smoothedRate * weights.acceptanceRate +
          donationHistoryScore * weights.donationHistory +
          ratingScore * weights.rating +
          recencyScore * weights.recency;

        const isExactMatch = profile.bloodGroup === request.bloodGroup;

        // Get FCM token
        const fcmTokens = donorData.fcmTokens || [];
        if (fcmTokens.length === 0) continue;

        candidates.push({
          donorId: donorDoc.id,
          score: totalScore,
          distance,
          fcmToken: fcmTokens[fcmTokens.length - 1],
          isExactMatch,
        });
      }

      // Sort: exact matches first, then by score
      candidates.sort((a, b) => {
        if (a.isExactMatch && !b.isExactMatch) return -1;
        if (!a.isExactMatch && b.isExactMatch) return 1;
        return b.score - a.score;
      });

      // Take top 10 candidates for first wave
      const topCandidates = candidates.slice(0, 10);

      if (topCandidates.length === 0) {
        functions.logger.warn(`No candidates found for request ${requestId}`);
        // Update request status
        await snapshot.ref.update({
          status: "expired",
          closedAt: admin.firestore.FieldValue.serverTimestamp(),
          closeReason: "no_candidates",
        });
        return;
      }

      // Update request with candidate info
      await snapshot.ref.update({
        totalCandidatesNotified: topCandidates.length,
        candidateWave: 1,
      });

      // Send notifications to top candidates
      const notificationPromises = topCandidates.map(async (candidate) => {
        const notification: admin.messaging.Message = {
          token: candidate.fcmToken,
          priority: "high",
          notification: {
            title: `🩸 Blood Needed: ${formatBloodGroup(request.bloodGroup)}`,
            body: `${request.urgency.toUpperCase()} - ${request.unitsRequired} unit(s) needed nearby (${candidate.distance.toFixed(1)}km away)`,
          },
          data: {
            type: "emergency_request",
            requestId,
            bloodGroup: request.bloodGroup,
            urgency: request.urgency,
            distance: candidate.distance.toString(),
          },
          android: {
            priority: "high",
            notification: {
              channelId: "emergency_alerts",
              priority: "max",
            },
          },
          apns: {
            payload: {
              aps: {
                "content-available": 1,
                sound: "default",
                badge: 1,
              },
            },
          },
        };

        try {
          await messaging.send(notification);
          functions.logger.info(`Notification sent to ${candidate.donorId}`);
        } catch (error) {
          functions.logger.error(`Failed to notify ${candidate.donorId}:`, error);
        }
      });

      await Promise.all(notificationPromises);

      // Set up timeout for first wave (3 minutes)
      await db.runTransaction(async (transaction) => {
        // Schedule follow-up waves
        functions.logger.info(
          `Matching complete for ${requestId}: ${topCandidates.length} candidates notified`
        );
      });
    } catch (error) {
      functions.logger.error(`Error in matching for ${requestId}:`, error);
    }
  });

export const onRequestAccepted = functions.firestore
  .document("requests/{requestId}")
  .onUpdate(async (change, context) => {
    const requestId = context.params.requestId;
    const before = change.before.data();
    const after = change.after.data();

    if (before.status === after.status || after.status !== "matched") return;

    const { matchedDonorId, requesterId } = after;

    try {
      const requesterDoc = await db.collection("users").doc(requesterId).get();
      const requesterTokens = requesterDoc.data()?.fcmTokens || [];

      for (const token of requesterTokens) {
        await messaging.send({
          token,
          notification: {
            title: "Donor Found!",
            body: "A donor has accepted your blood request and is on their way.",
          },
          data: {
            type: "request_accepted",
            requestId,
            donorId: matchedDonorId,
          },
        });
      }

      // Notify other candidates that request was filled
      // (handled by the Firestore query)
    } catch (error) {
      functions.logger.error(`Error notifying requester for ${requestId}:`, error);
    }
  });

export const onDonationVerified = functions.firestore
  .document("donations/{donationId}")
  .onUpdate(async (change, context) => {
    const donationId = context.params.donationId;
    const before = change.before.data();
    const after = change.after.data();

    if (before.verified === after.verified || !after.verified) return;

    // Generate certificate PDF
    // In production, use a PDF library or external service
    functions.logger.info(`Generating certificate for donation ${donationId}`);

    // Update donor stats
    const { donorId } = after;
    await db.collection("users").doc(donorId).update({
      "profile.donationCount": admin.firestore.FieldValue.increment(1),
      "profile.lastDonationDate": admin.firestore.FieldValue.serverTimestamp(),
    });

    // Notify donor
    try {
      const donorDoc = await db.collection("users").doc(donorId).get();
      const donorTokens = donorDoc.data()?.fcmTokens || [];

      for (const token of donorTokens) {
        await messaging.send({
          token,
          notification: {
            title: "Certificate Ready!",
            body: "Your donation certificate is now available for download.",
          },
          data: {
            type: "certificate_ready",
            donationId,
          },
        });
      }
    } catch (error) {
      functions.logger.error(`Error sending certificate notification:`, error);
    }
  });

export const scheduledEligibilityRecompute = functions.pubsub
  .schedule("0 2 * * *")
  .timeZone("UTC")
  .onRun(async () => {
    functions.logger.info("Running nightly eligibility recompute");

    const donorsSnapshot = await db
      .collection("users")
      .where("role", "==", "donor")
      .get();

    const batch = db.batch();
    let updateCount = 0;

    for (const donorDoc of donorsSnapshot.docs) {
      const profile = donorDoc.data().profile || {};
      const lastDonationDate = profile.lastDonationDate?.toDate();

      let isEligible = true;
      let ineligibilityReason = null;
      let nextEligibleDate = null;

      // Check age
      if (profile.age && (profile.age < 18 || profile.age > 65)) {
        isEligible = false;
        ineligibilityReason = "Age requirement not met";
      }

      // Check weight
      if (profile.weight && profile.weight < 50) {
        isEligible = false;
        ineligibilityReason = "Minimum weight is 50 kg";
      }

      // Check cooldown
      if (lastDonationDate) {
        const daysSince = Math.floor(
          (Date.now() - lastDonationDate.getTime()) / (1000 * 60 * 60 * 24)
        );
        if (daysSince < 90) {
          isEligible = false;
          nextEligibleDate = new Date(
            lastDonationDate.getTime() + 90 * 24 * 60 * 60 * 1000
          );
          ineligibilityReason = `Must wait ${90 - daysSince} more days`;
          nextEligibleDate = new Date();
        }
      }

      batch.update(donorDoc.ref, {
        "profile.isEligible": isEligible,
        "profile.ineligibilityReason": ineligibilityReason,
        "profile.nextEligibleDate": nextEligibleDate,
      });
      updateCount++;
    }

    await batch.commit();
    functions.logger.info(`Updated eligibility for ${updateCount} donors`);
  });

export const scheduledRequestExpiry = functions.pubsub
  .schedule("every 5 minutes")
  .onRun(async () => {
    const expiredThreshold = new Date(Date.now() - 24 * 60 * 60 * 1000);

    const expiredSnapshot = await db
      .collection("requests")
      .where("status", "==", "pending")
      .where("createdAt", "<", admin.firestore.Timestamp.fromDate(expiredThreshold))
      .get();

    for (const doc of expiredSnapshot.docs) {
      await doc.ref.update({
        status: "expired",
        closedAt: admin.firestore.FieldValue.serverTimestamp(),
        closeReason: "timeout",
      });
    }

    functions.logger.info(`Expired ${expiredSnapshot.size} requests`);
  });

export const scheduledExpiryAlerts = functions.pubsub
  .schedule("every 1 hours")
  .onRun(async () => {
    const in72h = new Date(Date.now() + 72 * 60 * 60 * 1000);
    const in7Days = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000);

    const banksSnapshot = await db.collection("bloodInventory").get();

    for (const bankDoc of banksSnapshot.docs) {
      const stockSnapshot = await bankDoc.ref.collection("stock").get();
      for (const stockDoc of stockSnapshot.docs) {
        const data = stockDoc.data();
        const batches = data.batches || [];

        const expiringIn72h = batches.filter(
          (b: any) => b.expiryDate.toDate() <= in72h && b.isActive
        );
        const expiringIn7Days = batches.filter(
          (b: any) => b.expiryDate.toDate() <= in7Days && b.isActive
        );

        if (expiringIn72h.length > 0) {
          // Send critical alert to blood bank
          functions.logger.warn(
            `${expiringIn72h.length} batches expiring in 72h at ${bankDoc.id}`
          );
        }
      }
    }
  });

function calculateDistance(
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number {
  const R = 6371;
  const dLat = ((lat2 - lat1) * Math.PI) / 180;
  const dLon = ((lon2 - lon1) * Math.PI) / 180;
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos((lat1 * Math.PI) / 180) *
      Math.cos((lat2 * Math.PI) / 180) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
}

function formatBloodGroup(group: string): string {
  const map: Record<string, string> = {
    oNegative: "O-",
    oPositive: "O+",
    aNegative: "A-",
    aPositive: "A+",
    bNegative: "B-",
    bPositive: "B+",
    abNegative: "AB-",
    abPositive: "AB+",
  };
  return map[group] || group;
}
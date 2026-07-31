import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class LocationService {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<Position?> getCurrentPosition() async {
    try {
      final serviceEnabled = await _geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return null;

      var permission = await _geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await _geolocator.requestPermission();
        if (permission == LocationPermission.denied) return null;
      }

      if (permission == LocationPermission.deniedForever) return null;

      return await _geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
    } catch (e) {
      debugPrint('Error getting position: $e');
      return null;
    }
  }

  Stream<Position> getPositionStream({
    int distanceFilter = 100,
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) {
    return _geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilter,
      ),
    );
  }

  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    return _geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000;
  }

  String encodeGeohash(double latitude, double longitude, {int precision = 9}) {
    const base32 = '0123456789bcdefghjkmnpqrstuvwxyz';
    var minLat = -90.0, maxLat = 90.0;
    var minLng = -180.0, maxLng = 180.0;
    var geohash = '';
    var isLng = true;
    var bit = 0;
    var ch = 0;

    while (geohash.length < precision) {
      if (isLng) {
        final mid = (minLng + maxLng) / 2;
        if (longitude >= mid) {
          ch |= 1 << (4 - bit);
          minLng = mid;
        } else {
          maxLng = mid;
        }
      } else {
        final mid = (minLat + maxLat) / 2;
        if (latitude >= mid) {
          ch |= 1 << (4 - bit);
          minLat = mid;
        } else {
          maxLat = mid;
        }
      }
      isLng = !isLng;
      bit++;
      if (bit == 5) {
        geohash += base32[ch];
        bit = 0;
        ch = 0;
      }
    }
    return geohash;
  }

  Map<String, double> getGeohashBounds(String geohash) {
    // Approximate bounds from geohash center ± delta
    const base32 = '0123456789bcdefghjkmnpqrstuvwxyz';
    var minLat = -90.0, maxLat = 90.0;
    var minLng = -180.0, maxLng = 180.0;
    var isLng = true;

    for (final c in geohash.split('')) {
      final cd = base32.indexOf(c);
      for (var i = 0; i < 5; i++) {
        final mask = 1 << (4 - i);
        if (isLng) {
          final mid = (minLng + maxLng) / 2;
          if ((cd & mask) != 0) {
            minLng = mid;
          } else {
            maxLng = mid;
          }
        } else {
          final mid = (minLat + maxLat) / 2;
          if ((cd & mask) != 0) {
            minLat = mid;
          } else {
            maxLat = mid;
          }
        }
        isLng = !isLng;
      }
    }

    return {
      'minLat': minLat,
      'minLon': minLng,
      'maxLat': maxLat,
      'maxLon': maxLng,
    };
  }

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isEmpty) return null;
      final place = placemarks.first;
      return '${place.name}, ${place.locality}, ${place.administrativeArea} ${place.postalCode}';
    } catch (e) {
      return null;
    }
  }

  Future<List<Location>> getLatLngFromAddress(String address) async {
    try {
      return await locationFromAddress(address);
    } catch (e) {
      return [];
    }
  }

  Future<bool> openLocationSettings() async {
    return _geolocator.openLocationSettings();
  }

  Future<bool> openAppSettings() async {
    return _geolocator.openAppSettings();
  }
}

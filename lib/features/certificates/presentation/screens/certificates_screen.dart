import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CertificatesScreen extends ConsumerWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Certificates')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCertificateCard(
            context,
            donationId: 'DL-2024-1234',
            date: 'Jan 15, 2025',
            hospital: 'AIIMS Delhi',
            bloodGroup: 'B+',
            units: 1,
          ),
          _buildCertificateCard(
            context,
            donationId: 'DL-2024-1189',
            date: 'Dec 10, 2024',
            hospital: 'City Hospital',
            bloodGroup: 'B+',
            units: 1,
          ),
          _buildCertificateCard(
            context,
            donationId: 'DL-2024-1098',
            date: 'Nov 5, 2024',
            hospital: 'Red Cross Center',
            bloodGroup: 'B+',
            units: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(
    BuildContext context, {
    required String donationId,
    required String date,
    required String hospital,
    required String bloodGroup,
    required int units,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Donation Certificate',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '$bloodGroup • $units unit',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildCertInfo(Icons.calendar_today, date),
                const SizedBox(width: 16),
                _buildCertInfo(Icons.local_hospital, hospital),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text('Download'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, size: 18),
                    label: const Text('Share'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCertInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

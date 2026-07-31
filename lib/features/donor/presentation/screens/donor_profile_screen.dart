import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonorProfileScreen extends ConsumerWidget {
  final String donorId;

  const DonorProfileScreen({super.key, required this.donorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Donor Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Donor Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'B+',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('5', 'Donations'),
                _buildStatColumn('4.8', 'Rating'),
                _buildStatColumn('95%', 'Acceptance'),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Location'),
                    subtitle: const Text('2.3 km away'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Last Donation'),
                    subtitle: const Text('92 days ago'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.verified_user),
                    title: const Text('Verification'),
                    subtitle: const Text('Verified Donor'),
                    trailing: const Icon(Icons.check_circle, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

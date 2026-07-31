import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NgoDashboardScreen extends ConsumerWidget {
  const NgoDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NGO Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverview(context),
            const SizedBox(height: 16),
            _buildUpcomingCamps(context),
            const SizedBox(height: 16),
            _buildPastCamps(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(context, 'Camps', '8', Icons.event, Colors.blue),
        const SizedBox(width: 12),
        _buildStatCard(context, 'Donors', '240', Icons.people, Colors.green),
        const SizedBox(width: 12),
        _buildStatCard(context, 'Collected', '180', Icons.bloodtype, Colors.red),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
              Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingCamps(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upcoming Camps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.event, color: Colors.blue),
            ),
            title: const Text('Community Blood Drive'),
            subtitle: const Text('Jan 25, 2025 • City Park • 50 registrations'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.event, color: Colors.green),
            ),
            title: const Text('College Donation Camp'),
            subtitle: const Text('Feb 1, 2025 • Delhi University • 30 registrations'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ],
    );
  }

  Widget _buildPastCamps(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Past Camps', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.check_circle, color: Colors.green),
            ),
            title: const Text('Winter Blood Drive'),
            subtitle: const Text('Dec 20, 2024 • 45 donations collected'),
            trailing: const Text('87%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

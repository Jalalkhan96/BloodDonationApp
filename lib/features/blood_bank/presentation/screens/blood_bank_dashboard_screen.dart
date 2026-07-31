import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodBankDashboardScreen extends ConsumerWidget {
  const BloodBankDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Bank Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildExpiryAlerts(context),
            const SizedBox(height: 16),
            _buildInventoryGrid(context),
            const SizedBox(height: 16),
            _buildRecentCheckIns(context),
            const SizedBox(height: 16),
            _buildTransferSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildExpiryAlerts(BuildContext context) {
    return Card(
      color: Colors.orange.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'Expiry Alerts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '2 batches expiring within 72 hours',
              style: TextStyle(color: Colors.orange.shade700),
            ),
            Text(
              '5 batches expiring within 7 days',
              style: TextStyle(color: Colors.orange.shade600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryGrid(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inventory Status',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.9,
              children: const [
                _InventoryTile(group: 'O-', units: 5, critical: true),
                _InventoryTile(group: 'O+', units: 12),
                _InventoryTile(group: 'A-', units: 3, critical: true),
                _InventoryTile(group: 'A+', units: 8),
                _InventoryTile(group: 'B-', units: 4, critical: true),
                _InventoryTile(group: 'B+', units: 10),
                _InventoryTile(group: 'AB-', units: 2, critical: true),
                _InventoryTile(group: 'AB+', units: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentCheckIns(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Recent Check-ins',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(child: Text('AK')),
            title: const Text('Anil Kumar'),
            subtitle: const Text('B+ • Just checked in'),
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Verify'),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const CircleAvatar(child: Text('SM')),
            title: const Text('Sunita Mehta'),
            subtitle: const Text('A+ • 5 min ago'),
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Verify'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransferSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Stock Transfer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.swap_horiz),
              label: const Text('Transfer Stock Between Branches'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InventoryTile extends StatelessWidget {
  final String group;
  final int units;
  final bool critical;

  const _InventoryTile({
    required this.group,
    required this.units,
    this.critical = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = critical ? Colors.red : Theme.of(context).colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            group,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '$units',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          if (critical)
            Text(
              'Low',
              style: TextStyle(
                fontSize: 10,
                color: Colors.red.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HospitalDashboardScreen extends ConsumerWidget {
  const HospitalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInventoryOverview(context),
            const SizedBox(height: 16),
            _buildActiveRequests(context),
            const SizedBox(height: 16),
            _buildRecentDonations(context),
            const SizedBox(height: 16),
            _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryOverview(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Blood Inventory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Manage'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
              children: [
                _buildBloodUnit('O-', 5, Colors.red),
                _buildBloodUnit('O+', 12, Colors.red),
                _buildBloodUnit('A-', 3, Colors.blue),
                _buildBloodUnit('A+', 8, Colors.blue),
                _buildBloodUnit('B-', 4, Colors.green),
                _buildBloodUnit('B+', 10, Colors.green),
                _buildBloodUnit('AB-', 2, Colors.orange),
                _buildBloodUnit('AB+', 6, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodUnit(String group, int units, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: units < 3 ? Colors.red.withOpacity(0.1) : color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: units < 3 ? Colors.red.withOpacity(0.3) : color.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            group,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$units',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: units < 3 ? Colors.red : color,
            ),
          ),
          Text(
            'units',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveRequests(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Active Requests',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.bloodtype, color: Colors.red),
            ),
            title: const Text('Emergency: AB- Blood'),
            subtitle: const Text('Patient: Rajesh Kumar • 3 units'),
            trailing: const Text(
              'Urgent',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.bloodtype, color: Colors.orange),
            ),
            title: const Text('Scheduled: O+ Blood'),
            subtitle: const Text('Patient: Meena Devi • 2 units'),
            trailing: const Text(
              'Scheduled',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentDonations(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Recent Donations',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Donation #DL-2024-1234'),
            subtitle: const Text('Amit Singh • B+ • 1 unit'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Verified',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: const Text('Donation #DL-2024-1233'),
            subtitle: const Text('Sunita Patel • O+ • 1 unit'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Certificate Pending',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        _buildActionButton(
          context,
          'Issue Certificate',
          Icons.description_outlined,
          Colors.green,
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          context,
          'Scan QR',
          Icons.qr_code_scanner,
          Colors.blue,
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          context,
          'Analytics',
          Icons.analytics_outlined,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

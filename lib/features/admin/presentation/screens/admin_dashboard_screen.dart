import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flag_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewCards(context),
            const SizedBox(height: 16),
            _buildRequestsChart(context),
            const SizedBox(height: 16),
            _buildPendingVerifications(context),
            const SizedBox(height: 16),
            _buildFraudAlerts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildOverviewCard('Total Users', '12,450', Icons.people, Colors.blue, '+12%'),
        _buildOverviewCard('Active Requests', '23', Icons.bloodtype, Colors.red, '+5%'),
        _buildOverviewCard('Donations Today', '45', Icons.favorite, Colors.green, '+18%'),
        _buildOverviewCard('Hospitals', '156', Icons.local_hospital, Colors.purple, '+3%'),
      ],
    );
  }

  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String change,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    change,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Requests (Last 7 Days)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 50,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: _getBottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _buildBarGroup(0, 30),
                    _buildBarGroup(1, 45),
                    _buildBarGroup(2, 28),
                    _buildBarGroup(3, 40),
                    _buildBarGroup(4, 35),
                    _buildBarGroup(5, 42),
                    _buildBarGroup(6, 38),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _getBottomTitles(double value, TitleMeta meta) {
    const titles = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final index = value.toInt();
    if (index >= 0 && index < titles.length) {
      return Text(
        titles[index],
        style: const TextStyle(fontSize: 12),
      );
    }
    return const Text('');
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.red.shade300,
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildPendingVerifications(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'Pending Verifications',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(child: Text('MH')),
            title: const Text('Metro Hospital'),
            subtitle: const Text('Hospital registration • 2 documents'),
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Review'),
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const CircleAvatar(child: Text('CB')),
            title: const Text('City Blood Bank'),
            subtitle: const Text('License renewal • 1 document'),
            trailing: FilledButton.tonal(
              onPressed: () {},
              child: const Text('Review'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFraudAlerts(BuildContext context) {
    return Card(
      color: Colors.red.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.shield_outlined, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Fraud Alerts',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildFraudAlertItem('Duplicate account detected', 'user_abc123'),
            _buildFraudAlertItem('High cancellation rate', 'user_xyz789'),
          ],
        ),
      ),
    );
  }

  Widget _buildFraudAlertItem(String reason, String userId) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.warning_amber, size: 16, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(child: Text(reason, style: const TextStyle(fontSize: 13))),
          Text(
            userId,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

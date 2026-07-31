import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverviewCards(context),
            const SizedBox(height: 16),
            _buildResponseTimeChart(context),
            const SizedBox(height: 16),
            _buildFulfillmentChart(context),
            const SizedBox(height: 16),
            _buildBloodGroupDistribution(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCards(BuildContext context) {
    return Row(
      children: [
        _buildMetricCard(context, 'Avg Response', '4.2min', Colors.blue),
        const SizedBox(width: 12),
        _buildMetricCard(context, 'Fulfillment', '87%', Colors.green),
      ],
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponseTimeChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Response Time (min)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 5),
                        const FlSpot(2, 4),
                        const FlSpot(3, 6),
                        const FlSpot(4, 3.5),
                        const FlSpot(5, 4.2),
                        const FlSpot(6, 3.8),
                      ],
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 3,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFulfillmentChart(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Fulfillment Rate',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: _getBottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _buildBarGroup(0, 85, Colors.green),
                    _buildBarGroup(1, 90, Colors.green),
                    _buildBarGroup(2, 75, Colors.orange),
                    _buildBarGroup(3, 88, Colors.green),
                    _buildBarGroup(4, 92, Colors.green),
                    _buildBarGroup(5, 80, Colors.orange),
                    _buildBarGroup(6, 87, Colors.green),
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
      return Text(titles[index], style: const TextStyle(fontSize: 11));
    }
    return const Text('');
  }

  BarChartGroupData _buildBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color.withOpacity(0.7),
          width: 16,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildBloodGroupDistribution(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Blood Group Distribution',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(value: 35, color: Colors.red, title: 'O+', radius: 60),
                    PieChartSectionData(value: 20, color: Colors.blue, title: 'A+', radius: 60),
                    PieChartSectionData(value: 15, color: Colors.green, title: 'B+', radius: 60),
                    PieChartSectionData(value: 10, color: Colors.orange, title: 'AB+', radius: 60),
                    PieChartSectionData(value: 8, color: Colors.purple, title: 'O-', radius: 60),
                    PieChartSectionData(value: 7, color: Colors.teal, title: 'Others', radius: 60),
                  ],
                  sectionsSpace: 2,
                  centerSpaceRadius: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

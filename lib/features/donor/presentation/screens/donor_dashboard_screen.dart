import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/common_widgets.dart';

class DonorDashboardScreen extends ConsumerWidget {
  const DonorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeLink'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
            onPressed: () => context.push('/notifications'),
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, color: colorScheme.onSurface),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeHeader(context),
              const SizedBox(height: 20),
              _buildEmergencyBanner(context),
              const SizedBox(height: 20),
              _buildEligibilityCard(context),
              const SizedBox(height: 20),
              _buildQuickStats(context),
              const SizedBox(height: 20),
              _buildRecentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: colorScheme.primary,
              child: Icon(Icons.person, size: 30, color: colorScheme.onPrimary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'You\'ve helped save 3 lives',
                    style: TextStyle(
                      color: colorScheme.onPrimaryContainer.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.white),
                  SizedBox(width: 6),
                  Text(
                    'Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyBanner(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade400,
            Colors.red.shade700,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.emergency_share_rounded,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Emergency Request Nearby',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'B+ blood needed at AIIMS \u2022 2.3km away',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
            ),
            child: const Text('Respond'),
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Eligible to Donate',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 1.0,
              color: Colors.green,
              backgroundColor: colorScheme.outline.withOpacity(0.2),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Next donation: Ready now',
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.outline,
                  ),
                ),
                Text(
                  'Last: 92 days ago',
                  style: TextStyle(
                    fontSize: 13,
                    color: colorScheme.outline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        _buildStatCard(context, 'Donations', '3', Icons.bloodtype,
            colorScheme.primary),
        const SizedBox(width: 12),
        _buildStatCard(context, 'Lives Saved', '3', Icons.favorite,
            Colors.pink),
        const SizedBox(width: 12),
        _buildStatCard(context, 'Points', '450', Icons.star, Colors.amber),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Recent Activity',
          actionLabel: 'View All',
          onAction: () {},
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      const Icon(Icons.check_circle, color: Colors.green),
                ),
                title: const Text('Donation Completed'),
                subtitle: const Text('AIIMS Hospital \u2022 Jan 15, 2025'),
                trailing: const StatusBadge(
                  label: 'Verified',
                  color: Colors.green,
                  icon: Icons.verified,
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      const Icon(Icons.person_add, color: Colors.blue),
                ),
                title: const Text('Request Fulfilled'),
                subtitle:
                    const Text('Helped Priya Sharma \u2022 Jan 10, 2025'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

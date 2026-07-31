import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/common_widgets.dart';

class PatientDashboardScreen extends ConsumerWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Request'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined,
                color: colorScheme.onSurface),
            onPressed: () => context.push('/notifications'),
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
              _buildSearchBar(context),
              const SizedBox(height: 16),
              _buildBloodBanksNearby(context),
              const SizedBox(height: 20),
              _buildMyRequests(context),
              const SizedBox(height: 20),
              _buildNearbyDonors(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: () => context.push('/maps'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(Icons.search, color: colorScheme.outline),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Find Blood Donors',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Search by blood group, location, or name',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colorScheme.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBloodBanksNearby(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Blood Banks Nearby'),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.bloodtype,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              [
                                'City Blood Bank',
                                'Red Cross Center',
                                'LifeCare Bank'
                              ][index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '${1.5 + index * 0.8}km away',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Open',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.green.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMyRequests(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'My Requests',
          actionLabel: 'View All',
          onAction: () {},
        ),
        Card(
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.pending, color: Colors.orange),
            ),
            title: const Text('A+ Blood Needed'),
            subtitle: const Text('AIIMS \u2022 2 units \u2022 Urgent'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Pending',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNearbyDonors(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Nearby Available Donors'),
        const SizedBox(height: 8),
        DonorCard(
          name: 'Rahul Kumar',
          bloodGroup: 'A+',
          distance: '1.2km',
          rating: 4.8,
          onTap: () {},
          onChat: () {},
        ),
        DonorCard(
          name: 'Priya Singh',
          bloodGroup: 'A+',
          distance: '2.5km',
          rating: 4.5,
          onTap: () {},
          onChat: () {},
        ),
        DonorCard(
          name: 'Amit Sharma',
          bloodGroup: 'A+',
          distance: '3.8km',
          rating: 5.0,
          onTap: () {},
          onChat: () {},
        ),
      ],
    );
  }
}

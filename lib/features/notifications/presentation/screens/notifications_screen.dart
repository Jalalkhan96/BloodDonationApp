import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/enums.dart';
import '../../../../shared/widgets/common_widgets.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Mark all read'),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildNotificationSection(
            context,
            'Today',
            [
              _buildNotificationItem(
                context,
                icon: Icons.emergency,
                title: 'Emergency: B+ Blood Needed',
                subtitle: 'AIIMS Delhi \u2022 2.3km away',
                time: '5 min ago',
                type: NotificationType.emergencyRequest,
                isUnread: true,
              ),
              _buildNotificationItem(
                context,
                icon: Icons.check_circle,
                title: 'Donation Confirmed',
                subtitle:
                    'Your donation at City Hospital has been verified',
                time: '2 hours ago',
                type: NotificationType.certificateReady,
                isUnread: true,
              ),
            ],
          ),
          _buildNotificationSection(
            context,
            'Yesterday',
            [
              _buildNotificationItem(
                context,
                icon: Icons.person_add,
                title: 'Request Fulfilled',
                subtitle:
                    'Your donation request for Priya Sharma has been completed',
                time: '1 day ago',
                type: NotificationType.requestAccepted,
              ),
              _buildNotificationItem(
                context,
                icon: Icons.star,
                title: 'New Badge Earned',
                subtitle: 'You earned the "Consistent Donor" badge!',
                time: '1 day ago',
                type: NotificationType.system,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection(
    BuildContext context,
    String title,
    List<Widget> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        ...items,
      ],
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required NotificationType type,
    bool isUnread = false,
  }) {
    final color = switch (type) {
      NotificationType.emergencyRequest => Colors.red,
      NotificationType.requestAccepted => Colors.green,
      NotificationType.certificateReady => Colors.blue,
      NotificationType.system => Colors.purple,
      _ => Colors.grey,
    };

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 2),
          Text(
            time,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
      isThreeLine: true,
    );
  }
}

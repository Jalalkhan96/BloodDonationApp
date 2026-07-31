import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/enums.dart';
import '../../../../shared/widgets/common_widgets.dart';

class RequestDetailScreen extends ConsumerWidget {
  final String requestId;

  const RequestDetailScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusHeader(context),
            const SizedBox(height: 16),
            _buildRequestInfo(context),
            const SizedBox(height: 16),
            _buildDonorInfo(context),
            const SizedBox(height: 16),
            _buildTimeline(context),
            const SizedBox(height: 24),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusHeader(BuildContext context) {
    return Card(
      color: Colors.orange.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const StatusBadge(
              label: 'Pending',
              color: Colors.orange,
              icon: Icons.pending,
            ),
            const Spacer(),
            const Text(
              '--:--:--',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestInfo(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Blood Group', 'A+ (2 units)'),
            _buildInfoRow('Patient', 'Priya Sharma, 34 years'),
            _buildInfoRow('Hospital', 'AIIMS Delhi'),
            _buildInfoRow('Doctor', 'Dr. Mehta'),
            _buildInfoRow('Urgency', 'Urgent'),
            _buildInfoRow('Created', '2 hours ago'),
            _buildInfoRow('Notes', 'Patient requires surgery tomorrow morning'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonorInfo(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Matched Donor',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            DonorCard(
              name: 'Rahul Kumar',
              bloodGroup: 'A+',
              distance: '1.2km',
              rating: 4.8,
              onTap: () {},
              onChat: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Timeline',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildTimelineItem('Request Created', '2 hours ago', true),
            _buildTimelineItem('Donor Matched', '1 hour ago', true),
            _buildTimelineItem('Donor En Route', '30 min ago', false),
            _buildTimelineItem('Donation Complete', 'Pending', false),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem(String title, String time, bool isCompleted) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 30,
              color: Colors.grey.shade200,
            ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isCompleted ? null : Colors.grey,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Cancel request
            },
            icon: const Icon(Icons.cancel_outlined),
            label: const Text('Cancel'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // TODO: Call donor
            },
            icon: const Icon(Icons.phone),
            label: const Text('Call Donor'),
          ),
        ),
      ],
    );
  }
}

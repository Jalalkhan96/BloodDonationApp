import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RewardsScreen extends ConsumerWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rewards & Badges')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPointsSummary(context),
            const SizedBox(height: 20),
            _buildBadgesSection(context),
            const SizedBox(height: 20),
            _buildLeaderboardPreview(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsSummary(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Your Points',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              '450',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '50 more points to reach Gold tier',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: 0.9,
              backgroundColor: Colors.white.withOpacity(0.3),
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Badges',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.85,
          children: [
            _buildBadge(
              context,
              'First Drop',
              Icons.water_drop,
              Colors.red,
              true,
            ),
            _buildBadge(
              context,
              'Lifesaver',
              Icons.favorite,
              Colors.pink,
              true,
            ),
            _buildBadge(
              context,
              'Quick Responder',
              Icons.flash_on,
              Colors.amber,
              true,
            ),
            _buildBadge(
              context,
              'Consistent',
              Icons.emoji_events,
              Colors.orange,
              true,
            ),
            _buildBadge(
              context,
              'Hero Donor',
              Icons.star,
              Colors.purple,
              false,
            ),
            _buildBadge(
              context,
              '50 Donations',
              Icons.diamond,
              Colors.blue,
              false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String name,
    IconData icon,
    Color color,
    bool earned,
  ) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: earned ? color.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: earned ? color.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
            ),
          ),
          child: Icon(
            icon,
            size: 30,
            color: earned ? color : Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: earned ? null : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLeaderboardPreview(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leaderboard',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            _buildLeaderboardItem(1, 'Anil Kumar', 1200, true),
            _buildLeaderboardItem(2, 'Sunita Devi', 980, false),
            _buildLeaderboardItem(3, 'You', 450, false),
            _buildLeaderboardItem(4, 'Rajesh Singh', 420, false),
            _buildLeaderboardItem(5, 'Priya Patel', 380, false),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardItem(int rank, String name, int points, bool isTop) {
    final color = rank == 1
        ? Colors.amber
        : rank == 2
            ? Colors.grey
            : rank == 3
                ? Colors.orange
                : Colors.transparent;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          '$rank',
          style: TextStyle(
            color: rank <= 3 ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: rank <= 3 ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      trailing: Text(
        '$points pts',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

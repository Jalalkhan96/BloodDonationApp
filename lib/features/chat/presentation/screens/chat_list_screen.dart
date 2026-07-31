import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildChatItem(
            context,
            name: 'Priya Sharma',
            lastMessage: 'Thank you so much for coming!',
            time: '2m ago',
            unread: 2,
            onTap: () => context.push('/chat/chat_001'),
          ),
          _buildChatItem(
            context,
            name: 'AIIMS Blood Bank',
            lastMessage: 'Your donation has been verified.',
            time: '1h ago',
            unread: 0,
            onTap: () => context.push('/chat/chat_002'),
          ),
          _buildChatItem(
            context,
            name: 'Dr. Mehta',
            lastMessage: 'Please bring your medical reports.',
            time: '3h ago',
            unread: 0,
            onTap: () => context.push('/chat/chat_003'),
          ),
          _buildChatItem(
            context,
            name: 'Rahul Kumar',
            lastMessage: 'I am on my way to the hospital.',
            time: '5h ago',
            unread: 0,
            onTap: () => context.push('/chat/chat_004'),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context, {
    required String name,
    required String lastMessage,
    required String time,
    required int unread,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Text(
          name[0],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: unread > 0 ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: unread > 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.shade500,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: unread > 0 ? null : Colors.grey.shade500,
              ),
            ),
          ),
          if (unread > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$unread',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

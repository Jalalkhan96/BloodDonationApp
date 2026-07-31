import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/common_widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _buildSectionHeader(context, 'Account'),
          ListTile(
            leading: Icon(Icons.person_outlined, color: colorScheme.onSurface),
            title: const Text('Edit Profile'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock_outlined, color: colorScheme.onSurface),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading:
                Icon(Icons.location_on_outlined, color: colorScheme.onSurface),
            title: const Text('Location Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Notifications'),
          SwitchListTile(
            secondary:
                Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
            title: const Text('Push Notifications'),
            value: true,
            onChanged: (v) {},
          ),
          SwitchListTile(
            secondary: Icon(Icons.emergency, color: colorScheme.error),
            title: const Text('Emergency Alerts'),
            subtitle: const Text('Critical alerts bypass Do Not Disturb'),
            value: true,
            onChanged: (v) {},
          ),
          SwitchListTile(
            secondary: Icon(Icons.chat_bubble_outlined,
                color: colorScheme.onSurface),
            title: const Text('Chat Notifications'),
            value: true,
            onChanged: (v) {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Privacy'),
          SwitchListTile(
            secondary: Icon(Icons.location_searching,
                color: colorScheme.onSurface),
            title: const Text('Location Sharing'),
            subtitle:
                const Text('Share location with matched donors'),
            value: true,
            onChanged: (v) {},
          ),
          SwitchListTile(
            secondary: Icon(Icons.leaderboard_outlined,
                color: colorScheme.onSurface),
            title: const Text('Show on Leaderboard'),
            value: true,
            onChanged: (v) {},
          ),
          SwitchListTile(
            secondary:
                Icon(Icons.chat_outlined, color: colorScheme.onSurface),
            title: const Text('Allow Chat'),
            value: true,
            onChanged: (v) {},
          ),
          const Divider(),
          _buildSectionHeader(context, 'Support'),
          ListTile(
            leading:
                Icon(Icons.help_outlined, color: colorScheme.onSurface),
            title: const Text('Help & FAQ'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading:
                Icon(Icons.info_outlined, color: colorScheme.onSurface),
            title: const Text('About LifeLink'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.description_outlined,
                color: colorScheme.onSurface),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.description_outlined,
                color: colorScheme.onSurface),
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.delete_outline, color: colorScheme.error),
            title: Text(
              'Delete Account',
              style: TextStyle(color: colorScheme.error),
            ),
            onTap: () => _showDeleteConfirmation(context),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: colorScheme.error),
            title: Text(
              'Sign Out',
              style: TextStyle(color: colorScheme.error),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'LifeLink v1.0.0',
              style: TextStyle(
                color: colorScheme.outline,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: colorScheme.primary,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    AppDialog.show(
      context: context,
      title: 'Delete Account',
      message:
          'This action is permanent. Your donation history will be anonymized for legal retention requirements.',
      confirmLabel: 'Delete',
      isDestructive: true,
    );
  }
}

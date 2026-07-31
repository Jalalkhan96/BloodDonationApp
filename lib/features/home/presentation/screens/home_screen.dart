import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final colorScheme = Theme.of(context).colorScheme;

    int selectedIndex = 0;
    String currentRoute = '/donor';
    if (location.startsWith('/donor')) {
      selectedIndex = 0;
      currentRoute = '/donor';
    } else if (location.startsWith('/patient')) {
      selectedIndex = 1;
      currentRoute = '/patient';
    } else if (location.startsWith('/maps')) {
      selectedIndex = 2;
      currentRoute = '/maps';
    } else if (location.startsWith('/chat')) {
      selectedIndex = 3;
      currentRoute = '/chat';
    } else if (location.startsWith('/notifications')) {
      selectedIndex = 4;
      currentRoute = '/notifications';
    } else if (location.startsWith('/hospital')) {
      selectedIndex = 1;
      currentRoute = '/hospital';
    } else if (location.startsWith('/blood-bank')) {
      selectedIndex = 1;
      currentRoute = '/blood-bank';
    } else if (location.startsWith('/admin')) {
      selectedIndex = 0;
      currentRoute = '/admin';
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/donor');
            case 1:
              context.go('/patient');
            case 2:
              context.go('/maps');
            case 3:
              context.go('/chat');
            case 4:
              context.go('/notifications');
          }
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: colorScheme.outline),
            selectedIcon: Icon(Icons.home, color: colorScheme.primary),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined, color: colorScheme.outline),
            selectedIcon: Icon(Icons.search, color: colorScheme.primary),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined, color: colorScheme.outline),
            selectedIcon: Icon(Icons.map, color: colorScheme.primary),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline, color: colorScheme.outline),
            selectedIcon: Icon(Icons.chat_bubble, color: colorScheme.primary),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined, color: colorScheme.outline),
            selectedIcon: Icon(Icons.notifications, color: colorScheme.primary),
            label: 'Alerts',
          ),
        ],
      ),
      floatingActionButton:
          currentRoute == '/donor' || currentRoute == '/patient'
              ? FloatingActionButton.extended(
                  onPressed: () => context.push('/create-request'),
                  icon: const Icon(Icons.add),
                  label: const Text('New Request'),
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                )
              : null,
    );
  }
}

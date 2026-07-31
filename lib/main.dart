import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(environment: 'production', firebaseProjectId: 'eran-799fb');
  runApp(
    const ProviderScope(
      child: LifeLinkApp(),
    ),
  );
}

class LifeLinkApp extends ConsumerWidget {
  const LifeLinkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'LifeLink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}

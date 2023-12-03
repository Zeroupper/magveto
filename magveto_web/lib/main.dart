import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto_web/base/routes/routes.dart';
import 'package:magveto_web/base/theme/magveto_theme.dart';
import 'package:magveto_web/firebase_options.dart';

void main() async {
  final router = GoRouter(
    routes: $appRoutes,
    initialLocation: const HomeRoute().location,
  );

  final theme = MagvetoTheme();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: theme.light,
        // darkTheme: theme.dark,
      ),
    ),
  );
}

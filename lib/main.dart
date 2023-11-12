import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto/base/routes/routes.dart';
import 'package:magveto/base/theme/magveto_theme.dart';

void main() {
  final router = GoRouter(routes: $appRoutes);

  final theme = MagvetoTheme();

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

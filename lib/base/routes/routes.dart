import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto/features/main/presentation/main_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MainScreen();
}

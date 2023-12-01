import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto/features/gallery/presentation/gallery_screen.dart';
import 'package:magveto/features/hk_camp/presentation/hk_camp_screen.dart';
import 'package:magveto/features/home/presentation/home_screen.dart.dart';
import 'package:magveto/features/praise/presentation/praise_screen.dart';
import 'package:magveto/features/pray_camp/presentation/pray_camp_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: HomeRoute.name,
)
class HomeRoute extends GoRouteData {
  static const name = 'HomeRoute';
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const MainScreen();
}

@TypedGoRoute<HKCampRoute>(
  path: '/hk-camp',
  name: HKCampRoute.name,
)
class HKCampRoute extends GoRouteData {
  static const name = 'HKCampRoute';

  const HKCampRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const HKCampScreen();
}

@TypedGoRoute<PrayCampRoute>(
  path: '/pray-camp',
  name: PrayCampRoute.name,
)
class PrayCampRoute extends GoRouteData {
  static const name = 'PrayCampRoute';
  const PrayCampRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PrayCampScreen();
}

@TypedGoRoute<PraiseRoute>(
  path: '/praise',
  name: PraiseRoute.name,
)
class PraiseRoute extends GoRouteData {
  static const name = 'PraiseRoute';
  const PraiseRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PraiseScreen();
}

@TypedGoRoute<GalleryRoute>(
  path: '/gallery',
  name: GalleryRoute.name,
)
class GalleryRoute extends GoRouteData {
  static const name = 'GalleryRoute';
  const GalleryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GalleryScreen();
}

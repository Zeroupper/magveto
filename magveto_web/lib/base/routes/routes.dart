import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto_web/features/gallery/presentation/gallery_screen.dart';
import 'package:magveto_web/features/hk_camp/presentation/hk_camp_screen.dart';
import 'package:magveto_web/features/home/presentation/home_screen.dart.dart';
import 'package:magveto_web/features/praise/presentation/praise_screen.dart';
import 'package:magveto_web/features/pray_camp/presentation/pray_camp_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: HomeRoute.name,
)
class HomeRoute extends GoRouteData {
  static const name = 'HomeRoute';
  const HomeRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const MainScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
      );
}

@TypedGoRoute<HKCampRoute>(
  path: '/hk-camp',
  name: HKCampRoute.name,
)
class HKCampRoute extends GoRouteData {
  static const name = 'HKCampRoute';

  const HKCampRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HKCampScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
      );
}

@TypedGoRoute<PrayCampRoute>(
  path: '/pray-camp',
  name: PrayCampRoute.name,
)
class PrayCampRoute extends GoRouteData {
  static const name = 'PrayCampRoute';
  const PrayCampRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const PrayCampScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
      );
}

@TypedGoRoute<PraiseRoute>(
  path: '/praise',
  name: PraiseRoute.name,
)
class PraiseRoute extends GoRouteData {
  static const name = 'PraiseRoute';
  const PraiseRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const PraiseScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
      );
}

@TypedGoRoute<GalleryRoute>(
  path: '/gallery',
  name: GalleryRoute.name,
)
class GalleryRoute extends GoRouteData {
  static const name = 'GalleryRoute';
  const GalleryRoute();

  @override
  CustomTransitionPage<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        child: const GalleryScreen(),
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
      );
}

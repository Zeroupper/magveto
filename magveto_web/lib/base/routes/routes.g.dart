// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $magvetoRoute,
      $hKCampRoute,
      $prayCampRoute,
      $praiseRoute,
      $galleryRoute,
    ];

RouteBase get $magvetoRoute => GoRouteData.$route(
      path: '/',
      name: 'MagvetoRoute',
      factory: $MagvetoRouteExtension._fromState,
    );

extension $MagvetoRouteExtension on MagvetoRoute {
  static MagvetoRoute _fromState(GoRouterState state) => MagvetoRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $hKCampRoute => GoRouteData.$route(
      path: '/hk-camp',
      name: 'HKCampRoute',
      factory: $HKCampRouteExtension._fromState,
    );

extension $HKCampRouteExtension on HKCampRoute {
  static HKCampRoute _fromState(GoRouterState state) => const HKCampRoute();

  String get location => GoRouteData.$location(
        '/hk-camp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $prayCampRoute => GoRouteData.$route(
      path: '/pray-camp',
      name: 'PrayCampRoute',
      factory: $PrayCampRouteExtension._fromState,
    );

extension $PrayCampRouteExtension on PrayCampRoute {
  static PrayCampRoute _fromState(GoRouterState state) => const PrayCampRoute();

  String get location => GoRouteData.$location(
        '/pray-camp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $praiseRoute => GoRouteData.$route(
      path: '/praise',
      name: 'PraiseRoute',
      factory: $PraiseRouteExtension._fromState,
    );

extension $PraiseRouteExtension on PraiseRoute {
  static PraiseRoute _fromState(GoRouterState state) => const PraiseRoute();

  String get location => GoRouteData.$location(
        '/praise',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $galleryRoute => GoRouteData.$route(
      path: '/gallery',
      name: 'GalleryRoute',
      factory: $GalleryRouteExtension._fromState,
    );

extension $GalleryRouteExtension on GalleryRoute {
  static GalleryRoute _fromState(GoRouterState state) => const GalleryRoute();

  String get location => GoRouteData.$location(
        '/gallery',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

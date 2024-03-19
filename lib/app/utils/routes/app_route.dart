import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/app_route_keys.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/guards/route_guard.dart';
import 'package:flutter_burger_shop_app/presentation/pages/auth/auth_page_mixin.dart';
import 'package:flutter_burger_shop_app/presentation/pages/home/home_page_mixin.dart';
import 'package:flutter_burger_shop_app/presentation/pages/splash/splash_page_mixin.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends _$AppRoute {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      page: SplashRoute.page,
      path: AppRouteKeys.splash.path,
    ),
    AutoRoute(
      page: AuthRoute.page,
      path: AppRouteKeys.auth.path,
      guards: [RouteGuard()],
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: AppRouteKeys.home.path,
      guards: [RouteGuard()],
    ),
  ];
}

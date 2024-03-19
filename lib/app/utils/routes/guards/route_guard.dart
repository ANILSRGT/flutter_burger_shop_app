import 'package:auto_route/auto_route.dart';
import 'package:flutter_burger_shop_app/app/utils/injections.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/app_route.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/app_route_keys.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_get_user_usecase.dart';

class RouteGuard extends AutoRouteGuard {
  AuthEntity? get user =>
      Injections.instance.get<AuthGetUserUseCase>().execute();

  bool get isAuth => user?.id.isNotEmpty ?? false;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool isAuthPath = resolver.route.path == AppRouteKeys.auth.path;

    if (isAuth ^ isAuthPath) return resolver.next(true);

    if (isAuth) {
      router.push(const HomeRoute());
      return;
    }

    router.push(
      AuthRoute(
        onAuthChanged: () {
          if (isAuth) {
            resolver.next(true);
            router.removeLast();
          }
        },
      ),
    );
  }
}

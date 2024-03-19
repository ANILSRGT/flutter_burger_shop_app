import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page_state.dart';
import 'package:flutter_burger_shop_app/app/utils/constants/image_constants.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/app_route_keys.dart';
import 'package:flutter_burger_shop_app/presentation/pages/splash/splash_page_model.dart';

part 'splash_page.dart';

mixin SplashPageMixin on BasePageState<SplashPage> {
  final SplashPageModel _model = SplashPageModel();

  @override
  void initState() {
    super.initState();
    _model.splashLoad(onLoaded: onLoadedSplash);
  }

  @override
  void dispose() {
    _model.close();
    super.dispose();
  }

  void onLoadedSplash() {
    if (context.mounted) {
      context.router.pushNamed(AppRouteKeys.home.path);
      context.router.removeLast();
    }
  }
}

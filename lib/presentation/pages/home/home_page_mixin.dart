import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page_state.dart';
import 'package:flutter_burger_shop_app/presentation/pages/home/home_page_model.dart';
import 'package:flutter_burger_shop_app/presentation/widgets/text/header_text.dart';

part 'home_page.dart';

mixin HomePageMixin on BasePageState<HomePage> {
  final HomePageModel _model = HomePageModel();

  @override
  void dispose() {
    _model.close();
    super.dispose();
  }
}

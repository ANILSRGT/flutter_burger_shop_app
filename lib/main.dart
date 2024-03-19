import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app.dart';
import 'package:flutter_burger_shop_app/app/utils/app_init.dart';
import 'package:flutter_burger_shop_app/app/utils/injections.dart';

void main() async {
  await AppInit.init();
  await Injections.instance.init();
  runApp(MyApp());
}

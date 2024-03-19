import 'package:flutter/foundation.dart';
import 'package:flutter_burger_shop_app/features/auth/auth_injection.dart';
import 'package:get_it/get_it.dart';

@immutable
final class Injections {
  Injections._();
  static final Injections instance = Injections._();

  final GetIt _getIt = GetIt.instance;

  Future<void> init() async {
    await AuthInjection().inject();
  }

  T get<T extends Object>() => _getIt.get<T>();
}
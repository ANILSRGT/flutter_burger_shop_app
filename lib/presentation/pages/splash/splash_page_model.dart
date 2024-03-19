import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'splash_page_state.dart';

class SplashPageModel extends Cubit<SplashPageState> {
  SplashPageModel() : super(SplashPageStateInitial());

  Future<void> splashLoad({
    required VoidCallback? onLoaded,
  }) async {
    emit(SplashPageStateBusy());
    await Future.delayed(const Duration(seconds: 2));
    onLoaded?.call();
  }
}

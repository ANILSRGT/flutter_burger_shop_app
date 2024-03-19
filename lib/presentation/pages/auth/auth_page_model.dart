import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_burger_shop_app/app/utils/injections.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_signin_with_email_and_password_usecase.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_signup_with_email_and_password_usecase.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

part 'auth_page_state.dart';

class AuthPageModel extends Cubit<AuthPageState> {
  AuthPageModel() : super(const AuthPageState());

  void changeAuthState(bool isSignIn) {
    emit(state.copyWith(isSignIn: isSignIn));
  }

  void toggleAuthState() {
    emit(state.copyWith(isSignIn: !state.isSignIn));
  }

  Future<bool> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isBusy: true));
    final res = await Injections.instance
        .get<AuthSignInWithEmailAndPasswordUseCase>()
        .execute(
          AuthSignInWithEmailAndPasswordParams(
            email: email,
            password: password,
          ),
        );

    if (res.isFail) showToast(res.asFail.message);

    emit(state.copyWith(isBusy: false));

    return res.isSuccess;
  }

  Future<bool> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isBusy: true));
    final res = await Injections.instance
        .get<AuthSignUpWithEmailAndPasswordUseCase>()
        .execute(
          AuthSignUpWithEmailAndPasswordParams(
            email: email,
            password: password,
          ),
        );

    if (res.isFail) showToast(res.asFail.message);

    emit(state.copyWith(isBusy: false));

    return res.isSuccess;
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page_state.dart';
import 'package:flutter_burger_shop_app/app/utils/constants/image_constants.dart';
import 'package:flutter_burger_shop_app/app/utils/extensions/context_extensions.dart';
import 'package:flutter_burger_shop_app/presentation/pages/auth/auth_page_model.dart';
import 'package:flutter_burger_shop_app/presentation/pages/auth/auth_page_validations.dart';
import 'package:flutter_burger_shop_app/presentation/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_burger_shop_app/presentation/widgets/text_form_field/password_text_form_field.dart';
import 'package:flutter_burger_shop_app/presentation/widgets/text/header_text.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

part 'auth_page.dart';

mixin AuthPageMixin on BasePageState<AuthPage> {
  final AuthPageModel _model = AuthPageModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _model.close();
    super.dispose();
  }

  Future<void> _onAuth() async {
    bool isSuccess = false;
    final isValidEmail = _emailController.selection.isValid;
    final isValidPassword = _passwordController.selection.isValid;

    if (!isValidEmail || !isValidPassword) {
      showToast('Please enter valid fields', context: context);
      return;
    }

    if (_model.state.isSignIn) {
      isSuccess = await _model.signInWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else {
      final isValidRepassword = _repasswordController.selection.isValid;

      if (!isValidRepassword) {
        showToast('Please enter valid fields', context: context);
        return;
      }

      isSuccess = await _model.signUpWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }

    if (isSuccess) widget.onAuthChanged();
  }
}

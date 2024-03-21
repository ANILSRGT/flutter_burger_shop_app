import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_burger_shop_app/app/styles/itheme.dart';
import 'package:flutter_burger_shop_app/app/utils/extensions/context_extensions.dart';
import 'package:flutter_burger_shop_app/app/utils/routes/app_route.dart';
import 'package:flutter_burger_shop_app/presentation/blocs/theme/theme_cubit.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: Builder(
        builder: (context) {
          final currentThemeState = context.watch<ThemeCubit>().state;
          return Container(
            color: currentThemeState.currentTheme
                .appColorsFromMode(context)
                .background
                .color,
            child: SafeArea(
              child: StyledToast(
                locale: const Locale('en', 'US'),
                backgroundColor: context.colors().primary.color,
                textStyle: context.ext.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colors().primary.onColor,
                ),
                toastAnimation: StyledToastAnimation.fade,
                reverseAnimation: StyledToastAnimation.fade,
                duration: const Duration(seconds: 4),
                animDuration: const Duration(milliseconds: 500),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Burger Shop',
                  themeMode: currentThemeState.themeMode,
                  theme: currentThemeState.currentTheme.data(false),
                  darkTheme: currentThemeState.currentTheme.data(true),
                  routerConfig: _appRoute.config(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

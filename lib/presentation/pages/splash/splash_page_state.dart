part of 'splash_page_model.dart';

sealed class SplashPageState extends Equatable {
  const SplashPageState();

  @override
  List<Object> get props => [];
}

final class SplashPageStateInitial extends SplashPageState {}

final class SplashPageStateBusy extends SplashPageState {}

final class SplashPageStateFailed extends SplashPageState {
  final String code;
  final String message;
  const SplashPageStateFailed({
    required this.code,
    required this.message,
  });

  @override
  List<Object> get props => [code, message];
}

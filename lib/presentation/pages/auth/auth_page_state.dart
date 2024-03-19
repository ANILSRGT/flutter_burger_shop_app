part of 'auth_page_model.dart';

class AuthPageState extends Equatable {
  final bool isSignIn;
  final bool isBusy;
  const AuthPageState({
    this.isSignIn = true,
    this.isBusy = false,
  });

  @override
  List<Object> get props => [isSignIn, isBusy];

  AuthPageState copyWith({
    bool? isSignIn,
    bool? isBusy,
  }) {
    return AuthPageState(
      isSignIn: isSignIn ?? this.isSignIn,
      isBusy: isBusy ?? this.isBusy,
    );
  }
}

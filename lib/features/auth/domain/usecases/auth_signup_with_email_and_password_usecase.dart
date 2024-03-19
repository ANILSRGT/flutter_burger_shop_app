import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthSignUpWithEmailAndPasswordUseCase extends UseCaseWithParams<
    ResponseModel<AuthEntity>, AuthSignUpWithEmailAndPasswordParams> {
  final AuthRepository _repository;

  AuthSignUpWithEmailAndPasswordUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<AuthEntity>> execute(
    AuthSignUpWithEmailAndPasswordParams params,
  ) async {
    return _repository.signUpWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

final class AuthSignUpWithEmailAndPasswordParams {
  final String email;
  final String password;

  AuthSignUpWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}

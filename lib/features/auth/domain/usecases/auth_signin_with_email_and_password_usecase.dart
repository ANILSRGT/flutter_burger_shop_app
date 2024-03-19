import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthSignInWithEmailAndPasswordUseCase extends UseCaseWithParams<
    ResponseModel<AuthEntity>, AuthSignInWithEmailAndPasswordParams> {
  final AuthRepository _repository;

  AuthSignInWithEmailAndPasswordUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<AuthEntity>> execute(
    AuthSignInWithEmailAndPasswordParams params,
  ) async {
    return _repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

final class AuthSignInWithEmailAndPasswordParams {
  final String email;
  final String password;

  AuthSignInWithEmailAndPasswordParams({
    required this.email,
    required this.password,
  });
}

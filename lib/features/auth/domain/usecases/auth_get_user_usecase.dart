import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthGetUserUseCase extends UseCaseNoFuture<AuthEntity?> {
  final AuthRepository _repository;

  AuthGetUserUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  AuthEntity? execute() {
    return _repository.getUser;
  }
}

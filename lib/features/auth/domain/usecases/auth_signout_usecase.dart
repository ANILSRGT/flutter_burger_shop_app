import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthSignOutUseCase extends UseCase<void> {
  final AuthRepository _repository;

  AuthSignOutUseCase({
    required AuthRepository repository,
  }) : _repository = repository;

  @override
  Future<void> execute() async {
    return _repository.signOut();
  }
}

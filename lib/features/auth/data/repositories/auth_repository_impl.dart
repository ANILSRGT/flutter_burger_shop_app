import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  AuthEntity? get getUser => _remoteDataSource.getUser;

  @override
  Future<ResponseModel<AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _remoteDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async => _remoteDataSource.signOut();

  @override
  Future<ResponseModel<AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _remoteDataSource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

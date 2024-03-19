import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRemoteDataSource {
  AuthEntity? get getUser;
  Future<ResponseModel<AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<ResponseModel<AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}

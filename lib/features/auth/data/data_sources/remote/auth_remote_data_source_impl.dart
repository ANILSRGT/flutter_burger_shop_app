import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_burger_shop_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/entities/auth_entity.dart';

final class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthRemoteDataSourceImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  AuthEntity? get getUser => _firebaseAuth.currentUser != null
      ? AuthEntity(id: _firebaseAuth.currentUser!.uid)
      : null;

  @override
  Future<ResponseModel<AuthEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return const ResponseModelFail<AuthEntity>(
          message: "Sign in failed. Please try again.",
        );
      }

      final user = AuthEntity(id: res.user!.uid);
      return ResponseModelSuccess<AuthEntity>(data: user);
    } catch (e) {
      return const ResponseModelFail<AuthEntity>(
        message: "An error occurred while signing in. Please try again.",
      );
    }
  }

  @override
  Future<ResponseModel<AuthEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user == null) {
        return const ResponseModelFail<AuthEntity>(
          message: "Sign up failed. Please try again.",
        );
      }

      final user = AuthEntity(id: res.user!.uid);
      return ResponseModelSuccess<AuthEntity>(data: user);
    } catch (e) {
      return const ResponseModelFail<AuthEntity>(
        message: "An error occurred while signing up. Please try again.",
      );
    }
  }

  @override
  Future<void> signOut() async => _firebaseAuth.signOut();
}

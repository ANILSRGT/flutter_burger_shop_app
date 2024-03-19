import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_burger_shop_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/auth/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:flutter_burger_shop_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_get_user_usecase.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_signin_with_email_and_password_usecase.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_signout_usecase.dart';
import 'package:flutter_burger_shop_app/features/auth/domain/usecases/auth_signup_with_email_and_password_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_burger_shop_app/features/injection.dart';

final class AuthInjection extends Injection {
  @override
  Future<void> inject() async {
    final sl = GetIt.instance;

    //* Dependencies
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    //* Data sources
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl(
      firebaseAuth: firebaseAuth,
    );

    //* Repositories
    final AuthRepository authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
    );

    //* Use cases
    sl.registerSingleton(AuthGetUserUseCase(
      repository: authRepository,
    ));
    sl.registerSingleton(AuthSignUpWithEmailAndPasswordUseCase(
      repository: authRepository,
    ));
    sl.registerSingleton(AuthSignInWithEmailAndPasswordUseCase(
      repository: authRepository,
    ));
    sl.registerSingleton(AuthSignOutUseCase(
      repository: authRepository,
    ));
  }
}

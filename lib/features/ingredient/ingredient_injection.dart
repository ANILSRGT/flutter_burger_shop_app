import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_category_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_category_remote_data_source_impl.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_remote_data_source_impl.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/repositories/ingredient_category_repository_impl.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/repositories/ingredient_repository_impl.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_category_repository.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_repository.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/usecases/ingredient_category_get_all_usecase.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/usecases/ingredient_category_get_by_id_usecase.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/usecases/ingredient_get_all_usecase.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/usecases/ingredient_get_by_id_usecase.dart';
import 'package:flutter_burger_shop_app/features/injection.dart';
import 'package:get_it/get_it.dart';

final class IngredientInjection extends Injection {
  @override
  Future<void> inject() async {
    final sl = GetIt.instance;

    //* Dependencies
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    //* Data sources
    final IngredientRemoteDataSource ingredientRemoteDataSource =
        IngredientRemoteDataSourceImpl(
      firestore: firestore,
    );
    final IngredientCategoryRemoteDataSource
        ingredientCategoryRemoteDataSource =
        IngredientCategoryRemoteDataSourceImpl(
      firestore: firestore,
    );

    //* Repositories
    final IngredientRepository ingredientRepository = IngredientRepositoryImpl(
      remoteDataSource: ingredientRemoteDataSource,
    );
    final IngredientCategoryRepository ingredientCategoryRepository =
        IngredientCategoryRepositoryImpl(
      remoteDataSource: ingredientCategoryRemoteDataSource,
    );

    //* Use cases
    sl.registerSingleton(
        IngredientGetAllUseCase(repository: ingredientRepository));
    sl.registerSingleton(
        IngredientGetByIdUseCase(repository: ingredientRepository));
    sl.registerSingleton(IngredientCategoryGetAllUseCase(
      repository: ingredientCategoryRepository,
    ));
    sl.registerSingleton(IngredientCategoryGetByIdUseCase(
      repository: ingredientCategoryRepository,
    ));
  }
}

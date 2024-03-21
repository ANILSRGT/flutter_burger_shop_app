import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_repository.dart';

final class IngredientRepositoryImpl extends IngredientRepository {
  final IngredientRemoteDataSource _remoteDataSource;

  IngredientRepositoryImpl({
    required IngredientRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<ResponseModel<IngredientEntity>> getIngredient(String id) {
    return _remoteDataSource.getIngredient(id);
  }

  @override
  Future<ResponseModel<List<IngredientEntity>>> getIngredients() {
    return _remoteDataSource.getIngredients();
  }
}

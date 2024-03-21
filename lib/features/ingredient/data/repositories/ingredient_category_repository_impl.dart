import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_category_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_category_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_category_repository.dart';

final class IngredientCategoryRepositoryImpl
    extends IngredientCategoryRepository {
  final IngredientCategoryRemoteDataSource _remoteDataSource;

  IngredientCategoryRepositoryImpl({
    required IngredientCategoryRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<ResponseModel<IngredientCategoryEntity>> getIngredientCategory(
      String id) {
    return _remoteDataSource.getIngredientCategory(id);
  }

  @override
  Future<ResponseModel<List<IngredientCategoryEntity>>>
      getIngredientCategories() {
    return _remoteDataSource.getIngredientCategories();
  }
}

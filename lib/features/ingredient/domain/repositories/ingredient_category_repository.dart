import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_category_entity.dart';

abstract class IngredientCategoryRepository {
  Future<ResponseModel<List<IngredientCategoryEntity>>>
      getIngredientCategories();
  Future<ResponseModel<IngredientCategoryEntity>> getIngredientCategory(
      String id);
}

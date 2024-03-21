import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_entity.dart';

abstract class IngredientRepository {
  Future<ResponseModel<List<IngredientEntity>>> getIngredients();
  Future<ResponseModel<IngredientEntity>> getIngredient(String id);
}

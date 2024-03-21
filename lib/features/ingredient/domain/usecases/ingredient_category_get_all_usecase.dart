import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_category_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_category_repository.dart';

final class IngredientCategoryGetAllUseCase
    extends UseCase<ResponseModel<List<IngredientCategoryEntity>>> {
  final IngredientCategoryRepository _repository;

  IngredientCategoryGetAllUseCase({
    required IngredientCategoryRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<List<IngredientCategoryEntity>>> execute() async {
    return _repository.getIngredientCategories();
  }
}

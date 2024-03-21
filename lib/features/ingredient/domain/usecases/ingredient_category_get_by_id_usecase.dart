import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_category_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_category_repository.dart';

final class IngredientCategoryGetByIdUseCase extends UseCaseWithParams<
    ResponseModel<IngredientCategoryEntity>,
    IngredientCategoryGetByIdUseCaseParams> {
  final IngredientCategoryRepository _repository;

  IngredientCategoryGetByIdUseCase({
    required IngredientCategoryRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<IngredientCategoryEntity>> execute(
    IngredientCategoryGetByIdUseCaseParams params,
  ) async {
    return _repository.getIngredientCategory(params.id);
  }
}

final class IngredientCategoryGetByIdUseCaseParams {
  final String id;

  IngredientCategoryGetByIdUseCaseParams({
    required this.id,
  });
}

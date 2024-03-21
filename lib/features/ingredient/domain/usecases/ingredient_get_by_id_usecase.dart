import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_repository.dart';

final class IngredientGetByIdUseCase extends UseCaseWithParams<
    ResponseModel<IngredientEntity>, IngredientGetByIdUseCaseParams> {
  final IngredientRepository _repository;

  IngredientGetByIdUseCase({
    required IngredientRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<IngredientEntity>> execute(
    IngredientGetByIdUseCaseParams params,
  ) async {
    return _repository.getIngredient(params.id);
  }
}

final class IngredientGetByIdUseCaseParams {
  final String id;

  IngredientGetByIdUseCaseParams({
    required this.id,
  });
}

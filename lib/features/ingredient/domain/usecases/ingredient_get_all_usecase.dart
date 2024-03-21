import 'package:core/core.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_entity.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/repositories/ingredient_repository.dart';

final class IngredientGetAllUseCase
    extends UseCase<ResponseModel<List<IngredientEntity>>> {
  final IngredientRepository _repository;

  IngredientGetAllUseCase({
    required IngredientRepository repository,
  }) : _repository = repository;

  @override
  Future<ResponseModel<List<IngredientEntity>>> execute() async {
    return _repository.getIngredients();
  }
}

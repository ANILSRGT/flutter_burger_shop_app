import 'package:core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_entity.dart';

final class IngredientRemoteDataSourceImpl extends IngredientRemoteDataSource {
  IngredientRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference get _ingredientCollection =>
      _firestore.collection('ingredients');

  @override
  Future<ResponseModel<List<IngredientEntity>>> getIngredients() async {
    try {
      final ingredients = await _ingredientCollection.get();

      final List<IngredientEntity> ingredientList = [];
      for (var ingredient in ingredients.docs) {
        if (!ingredient.exists || ingredient.data() == null) continue;
        final data = ingredient.data() as Map<String, dynamic>;
        final toEntity = IngredientEntity.fromJson(data);
        ingredientList.add(toEntity);
      }

      return ResponseModelSuccess(data: ingredientList);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred!",
      );
    }
  }

  @override
  Future<ResponseModel<IngredientEntity>> getIngredient(String id) async {
    try {
      final ingredient = await _ingredientCollection.doc(id).get();

      if (!ingredient.exists || ingredient.data() == null) {
        return const ResponseModelFail(message: "Ingredient not found!");
      }

      final data = ingredient.data() as Map<String, dynamic>;
      final toEntity = IngredientEntity.fromJson(data);
      return ResponseModelSuccess(data: toEntity);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred!",
      );
    }
  }
}

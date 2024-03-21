import 'package:core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_burger_shop_app/features/ingredient/data/data_sources/remote/ingredient_category_remote_data_source.dart';
import 'package:flutter_burger_shop_app/features/ingredient/domain/entities/ingredient_category_entity.dart';

final class IngredientCategoryRemoteDataSourceImpl
    extends IngredientCategoryRemoteDataSource {
  IngredientCategoryRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  CollectionReference get _ingredientCategoryCollection =>
      _firestore.collection('ingredient_categories');

  @override
  Future<ResponseModel<List<IngredientCategoryEntity>>>
      getIngredientCategories() async {
    try {
      final categories = await _ingredientCategoryCollection.get();

      final List<IngredientCategoryEntity> categoryList = [];
      for (var category in categories.docs) {
        if (!category.exists || category.data() == null) continue;
        final data = category.data() as Map<String, dynamic>;
        final toEntity = IngredientCategoryEntity.fromJson(data);
        categoryList.add(toEntity);
      }

      return ResponseModelSuccess(data: categoryList);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred!",
      );
    }
  }

  @override
  Future<ResponseModel<IngredientCategoryEntity>> getIngredientCategory(
      String id) async {
    try {
      final category = await _ingredientCategoryCollection.doc(id).get();

      if (!category.exists || category.data() == null) {
        return const ResponseModelFail(message: "Ingredient not found!");
      }

      final data = category.data() as Map<String, dynamic>;
      final toEntity = IngredientCategoryEntity.fromJson(data);
      return ResponseModelSuccess(data: toEntity);
    } catch (e) {
      return const ResponseModelFail(
        message: "An error occurred!",
      );
    }
  }
}

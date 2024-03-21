// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientEntity _$IngredientEntityFromJson(Map<String, dynamic> json) =>
    IngredientEntity(
      id: json['id'] as String?,
      categoryId: json['category_id'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discount_price'] as num).toDouble(),
    );

Map<String, dynamic> _$IngredientEntityToJson(IngredientEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'price': instance.price,
      'discount_price': instance.discountPrice,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemEntity _$OrderItemEntityFromJson(Map<String, dynamic> json) =>
    OrderItemEntity(
      ingredientIds: (json['ingredient_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalPrice: (json['total_price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemEntityToJson(OrderItemEntity instance) =>
    <String, dynamic>{
      'ingredient_ids': instance.ingredientIds,
      'total_price': instance.totalPrice,
    };

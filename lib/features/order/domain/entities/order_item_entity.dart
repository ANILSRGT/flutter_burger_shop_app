import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class OrderItemEntity with EquatableMixin {
  OrderItemEntity({
    required this.ingredientIds,
    required this.totalPrice,
  });

  @JsonKey(name: 'ingredient_ids')
  final List<String> ingredientIds;

  @JsonKey(name: 'total_price')
  final double totalPrice;

  @override
  List<Object?> get props => [ingredientIds, totalPrice];

  factory OrderItemEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemEntityToJson(this);

  static List<OrderItemEntity> fromJsonList(List? json) {
    return json?.map((data) => OrderItemEntity.fromJson(data)).toList() ?? [];
  }

  OrderItemEntity copyWith({
    List<String>? ingredientIds,
    double? totalPrice,
  }) {
    return OrderItemEntity(
      ingredientIds: ingredientIds ?? this.ingredientIds,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}

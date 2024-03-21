import 'package:equatable/equatable.dart';
import 'package:flutter_burger_shop_app/features/order/domain/entities/order_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class OrderEntity with EquatableMixin {
  OrderEntity({
    this.id,
    required this.orderItems,
    required this.totalPrice,
    this.cancelledAt,
  });

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'order_items')
  final List<OrderItemEntity> orderItems;

  @JsonKey(name: 'total_price')
  final double totalPrice;

  @JsonKey(name: 'cancelled_at')
  final DateTime? cancelledAt;

  @override
  List<Object?> get props => [id, orderItems, totalPrice, cancelledAt];

  factory OrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrderEntityToJson(this);

  static List<OrderEntity> fromJsonList(List? json) {
    return json?.map((data) => OrderEntity.fromJson(data)).toList() ?? [];
  }

  OrderEntity copyWith({
    List<OrderItemEntity>? orderItems,
    double? totalPrice,
    DateTime? cancelledAt,
  }) {
    return OrderEntity(
      orderItems: orderItems ?? this.orderItems,
      totalPrice: totalPrice ?? this.totalPrice,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }
}

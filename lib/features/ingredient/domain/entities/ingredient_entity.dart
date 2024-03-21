import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class IngredientEntity with EquatableMixin {
  IngredientEntity({
    this.id,
    required this.categoryId,
    required this.price,
    required this.discountPrice,
  });

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: "category_id")
  final String categoryId;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'discount_price')
  final double discountPrice;

  @override
  List<Object?> get props => [id, categoryId, price, discountPrice];

  factory IngredientEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientEntityToJson(this);

  static List<IngredientEntity> fromJsonList(List? json) {
    return json?.map((data) => IngredientEntity.fromJson(data)).toList() ?? [];
  }

  IngredientEntity copyWith({
    String? categoryId,
    double? price,
    double? discountPrice,
  }) {
    return IngredientEntity(
      id: id,
      categoryId: categoryId ?? this.categoryId,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
    );
  }
}

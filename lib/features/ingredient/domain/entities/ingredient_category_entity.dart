import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_category_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class IngredientCategoryEntity with EquatableMixin {
  IngredientCategoryEntity({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String? name;

  @override
  List<Object?> get props => [id];

  factory IngredientCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientCategoryEntityToJson(this);

  static List<IngredientCategoryEntity> fromJsonList(List? json) {
    return json
            ?.map((data) => IngredientCategoryEntity.fromJson(data))
            .toList() ??
        [];
  }

  IngredientCategoryEntity copyWith({
    String? name,
  }) {
    return IngredientCategoryEntity(
      id: id,
      name: name ?? this.name,
    );
  }
}

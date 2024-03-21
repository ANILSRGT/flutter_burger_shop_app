import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class IngredientEntity with EquatableMixin {
  IngredientEntity({
    required this.id,
  });

  @JsonKey(name: 'id')
  final String id;

  @override
  List<Object?> get props => [id];

  factory IngredientEntity.fromJson(Map<String, dynamic> json) =>
      _$IngredientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientEntityToJson(this);

  static List<IngredientEntity> fromJsonList(List? json) {
    return json?.map((data) => IngredientEntity.fromJson(data)).toList() ?? [];
  }

  IngredientEntity copyWith() {
    return IngredientEntity(
      id: id,
    );
  }
}

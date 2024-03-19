import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class AuthEntity with EquatableMixin {
  @JsonKey(name: 'id')
  final String id;

  AuthEntity({
    required this.id,
  });

  @override
  List<Object?> get props => [id];

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthEntityToJson(this);

  static List<AuthEntity> fromJsonList(List? json) {
    return json?.map((data) => AuthEntity.fromJson(data)).toList() ?? [];
  }
}

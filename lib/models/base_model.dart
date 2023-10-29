import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  @JsonKey(name: 'ID')
  final int id;

  @JsonKey(name: 'CreatedAt')
  final String createdAt;

  @JsonKey(name: 'UpdatedAt')
  final String updatedAt;

  @JsonKey(name: 'DeletedAt')
  final String? deletedAt;

  BaseModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  @override
  String toString() => 'BaseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}

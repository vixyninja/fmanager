import 'package:fmanager/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseModel {
  @JsonKey(name: 'CategoryName', defaultValue: '')
  final String categoryName;

  @JsonKey(name: 'CategoryType', defaultValue: '')
  final String categoryType;

  CategoryModel({
    required this.categoryName,
    required this.categoryType,
    required super.createdAt,
    required super.updatedAt,
    required super.deletedAt,
    required super.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryModel copyWith({
    String? categoryName,
    String? categoryType,
  }) {
    return CategoryModel(
      categoryName: categoryName ?? this.categoryName,
      categoryType: categoryType ?? this.categoryType,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      id: id,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, categoryName: $categoryName, categoryType: $categoryType)';
  }
}

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
    required int id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    required this.categoryName,
    required this.categoryType,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  CategoryModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? categoryName,
    String? categoryType,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      categoryName: categoryName ?? this.categoryName,
      categoryType: categoryType ?? this.categoryType,
    );
  }

  @override
  String toString() {
    return 'CategoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, categoryName: $categoryName, categoryType: $categoryType)';
  }
}

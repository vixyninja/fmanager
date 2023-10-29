import 'package:fmanager/models/base_model.dart';
import 'package:fmanager/models/typedef.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel {
  @JsonKey(name: 'Name', defaultValue: '')
  final String name;

  @JsonKey(name: 'Email', defaultValue: '')
  final String email;

  @JsonKey(name: 'PhoneNumber', defaultValue: '')
  final String phoneNumber;

  @JsonKey(name: 'Url', defaultValue: '')
  final String url;

  @JsonKey(name: 'Role', defaultValue: RoleEnum.NONE)
  final RoleEnum role;

  @JsonKey(name: 'Position', defaultValue: '')
  final String position;

  @JsonKey(name: 'Department', defaultValue: '')
  final String department;

  UserModel({
    required int id,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.url,
    required this.role,
    required this.position,
    required this.department,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? name,
    String? email,
    String? phoneNumber,
    String? url,
    RoleEnum? role,
    String? position,
    String? department,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      url: url ?? this.url,
      role: role ?? this.role,
      position: position ?? this.position,
      department: department ?? this.department,
    );
  }

  @override
  String toString() =>
      'UserModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, name: $name, email: $email, phoneNumber: $phoneNumber, url: $url, role: $role, position: $position, department: $department)';

  factory UserModel.createEmptyInstance() => UserModel(
        id: -1,
        createdAt: '',
        updatedAt: '',
        deletedAt: '',
        name: '',
        email: '',
        phoneNumber: '',
        url: '',
        role: RoleEnum.NONE,
        position: '',
        department: '',
      );
}

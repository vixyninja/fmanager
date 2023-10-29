// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['ID'] as int,
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
      deletedAt: json['DeletedAt'] as String?,
      name: json['Name'] as String? ?? '',
      email: json['Email'] as String? ?? '',
      phoneNumber: json['PhoneNumber'] as String? ?? '',
      url: json['Url'] as String? ?? '',
      role:
          $enumDecodeNullable(_$RoleEnumEnumMap, json['Role']) ?? RoleEnum.NONE,
      position: json['Position'] as String? ?? '',
      department: json['Department'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'Name': instance.name,
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
      'Url': instance.url,
      'Role': _$RoleEnumEnumMap[instance.role]!,
      'Position': instance.position,
      'Department': instance.department,
    };

const _$RoleEnumEnumMap = {
  RoleEnum.TEACHER: 'TEACHER',
  RoleEnum.ADMIN: 'ADMIN',
  RoleEnum.STAFF: 'STAFF',
  RoleEnum.NONE: 'NONE',
};

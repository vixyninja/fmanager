// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      id: json['ID'] as int,
      createdAt: json['CreatedAt'] as String,
      updatedAt: json['UpdatedAt'] as String,
      deletedAt: json['DeletedAt'] as String?,
      roomName: json['RoomName'] as String? ?? '',
      floor: json['Floor'] as int? ?? -1,
      building: json['Building'] as String? ?? '',
      status: json['Status'] as int? ?? -1,
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'ID': instance.id,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'RoomName': instance.roomName,
      'Floor': instance.floor,
      'Building': instance.building,
      'Status': instance.status,
    };

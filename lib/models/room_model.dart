import 'package:fmanager/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel extends BaseModel {
  @JsonKey(name: 'RoomName', defaultValue: '')
  final String roomName;

  @JsonKey(name: 'Floor', defaultValue: -1)
  final int floor;

  @JsonKey(name: 'Building', defaultValue: '')
  final String building;

  @JsonKey(name: 'Status', defaultValue: -1)
  final int status;

  RoomModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
    required this.roomName,
    required this.floor,
    required this.building,
    required this.status,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomModelToJson(this);

  RoomModel copyWith({
    String? roomName,
    int? floor,
    String? building,
    int? status,
  }) {
    return RoomModel(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      roomName: roomName ?? this.roomName,
      floor: floor ?? this.floor,
      building: building ?? this.building,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'RoomModel{id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, roomName: $roomName, floor: $floor, building: $building, status: $status}';
  }

  factory RoomModel.createEmpty() {
    return RoomModel(
      id: -1,
      createdAt: '',
      updatedAt: '',
      deletedAt: '',
      roomName: '',
      floor: -1,
      building: '',
      status: -1,
    );
  }
}

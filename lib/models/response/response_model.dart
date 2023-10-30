import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: 'statusCode', defaultValue: 0)
  final int statusCode;

  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @JsonKey(name: 'data', defaultValue: null)
  final dynamic data;

  ResponseModel({required this.statusCode, required this.message, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

  @override
  String toString() => 'ResponseModel(statusCode: $statusCode, message: $message, data: $data)';
}

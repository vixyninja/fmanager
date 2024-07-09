import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel {
  @JsonKey(name: 'accessToken', defaultValue: '')
  final String accessToken;

  @JsonKey(name: 'refreshToken', defaultValue: '')
  final String refreshToken;

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  String toString() {
    return 'TokenModel{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}

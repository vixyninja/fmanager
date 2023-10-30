// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedBackModel _$FeedBackModelFromJson(Map<String, dynamic> json) =>
    FeedBackModel(
      id: json['id'] as num? ?? 0,
      nameFeedback: json['name_feed_back'] as String? ?? '',
      room: json['room'] == null
          ? RoomModel.createEmpty()
          : RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      category: json['category'] == null
          ? CategoryModel.createEmpty()
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      user: json['user'] == null
          ? UserModel.createEmptyInstance()
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      url: (json['url'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );

Map<String, dynamic> _$FeedBackModelToJson(FeedBackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_feed_back': instance.nameFeedback,
      'room': instance.room,
      'description': instance.description,
      'category': instance.category,
      'user': instance.user,
      'url': instance.url,
    };

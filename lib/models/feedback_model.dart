import 'package:fmanager/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedBackModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final num id;

  @JsonKey(name: 'name_feed_back', defaultValue: '')
  final String nameFeedback;

  @JsonKey(name: 'room', defaultValue: RoomModel.createEmpty)
  final RoomModel room;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @JsonKey(name: 'category', defaultValue: CategoryModel.createEmpty)
  final CategoryModel category;

  @JsonKey(name: 'user', defaultValue: UserModel.createEmptyInstance)
  final UserModel user;

  @JsonKey(name: 'url', defaultValue: [])
  final List<String> url;

  const FeedBackModel({
    required this.id,
    required this.nameFeedback,
    required this.room,
    required this.description,
    required this.category,
    required this.user,
    required this.url,
  });

  factory FeedBackModel.fromJson(Map<String, dynamic> json) => _$FeedBackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedBackModelToJson(this);

  factory FeedBackModel.createEmpty() {
    return FeedBackModel(
      id: 0,
      nameFeedback: '',
      room: RoomModel.createEmpty(),
      description: '',
      category: CategoryModel.createEmpty(),
      user: UserModel.createEmptyInstance(),
      url: [],
    );
  }

  FeedBackModel copyWith({
    num? id,
    String? nameFeedback,
    RoomModel? room,
    String? description,
    CategoryModel? category,
    UserModel? user,
    List<String>? url,
  }) {
    return FeedBackModel(
      id: id ?? this.id,
      nameFeedback: nameFeedback ?? this.nameFeedback,
      room: room ?? this.room,
      description: description ?? this.description,
      category: category ?? this.category,
      user: user ?? this.user,
      url: url ?? this.url,
    );
  }
}

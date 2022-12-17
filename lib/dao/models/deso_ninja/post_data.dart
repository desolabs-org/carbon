import 'package:json_annotation/json_annotation.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData {

  final String? id;
  final String? author;

  final String? body;
  final List<String>? images;
  final List<String>? videos;
  final String? parentId;
  final String? quotedId;

  PostData({this.id, this.author,
    this.body, this.images, this.videos, this.parentId, this.quotedId
  }) : super();

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

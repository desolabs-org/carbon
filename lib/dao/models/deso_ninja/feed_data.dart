import 'package:carbon/dao/models/deso_ninja/post_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feed_data.g.dart';

@JsonSerializable()
class FeedData {
  final String? id;
  final int? lastStamp;
  final List<PostData>? posts;

  FeedData({this.id, this.lastStamp, this.posts}): super();

  factory FeedData.fromJson(Map<String, dynamic> json) => _$FeedDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeedDataToJson(this);
}

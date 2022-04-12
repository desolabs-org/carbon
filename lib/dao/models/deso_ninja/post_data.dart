import 'package:carbon/dao/models/deso_ninja/profile_data.dart';
import 'package:carbon/dao/models/deso_ninja/related_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData {

  final List<int>? id;
  final String? author;
  final List<RelatedData>? mentions;
  final List<String>? langs;
  final int? rating;
  final int? comments;
  final int? likes;
  final int? diamonds;
  final int? reclouts;
  final int? quotes;
  final String? body;
  final List<String>? images;
  final List<String>? videos;
  final List<int>? parentId;
  final List<PostData>? quoting;
  final ProfileData? profile;
  final String? timestamp;
  final bool? pinned;
  final bool? mempool;
  final bool? hidden;
  final String? nodeId;
  final bool? nft;

  PostData({this.id, this.author, this.mentions, this.langs, this.rating,
    this.comments, this.likes, this.diamonds, this.reclouts, this.quotes, this.body,
    this.images, this.videos, this.parentId, this.quoting, this.profile, this.timestamp,
    this.pinned, this.mempool, this.hidden, this.nodeId, this.nft
  }) : super();

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

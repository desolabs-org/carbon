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

@JsonSerializable()
class PostData {

  final List<int>? id;
  final List<int>? author;
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
  final AccountData? accountData;
  final String? timestamp;
  final bool? pinned;
  final bool? mempool;
  final bool? hidden;
  final String? nodeId;
  final bool? nft;

  PostData({this.id, this.author, this.mentions, this.langs, this.rating,
    this.comments, this.likes, this.diamonds, this.reclouts, this.quotes, this.body,
    this.images, this.videos, this.parentId, this.quoting, this.accountData, this.timestamp,
    this.pinned, this.mempool, this.hidden, this.nodeId, this.nft
  }) : super();

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

@JsonSerializable()
class RelatedData {
  final List<int>? key;
  final int? kind;

  RelatedData({this.key, this.kind}): super();

  factory RelatedData.fromJson(Map<String, dynamic> json) => _$RelatedDataFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedDataToJson(this);
}

@JsonSerializable()
class AccountCoinData {
  final int? basis;
  final int? locked;
  final int? holders;
  final int? coins;
  final int? mark;

  AccountCoinData({this.basis, this.locked, this.holders, this.coins, this.mark}): super();

  factory AccountCoinData.fromJson(Map<String, dynamic> json) => _$AccountCoinDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCoinDataToJson(this);
}

@JsonSerializable()
class AccountData {
  final String? stamp;
  final String? nick;
  final String? about;
  final bool? hidden;
  final bool? verified;
  final AccountCoinData? coin;
  final int? price;
  final int? stake;

  AccountData({
    this.stamp, this.nick, this.about, this.hidden, this.verified, this.coin, this.price, this.stake
  }): super();

  factory AccountData.fromJson(Map<String, dynamic> json) => _$AccountDataFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDataToJson(this);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedData _$FeedDataFromJson(Map<String, dynamic> json) => FeedData(
      id: json['id'] as String?,
      lastStamp: json['lastStamp'] as int?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => PostData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedDataToJson(FeedData instance) => <String, dynamic>{
      'id': instance.id,
      'lastStamp': instance.lastStamp,
      'posts': instance.posts,
    };

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      author: json['author'] as String?,
      mentions: (json['mentions'] as List<dynamic>?)
          ?.map((e) => RelatedData.fromJson(e as Map<String, dynamic>))
          .toList(),
      langs:
          (json['langs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rating: json['rating'] as int?,
      comments: json['comments'] as int?,
      likes: json['likes'] as int?,
      diamonds: json['diamonds'] as int?,
      reclouts: json['reclouts'] as int?,
      quotes: json['quotes'] as int?,
      body: json['body'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parentId:
          (json['parentId'] as List<dynamic>?)?.map((e) => e as int).toList(),
      quoting: (json['quoting'] as List<dynamic>?)
          ?.map((e) => PostData.fromJson(e as Map<String, dynamic>))
          .toList(),
      accountData: json['accountData'] == null
          ? null
          : AccountData.fromJson(json['accountData'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
      pinned: json['pinned'] as bool?,
      mempool: json['mempool'] as bool?,
      hidden: json['hidden'] as bool?,
      nodeId: json['nodeId'] as String?,
      nft: json['nft'] as bool?,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'mentions': instance.mentions,
      'langs': instance.langs,
      'rating': instance.rating,
      'comments': instance.comments,
      'likes': instance.likes,
      'diamonds': instance.diamonds,
      'reclouts': instance.reclouts,
      'quotes': instance.quotes,
      'body': instance.body,
      'images': instance.images,
      'videos': instance.videos,
      'parentId': instance.parentId,
      'quoting': instance.quoting,
      'accountData': instance.accountData,
      'timestamp': instance.timestamp,
      'pinned': instance.pinned,
      'mempool': instance.mempool,
      'hidden': instance.hidden,
      'nodeId': instance.nodeId,
      'nft': instance.nft,
    };

RelatedData _$RelatedDataFromJson(Map<String, dynamic> json) => RelatedData(
      key: (json['key'] as List<dynamic>?)?.map((e) => e as int).toList(),
      kind: json['kind'] as int?,
    );

Map<String, dynamic> _$RelatedDataToJson(RelatedData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'kind': instance.kind,
    };

AccountCoinData _$AccountCoinDataFromJson(Map<String, dynamic> json) =>
    AccountCoinData(
      basis: json['basis'] as int?,
      locked: json['locked'] as int?,
      holders: json['holders'] as int?,
      coins: json['coins'] as int?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$AccountCoinDataToJson(AccountCoinData instance) =>
    <String, dynamic>{
      'basis': instance.basis,
      'locked': instance.locked,
      'holders': instance.holders,
      'coins': instance.coins,
      'mark': instance.mark,
    };

AccountData _$AccountDataFromJson(Map<String, dynamic> json) => AccountData(
      stamp: json['stamp'] as String?,
      nick: json['nick'] as String?,
      about: json['about'] as String?,
      hidden: json['hidden'] as bool?,
      verified: json['verified'] as bool?,
      coin: json['coin'] == null
          ? null
          : AccountCoinData.fromJson(json['coin'] as Map<String, dynamic>),
      price: json['price'] as int?,
      stake: json['stake'] as int?,
    );

Map<String, dynamic> _$AccountDataToJson(AccountData instance) =>
    <String, dynamic>{
      'stamp': instance.stamp,
      'nick': instance.nick,
      'about': instance.about,
      'hidden': instance.hidden,
      'verified': instance.verified,
      'coin': instance.coin,
      'price': instance.price,
      'stake': instance.stake,
    };

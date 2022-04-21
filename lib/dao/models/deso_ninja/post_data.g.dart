// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      author: (json['author'] as List<dynamic>?)?.map((e) => e as int).toList(),
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
      profile: json['profile'] == null
          ? null
          : ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
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
      'profile': instance.profile,
      'timestamp': instance.timestamp,
      'pinned': instance.pinned,
      'mempool': instance.mempool,
      'hidden': instance.hidden,
      'nodeId': instance.nodeId,
      'nft': instance.nft,
    };

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

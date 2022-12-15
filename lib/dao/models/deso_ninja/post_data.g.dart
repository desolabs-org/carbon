// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: json['id'] as String?,
      author: json['author'] as String?,
      body: json['body'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos:
          (json['videos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      parentId: json['parentId'] as String?,
      quotedId: json['quotedId'] as String?,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'body': instance.body,
      'images': instance.images,
      'videos': instance.videos,
      'parentId': instance.parentId,
      'quotedId': instance.quotedId,
    };

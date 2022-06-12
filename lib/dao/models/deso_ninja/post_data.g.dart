// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
      id: (json['id'] as List<dynamic>?)?.map((e) => e as int).toList(),
      by: (json['by'] as List<dynamic>?)?.map((e) => e as int).toList(),
      r: (json['r'] as List<dynamic>?)
          ?.map((e) => RelatedData.fromJson(e as Map<String, dynamic>))
          .toList(),
      bdy: json['bdy'] as String?,
      img: (json['img'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vid: (json['vid'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pid: (json['pid'] as List<dynamic>?)?.map((e) => e as int).toList(),
      qid: (json['qid'] as List<dynamic>?)?.map((e) => e as int).toList(),
      h: json['h'] as bool?,
      nft: json['nft'] as bool?,
      tc: json['tc'] as int?,
      tu: json['tu'] as int?,
      c: json['c'] as int?,
      l: json['l'] as int?,
      d: json['d'] as int?,
      s: json['s'] as int?,
      q: json['q'] as int?,
    );

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
      'id': instance.id,
      'by': instance.by,
      'r': instance.r,
      'bdy': instance.bdy,
      'img': instance.img,
      'vid': instance.vid,
      'pid': instance.pid,
      'qid': instance.qid,
      'h': instance.h,
      'nft': instance.nft,
      'tc': instance.tc,
      'tu': instance.tu,
      'c': instance.c,
      'l': instance.l,
      'd': instance.d,
      's': instance.s,
      'q': instance.q,
    };

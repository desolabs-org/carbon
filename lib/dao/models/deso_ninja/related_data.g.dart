// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedData _$RelatedDataFromJson(Map<String, dynamic> json) => RelatedData(
      key: (json['key'] as List<dynamic>?)?.map((e) => e as int).toList(),
      kind: json['kind'] as int?,
    );

Map<String, dynamic> _$RelatedDataToJson(RelatedData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'kind': instance.kind,
    };

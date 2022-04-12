// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dao_coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaoCoinData _$DaoCoinDataFromJson(Map<String, dynamic> json) => DaoCoinData(
      nanos: json['nanos'] as String?,
      locked: json['locked'] as bool?,
      holders: json['holders'] as int?,
      transfer: json['transfer'] as String?,
    );

Map<String, dynamic> _$DaoCoinDataToJson(DaoCoinData instance) =>
    <String, dynamic>{
      'nanos': instance.nanos,
      'holders': instance.holders,
      'locked': instance.locked,
      'transfer': instance.transfer,
    };

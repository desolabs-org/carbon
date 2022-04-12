// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorCoinData _$CreatorCoinDataFromJson(Map<String, dynamic> json) =>
    CreatorCoinData(
      basis: json['basis'] as int?,
      locked: json['locked'] as int?,
      holders: json['holders'] as int?,
      coins: json['coins'] as int?,
      mark: json['mark'] as int?,
    );

Map<String, dynamic> _$CreatorCoinDataToJson(CreatorCoinData instance) =>
    <String, dynamic>{
      'basis': instance.basis,
      'locked': instance.locked,
      'holders': instance.holders,
      'coins': instance.coins,
      'mark': instance.mark,
    };

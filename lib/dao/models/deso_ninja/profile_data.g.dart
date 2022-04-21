// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => ProfileData(
      desoPKey:
          (json['desoPKey'] as List<dynamic>?)?.map((e) => e as int).toList(),
      desoHandle: json['desoHandle'] as String?,
      description: json['description'] as String?,
      hidden: json['hidden'] as bool?,
      verified: json['verified'] as bool?,
      reserved: json['reserved'] as bool?,
      wellKnown: json['wellKnown'] as bool?,
      upcoming: json['upcoming'] as bool?,
      creatorCoin: json['creatorCoin'] == null
          ? null
          : CreatorCoinData.fromJson(
              json['creatorCoin'] as Map<String, dynamic>),
      daoCoin: json['daoCoin'] == null
          ? null
          : DaoCoinData.fromJson(json['daoCoin'] as Map<String, dynamic>),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'desoPKey': instance.desoPKey,
      'desoHandle': instance.desoHandle,
      'description': instance.description,
      'hidden': instance.hidden,
      'verified': instance.verified,
      'reserved': instance.reserved,
      'wellKnown': instance.wellKnown,
      'upcoming': instance.upcoming,
      'creatorCoin': instance.creatorCoin,
      'daoCoin': instance.daoCoin,
      'price': instance.price,
    };

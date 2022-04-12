import 'package:carbon/dao/models/deso_ninja/creator_coin_data.dart';
import 'package:carbon/dao/models/deso_ninja/dao_coin_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_data.g.dart';

@JsonSerializable()
class ProfileData {
  final String? desoPKey;
  final String? desoHandle;
  final String? description;
  final bool? hidden;
  final bool? verified;
  final bool? reserved;
  final bool? wellKnown;
  final bool? upcoming;
  final CreatorCoinData? creatorCoin;
  final DaoCoinData? daoCoin;
  final int? price;

  ProfileData({
    this.desoPKey, this.desoHandle, this.description, this.hidden, this.verified, this.reserved, this.wellKnown, this.upcoming,
    this.creatorCoin, this.daoCoin, this.price
  }): super();

  factory ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
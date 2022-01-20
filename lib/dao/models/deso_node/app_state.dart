import 'package:json_annotation/json_annotation.dart';

part 'app_state.g.dart';

@JsonSerializable()
class AppState {
  final num? MinSatoshisBurnedForProfileCreation;
  final num? BlockHeight;
  final bool? IsTestnet;
  final bool? HasStarterDeSoSeed;
  final bool? HasTwilioAPIKey;
  final num? CreateProfileFeeNanos;
  final bool? CompProfileCreation;
  final Map<String, num>? DiamondLevelMap;
  final bool? HasWyreIntegration;
  final bool? HasJumioIntegration;
  final bool? BuyWithETH;
  final num? USDCentsPerDeSoExchangeRate;
  final num? JumioDeSoNanos;
  final num? JumioUSDCents;
  final num? JumioKickbackUSDCents;
  final CountrySignUpBonusData? CountrySignUpBonus;
  final num? DefaultFeeRateNanosPerKB;
  final Map<String, List<TransactionFeeEntry>>? TransactionFeeMap;
  final String? BuyETHAddress;
  final Map<String, NodeEntry>? Nodes;
  final num? USDCentsPerBitCloutExchangeRate;
  final num? JumioBitCloutNanos;

  AppState({this.MinSatoshisBurnedForProfileCreation, this.BlockHeight, this.IsTestnet,
    this.HasStarterDeSoSeed, this.HasTwilioAPIKey, this.CreateProfileFeeNanos, this.CompProfileCreation,
    this.DiamondLevelMap, this.HasWyreIntegration, this.HasJumioIntegration, this.BuyWithETH,
    this.USDCentsPerDeSoExchangeRate, this.JumioDeSoNanos, this.JumioUSDCents, this.JumioKickbackUSDCents,
    this.CountrySignUpBonus, this.DefaultFeeRateNanosPerKB, this.TransactionFeeMap, this.BuyETHAddress,
    this.Nodes, this.USDCentsPerBitCloutExchangeRate, this.JumioBitCloutNanos
  }): super();

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}


@JsonSerializable()
class CountrySignUpBonusData {
  final bool? AllowCustomReferralAmount;
  final num? ReferralAmountOverrideUSDCents;
  final bool? AllowCustomKickbackAmount;
  final num? KickbackAmountOverrideUSDCents;

  CountrySignUpBonusData({this.AllowCustomReferralAmount, this.ReferralAmountOverrideUSDCents,
    this.AllowCustomKickbackAmount, this.KickbackAmountOverrideUSDCents}): super();

  factory CountrySignUpBonusData.fromJson(Map<String, dynamic> json) => _$CountrySignUpBonusDataFromJson(json);

  Map<String, dynamic> toJson() => _$CountrySignUpBonusDataToJson(this);
}

@JsonSerializable()
class TransactionFeeEntry {
  final String? PublicKeyBase58Check;
  // "ProfileEntryResponse": null,
  final num? AmountNanos;

  TransactionFeeEntry({this.PublicKeyBase58Check, this.AmountNanos}): super();

  factory TransactionFeeEntry.fromJson(Map<String, dynamic> json) => _$TransactionFeeEntryFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionFeeEntryToJson(this);
}

@JsonSerializable()
class NodeEntry {
  final String? Name;
  final String? URL;
  final String? Owner;

  NodeEntry({this.Name, this.URL, this.Owner}): super();

  factory NodeEntry.fromJson(Map<String, dynamic> json) => _$NodeEntryFromJson(json);

  Map<String, dynamic> toJson() => _$NodeEntryToJson(this);
}
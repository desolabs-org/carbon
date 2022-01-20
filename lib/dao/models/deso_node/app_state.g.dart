// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      MinSatoshisBurnedForProfileCreation:
          json['MinSatoshisBurnedForProfileCreation'] as num?,
      BlockHeight: json['BlockHeight'] as num?,
      IsTestnet: json['IsTestnet'] as bool?,
      HasStarterDeSoSeed: json['HasStarterDeSoSeed'] as bool?,
      HasTwilioAPIKey: json['HasTwilioAPIKey'] as bool?,
      CreateProfileFeeNanos: json['CreateProfileFeeNanos'] as num?,
      CompProfileCreation: json['CompProfileCreation'] as bool?,
      DiamondLevelMap: (json['DiamondLevelMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as num),
      ),
      HasWyreIntegration: json['HasWyreIntegration'] as bool?,
      HasJumioIntegration: json['HasJumioIntegration'] as bool?,
      BuyWithETH: json['BuyWithETH'] as bool?,
      USDCentsPerDeSoExchangeRate: json['USDCentsPerDeSoExchangeRate'] as num?,
      JumioDeSoNanos: json['JumioDeSoNanos'] as num?,
      JumioUSDCents: json['JumioUSDCents'] as num?,
      JumioKickbackUSDCents: json['JumioKickbackUSDCents'] as num?,
      CountrySignUpBonus: json['CountrySignUpBonus'] == null
          ? null
          : CountrySignUpBonusData.fromJson(
              json['CountrySignUpBonus'] as Map<String, dynamic>),
      DefaultFeeRateNanosPerKB: json['DefaultFeeRateNanosPerKB'] as num?,
      TransactionFeeMap:
          (json['TransactionFeeMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    TransactionFeeEntry.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      BuyETHAddress: json['BuyETHAddress'] as String?,
      Nodes: (json['Nodes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, NodeEntry.fromJson(e as Map<String, dynamic>)),
      ),
      USDCentsPerBitCloutExchangeRate:
          json['USDCentsPerBitCloutExchangeRate'] as num?,
      JumioBitCloutNanos: json['JumioBitCloutNanos'] as num?,
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'MinSatoshisBurnedForProfileCreation':
          instance.MinSatoshisBurnedForProfileCreation,
      'BlockHeight': instance.BlockHeight,
      'IsTestnet': instance.IsTestnet,
      'HasStarterDeSoSeed': instance.HasStarterDeSoSeed,
      'HasTwilioAPIKey': instance.HasTwilioAPIKey,
      'CreateProfileFeeNanos': instance.CreateProfileFeeNanos,
      'CompProfileCreation': instance.CompProfileCreation,
      'DiamondLevelMap': instance.DiamondLevelMap,
      'HasWyreIntegration': instance.HasWyreIntegration,
      'HasJumioIntegration': instance.HasJumioIntegration,
      'BuyWithETH': instance.BuyWithETH,
      'USDCentsPerDeSoExchangeRate': instance.USDCentsPerDeSoExchangeRate,
      'JumioDeSoNanos': instance.JumioDeSoNanos,
      'JumioUSDCents': instance.JumioUSDCents,
      'JumioKickbackUSDCents': instance.JumioKickbackUSDCents,
      'CountrySignUpBonus': instance.CountrySignUpBonus,
      'DefaultFeeRateNanosPerKB': instance.DefaultFeeRateNanosPerKB,
      'TransactionFeeMap': instance.TransactionFeeMap,
      'BuyETHAddress': instance.BuyETHAddress,
      'Nodes': instance.Nodes,
      'USDCentsPerBitCloutExchangeRate':
          instance.USDCentsPerBitCloutExchangeRate,
      'JumioBitCloutNanos': instance.JumioBitCloutNanos,
    };

CountrySignUpBonusData _$CountrySignUpBonusDataFromJson(
        Map<String, dynamic> json) =>
    CountrySignUpBonusData(
      AllowCustomReferralAmount: json['AllowCustomReferralAmount'] as bool?,
      ReferralAmountOverrideUSDCents:
          json['ReferralAmountOverrideUSDCents'] as num?,
      AllowCustomKickbackAmount: json['AllowCustomKickbackAmount'] as bool?,
      KickbackAmountOverrideUSDCents:
          json['KickbackAmountOverrideUSDCents'] as num?,
    );

Map<String, dynamic> _$CountrySignUpBonusDataToJson(
        CountrySignUpBonusData instance) =>
    <String, dynamic>{
      'AllowCustomReferralAmount': instance.AllowCustomReferralAmount,
      'ReferralAmountOverrideUSDCents': instance.ReferralAmountOverrideUSDCents,
      'AllowCustomKickbackAmount': instance.AllowCustomKickbackAmount,
      'KickbackAmountOverrideUSDCents': instance.KickbackAmountOverrideUSDCents,
    };

TransactionFeeEntry _$TransactionFeeEntryFromJson(Map<String, dynamic> json) =>
    TransactionFeeEntry(
      PublicKeyBase58Check: json['PublicKeyBase58Check'] as String?,
      AmountNanos: json['AmountNanos'] as num?,
    );

Map<String, dynamic> _$TransactionFeeEntryToJson(
        TransactionFeeEntry instance) =>
    <String, dynamic>{
      'PublicKeyBase58Check': instance.PublicKeyBase58Check,
      'AmountNanos': instance.AmountNanos,
    };

NodeEntry _$NodeEntryFromJson(Map<String, dynamic> json) => NodeEntry(
      Name: json['Name'] as String?,
      URL: json['URL'] as String?,
      Owner: json['Owner'] as String?,
    );

Map<String, dynamic> _$NodeEntryToJson(NodeEntry instance) => <String, dynamic>{
      'Name': instance.Name,
      'URL': instance.URL,
      'Owner': instance.Owner,
    };

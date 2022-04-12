import 'package:json_annotation/json_annotation.dart';

part 'dao_coin_data.g.dart';

@JsonSerializable()
class DaoCoinData {
  final String? nanos;
  final int? holders;
  final bool? locked;
  final String? transfer;

  DaoCoinData({this.nanos, this.locked, this.holders, this.transfer}): super();

  factory DaoCoinData.fromJson(Map<String, dynamic> json) => _$DaoCoinDataFromJson(json);

  Map<String, dynamic> toJson() => _$DaoCoinDataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'creator_coin_data.g.dart';

@JsonSerializable()
class CreatorCoinData {
  final int? basis;
  final int? locked;
  final int? holders;
  final int? coins;
  final int? mark;

  CreatorCoinData({this.basis, this.locked, this.holders, this.coins, this.mark}): super();

  factory CreatorCoinData.fromJson(Map<String, dynamic> json) => _$CreatorCoinDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorCoinDataToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'related_data.g.dart';

@JsonSerializable()
class RelatedData {
  final List<int>? key;
  final int? kind;

  RelatedData({this.key, this.kind}): super();

  factory RelatedData.fromJson(Map<String, dynamic> json) => _$RelatedDataFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedDataToJson(this);
}

import 'package:carbon/dao/models/deso_ninja/related_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_data.g.dart';

@JsonSerializable()
class PostData {

  final List<int>? id;
  final List<int>? by;
  final List<RelatedData>? r;

  final String? bdy;
  final List<String>? img;
  final List<String>? vid;
  final List<int>? pid;
  final List<int>? qid;

  final bool? h;
  final bool? nft;

  final int? tc;
  final int? tu;

  final int? c;
  final int? l;
  final int? d;
  final int? s;
  final int? q;

  PostData({this.id, this.by, this.r,
    this.bdy, this.img, this.vid, this.pid, this.qid,
    this.h, this.nft,
    this.tc, this.tu,
    this.c, this.l, this.d, this.s, this.q
  }) : super();

  factory PostData.fromJson(Map<String, dynamic> json) => _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
}

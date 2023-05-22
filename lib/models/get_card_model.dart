// To parse this JSON data, do
//
//     final getCardModel = getCardModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetCardModel getCardModelFromJson(String str) => GetCardModel.fromJson(json.decode(str));

String getCardModelToJson(GetCardModel data) => json.encode(data.toJson());

class GetCardModel {
  String name;
  String cnic;
  String program;
  String batch;
  String group;
  String? imgurl;

  GetCardModel({
    required this.name,
    required this.cnic,
    required this.program,
    required this.batch,
    required this.group,
    required this.imgurl,
  });

  factory GetCardModel.fromJson(Map<String, dynamic> json) => GetCardModel(
    name: json["name"],
    cnic: json["cnic"],
    program: json["program"],
    batch: json["batch"],
    group: json["group"],
    imgurl: json["imgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cnic": cnic,
    "program": program,
    "batch": batch,
    "group": group,
    "imgUrl": imgurl,
  };
}

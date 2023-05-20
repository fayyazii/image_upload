// To parse this JSON data, do
//
//     final getInfoModel = getInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class GetInfoModel {
  String name;
  String fName;
  String title;
  String img;

  GetInfoModel({
    required this.name,
    required this.fName,
    required this.title,
    required this.img,
  });

  factory GetInfoModel.fromRawJson(String str) => GetInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetInfoModel.fromJson(Map<String, dynamic> json) => GetInfoModel(
    name: json["Name"]??"N/A",
    fName: json["FName"]??"N/A",
    title: json["Title"]??"N/A",
    img: json["imgUrl"]??"",
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "FName": fName,
    "Title": title,
    "imgUrl": img

  };
}

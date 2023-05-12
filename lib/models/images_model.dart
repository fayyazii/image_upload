// To parse this JSON data, do
//
//     final imagesModel = imagesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ImagesModel {
  int date;
  String imageUrl;

  ImagesModel({
    required this.date,
    required this.imageUrl,
  });

  factory ImagesModel.fromRawJson(String str) => ImagesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
    date: json["date"],
    imageUrl: json["imageURL"]??"",
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "imageURL": imageUrl,
  };
}

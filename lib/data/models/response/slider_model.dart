// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

List<SliderModel> sliderFromJson(String str) => List<SliderModel>.from(json.decode(str).map((x) => SliderModel.fromJson(x)));

String sliderToJson(List<SliderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderModel {
  final String? image;

  SliderModel({
    this.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

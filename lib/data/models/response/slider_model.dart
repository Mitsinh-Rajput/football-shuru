// To parse this JSON data, do
//
//     final slider = sliderFromJson(jsonString);

import 'dart:convert';

List<Slider> sliderFromJson(String str) => List<Slider>.from(json.decode(str).map((x) => Slider.fromJson(x)));

String sliderToJson(List<Slider> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Slider {
  final String? image;

  Slider({
    this.image,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

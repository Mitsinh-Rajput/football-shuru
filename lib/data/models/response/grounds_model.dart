// To parse this JSON data, do
//
//     final grounds = groundsFromJson(jsonString);

import 'dart:convert';

List<Grounds> groundsFromJson(String str) => List<Grounds>.from(json.decode(str).map((x) => Grounds.fromJson(x)));

String groundsToJson(List<Grounds> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Grounds {
  final int? id;
  final String? title;
  final String? address;
  final int? pincode;
  bool isSelected;

  Grounds({
    this.id,
    this.title,
    this.address,
    this.pincode,
    this.isSelected = false,
  });

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "pincode": pincode,
      };
}

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
  final List<String> images; // Changed to List<String> type
  final String? description;
  final String? groundKing;
  final HasUser? hasUser;

  bool isSelected;

  Grounds({
    this.id,
    this.title,
    this.address,
    this.pincode,
    required this.images,
    this.description,
    this.groundKing,
    this.hasUser,
    this.isSelected = false,
  });

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        pincode: json["pincode"],
        images: json['image'] == null ? [] : (json["image"] as String).split(','),
        // Splitting the image string into a list of URLs
        description: json["description"],
        groundKing: json["ground_king"],
        hasUser: json["hasUser"] == null ? null : HasUser.fromJson(json["hasUser"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "pincode": pincode,
        "image": images, // Joining the list of image URLs into a single string
        "description": description,
        "ground_king": groundKing, "hasUser": hasUser?.toJson(),
      };
}

class HasUser {
  final int? id;
  final int? userId;
  final int? groundId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HasUser({
    this.id,
    this.userId,
    this.groundId,
    this.createdAt,
    this.updatedAt,
  });

  factory HasUser.fromJson(Map<String, dynamic> json) => HasUser(
        id: json["id"],
        userId: json["user_id"],
        groundId: json["ground_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "ground_id": groundId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

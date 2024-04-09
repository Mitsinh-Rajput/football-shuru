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
  final int? userCount;
  int? unReadMessages;
  final List<String> images; // Changed to List<String> type
  final String? description;
  final String? groundKing;

  final HasUser? hasUser;
  final LastMessageDate? lastMessageDate;

  bool isSelected;

  Grounds({
    this.id,
    this.userCount,
    this.unReadMessages,
    this.title,
    this.address,
    this.pincode,
    required this.images,
    this.description,
    this.groundKing,
    this.hasUser,
    this.isSelected = false,
    this.lastMessageDate,
  });

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        title: json["title"],
        userCount: json["users_count"],
        unReadMessages: json["unread_messages_count"],
        address: json["address"],
        pincode: json["pincode"],
        images: json['image'] == null ? [] : (json["image"] as String).split(','),
        // Splitting the image string into a list of URLs
        description: json["description"],
        groundKing: json["ground_king"],
        hasUser: json["hasUser"] == null ? null : HasUser.fromJson(json["hasUser"]),
        lastMessageDate: json["last_message_date"] == null ? null : LastMessageDate.fromJson(json["last_message_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "unread_messages_count": unReadMessages,
        "users_count": userCount,
        "address": address,
        "pincode": pincode,
        "image": images, // Joining the list of image URLs into a single string
        "description": description,
        "ground_king": groundKing, "hasUser": hasUser?.toJson(),
        "last_message_date": lastMessageDate?.toJson(),
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

class LastMessageDate {
  final int? id;
  final String? message;
  final int? groundId;
  final int? userId;
  final dynamic file;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LastMessageDate({
    this.id,
    this.message,
    this.groundId,
    this.userId,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory LastMessageDate.fromJson(Map<String, dynamic> json) => LastMessageDate(
        id: json["id"],
        message: json["message"],
        groundId: json["ground_id"],
        userId: json["user_id"],
        file: json["file"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "ground_id": groundId,
        "user_id": userId,
        "file": file,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

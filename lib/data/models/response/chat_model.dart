// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

import 'package:football_shuru/data/models/response/profile_model.dart';

List<ChatModel> chatModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final int? id;
  final String? message;
  final int? groundId;
  final int? userId;
  final dynamic file;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Profile? user;

  ChatModel({
    this.id,
    this.message,
    this.groundId,
    this.userId,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        message: json["message"],
        groundId: json["ground_id"],
        userId: json["user_id"],
        file: json["file"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]).toLocal(),
        user: json["user"] == null ? null : Profile.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "ground_id": groundId,
        "user_id": userId,
        "file": file,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

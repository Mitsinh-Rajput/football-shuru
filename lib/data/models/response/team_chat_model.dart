// To parse this JSON data, do
//
//     final teamChatModel = teamChatModelFromJson(jsonString);

import 'dart:convert';

List<TeamChatModel> teamChatModelFromJson(String str) => List<TeamChatModel>.from(json.decode(str).map((x) => TeamChatModel.fromJson(x)));

String teamChatModelToJson(List<TeamChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamChatModel {
  int? id;
  String? message;
  dynamic file;
  int? teamId;
  User? user;
  DateTime? createdAt;

  TeamChatModel({
    this.id,
    this.message,
    this.file,
    this.teamId,
    this.user,
    this.createdAt,
  });

  factory TeamChatModel.fromJson(Map<String, dynamic> json) => TeamChatModel(
    id: json["id"],
    message: json["message"],
    file: json["file"],
    teamId: json["team_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "file": file,
    "team_id": teamId,
    "user": user?.toJson(),
    "created_at": createdAt?.toIso8601String(),
  };
}

class User {
  int? id;
  String? name;

  User({
    this.id,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

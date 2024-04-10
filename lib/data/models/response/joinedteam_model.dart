// To parse this JSON data, do
//
//     final joinedTeam = joinedTeamFromJson(jsonString);

import 'dart:convert';

List<JoinedTeam> joinedTeamFromJson(String str) => List<JoinedTeam>.from(json.decode(str).map((x) => JoinedTeam.fromJson(x)));

String joinedTeamToJson(List<JoinedTeam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JoinedTeam {
  final int? id;
  final TeamJoined? team;
  final DateTime? createdAt;

  JoinedTeam({
    this.id,
    this.team,
    this.createdAt,
  });

  factory JoinedTeam.fromJson(Map<String, dynamic> json) => JoinedTeam(
        id: json["id"],
        team: json["team"] == null ? null : TeamJoined.fromJson(json["team"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team": team?.toJson(),
        "created_at": createdAt?.toIso8601String(),
      };
}

class TeamJoined {
  final int? id;
  final String? name;
  final String? logo;
  final String? code;
  final int? usersCount;
  final int? unreadMessagesCount;
  final LastMessage? lastMessage;
  final List<UserElement>? users;

  TeamJoined({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.usersCount,
    this.unreadMessagesCount,
    this.lastMessage,
    this.users,
  });

  factory TeamJoined.fromJson(Map<String, dynamic> json) => TeamJoined(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        code: json["code"],
        usersCount: json["users_count"],
        unreadMessagesCount: json["unread_messages_count"],
        lastMessage: json["last_message"] == null ? null : LastMessage.fromJson(json["last_message"]),
        users: json["users"] == null ? [] : List<UserElement>.from(json["users"]!.map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "code": code,
        "users_count": usersCount,
        "unread_messages_count": unreadMessagesCount,
        "last_message": lastMessage?.toJson(),
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}

class LastMessage {
  final int? id;
  final String? message;
  final dynamic file;
  final int? teamId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LastMessage({
    this.id,
    this.message,
    this.file,
    this.teamId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["id"],
        message: json["message"],
        file: json["file"],
        teamId: json["team_id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "file": file,
        "team_id": teamId,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class UserElement {
  final int? id;
  final int? userId;
  final int? teamId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserUser? user;

  UserElement({
    this.id,
    this.userId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        userId: json["user_id"],
        teamId: json["team_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "team_id": teamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class UserUser {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? gender;
  final DateTime? dob;
  final String? about;
  final String? pincode;

  UserUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.dob,
    this.about,
    this.pincode,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        about: json["about"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "gender": gender,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "about": about,
        "pincode": pincode,
      };
}

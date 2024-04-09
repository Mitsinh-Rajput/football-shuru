// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  final TeamInfo? teamData;
  final AlreadyJoined? alreadyJoined;

  Team({
    this.teamData,
    this.alreadyJoined,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamData: json["data"] == null ? null : TeamInfo.fromJson(json["data"]),
        alreadyJoined: json["already_joined"] == null ? null : AlreadyJoined.fromJson(json["already_joined"]),
      );

  Map<String, dynamic> toJson() => {
        "data": teamData?.toJson(),
        "already_joined": alreadyJoined?.toJson(),
      };
}

class AlreadyJoined {
  final int? id;
  final int? userId;
  final int? teamId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AlreadyJoined({
    this.id,
    this.userId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
  });

  factory AlreadyJoined.fromJson(Map<String, dynamic> json) => AlreadyJoined(
        id: json["id"],
        userId: json["user_id"],
        teamId: json["team_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "team_id": teamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class TeamInfo {
  final int? id;
  final String? name;
  final String? logo;
  final String? code;
  final int? captain;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TeamInfo({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.captain,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        code: json["code"],
        captain: json["captain"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "code": code,
        "captain": captain,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

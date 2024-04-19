// To parse this JSON data, do
//
//     final groundTeam = groundTeamFromJson(jsonString);

import 'dart:convert';

List<GroundTeam> groundTeamFromJson(String str) => List<GroundTeam>.from(json.decode(str).map((x) => GroundTeam.fromJson(x)));

String groundTeamToJson(List<GroundTeam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroundTeam {
  final int? id;
  final int? userId;
  final int? teamId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Team? team;

  GroundTeam({
    this.id,
    this.userId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
    this.team,
  });

  factory GroundTeam.fromJson(Map<String, dynamic> json) => GroundTeam(
        id: json["id"],
        userId: json["user_id"],
        teamId: json["team_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "team_id": teamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "team": team?.toJson(),
      };
}

class Team {
  final int? id;
  final String? name;
  final String? logo;
  final String? code;
  final int? captain;
  final int? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Team({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.captain,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        code: json["code"],
        captain: json["captain"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

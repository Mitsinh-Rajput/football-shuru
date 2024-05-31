// To parse this JSON data, do
//
//     final leagueTableModel = leagueTableModelFromJson(jsonString);

import 'dart:convert';

List<LeagueTableModel> leagueTableModelFromJson(String str) =>
    List<LeagueTableModel>.from(
        json.decode(str).map((x) => LeagueTableModel.fromJson(x)));

String leagueTableModelToJson(List<LeagueTableModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeagueTableModel {
  Team? team;
  int? totalMatchesPlayed;
  int? drawMatches;
  int? cancelledMatches;
  int? winningMatches;
  int? loseMatches;

  LeagueTableModel({
    this.team,
    this.totalMatchesPlayed,
    this.drawMatches,
    this.cancelledMatches,
    this.winningMatches,
    this.loseMatches,
  });

  factory LeagueTableModel.fromJson(Map<String, dynamic> json) =>
      LeagueTableModel(
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        totalMatchesPlayed: json["total_matches_played"],
        drawMatches: json["draw_matches"],
        cancelledMatches: json["cancelled_matches"],
        winningMatches: json["winning_matches"],
        loseMatches: json["lose_matches"],
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "total_matches_played": totalMatchesPlayed,
        "draw_matches": drawMatches,
        "cancelled_matches": cancelledMatches,
        "winning_matches": winningMatches,
        "lose_matches": loseMatches,
      };
}

class Team {
  int? id;
  String? name;
  String? logo;
  String? code;
  int? captain;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

// To parse this JSON data, do
//
//     final leagueModel = leagueModelFromJson(jsonString);

import 'dart:convert';

List<LeagueModel> leagueModelFromJson(String str) => List<LeagueModel>.from(
    json.decode(str).map((x) => LeagueModel.fromJson(x)));

String leagueModelToJson(List<LeagueModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeagueModel {
  int? id;
  String? name;
  dynamic image;
  String? type;
  String? description;
  String? numberOfParticipants;
  String? pincode;
  dynamic userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<LeagueMatchSchedule>? leagueMatchSchedules;
  List<TeamElement>? teams;

  LeagueModel({
    this.id,
    this.name,
    this.image,
    this.type,
    this.description,
    this.numberOfParticipants,
    this.pincode,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.leagueMatchSchedules,
    this.teams,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        type: json["type"],
        description: json["description"],
        numberOfParticipants: json["number_of_participants"],
        pincode: json["pincode"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        leagueMatchSchedules: json["league_match_schedules"] == null
            ? []
            : List<LeagueMatchSchedule>.from(json["league_match_schedules"]!
                .map((x) => LeagueMatchSchedule.fromJson(x))),
        teams: json["teams"] == null
            ? []
            : List<TeamElement>.from(
                json["teams"]!.map((x) => TeamElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "type": type,
        "description": description,
        "number_of_participants": numberOfParticipants,
        "pincode": pincode,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "league_match_schedules": leagueMatchSchedules == null
            ? []
            : List<dynamic>.from(leagueMatchSchedules!.map((x) => x.toJson())),
        "teams": teams == null
            ? []
            : List<dynamic>.from(teams!.map((x) => x.toJson())),
      };
}

class LeagueMatchSchedule {
  int? id;
  int? leagueId;
  int? teamId;
  int? opponentTeamId;
  dynamic teamGoals;
  dynamic opponentTeamGoals;
  dynamic isDraw;
  dynamic isCancelled;
  dynamic scheduledTime;
  dynamic scheduledBy;
  String? scheduledTimeStatus;
  dynamic winnerTeam;
  dynamic winnerTeamResponseByUser;
  String? winningTeamConfirmation;
  DateTime? createdAt;
  DateTime? updatedAt;
  OpponentTeamClass? opponentTeam;
  OpponentTeamClass? team;

  LeagueMatchSchedule({
    this.id,
    this.leagueId,
    this.teamId,
    this.opponentTeamId,
    this.teamGoals,
    this.opponentTeamGoals,
    this.isDraw,
    this.isCancelled,
    this.scheduledTime,
    this.scheduledBy,
    this.scheduledTimeStatus,
    this.winnerTeam,
    this.winnerTeamResponseByUser,
    this.winningTeamConfirmation,
    this.createdAt,
    this.updatedAt,
    this.opponentTeam,
    this.team,
  });

  factory LeagueMatchSchedule.fromJson(Map<String, dynamic> json) =>
      LeagueMatchSchedule(
        id: json["id"],
        leagueId: json["league_id"],
        teamId: json["team_id"],
        opponentTeamId: json["opponent_team_id"],
        teamGoals: json["team_goals"],
        opponentTeamGoals: json["opponent_team_goals"],
        isDraw: json["is_draw"],
        isCancelled: json["is_cancelled"],
        scheduledTime: json["scheduled_time"],
        scheduledBy: json["scheduled_by"],
        scheduledTimeStatus: json["scheduled_time_status"],
        winnerTeam: json["winner_team"],
        winnerTeamResponseByUser: json["winner_team_response_by_user"],
        winningTeamConfirmation: json["winning_team_confirmation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        opponentTeam: json["opponent_team"] == null
            ? null
            : OpponentTeamClass.fromJson(json["opponent_team"]),
        team: json["team"] == null
            ? null
            : OpponentTeamClass.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "league_id": leagueId,
        "team_id": teamId,
        "opponent_team_id": opponentTeamId,
        "team_goals": teamGoals,
        "opponent_team_goals": opponentTeamGoals,
        "is_draw": isDraw,
        "is_cancelled": isCancelled,
        "scheduled_time": scheduledTime,
        "scheduled_by": scheduledBy,
        "scheduled_time_status": scheduledTimeStatus,
        "winner_team": winnerTeam,
        "winner_team_response_by_user": winnerTeamResponseByUser,
        "winning_team_confirmation": winningTeamConfirmation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "opponent_team": opponentTeam?.toJson(),
        "team": team?.toJson(),
      };
}

class OpponentTeamClass {
  int? id;
  String? name;
  String? logo;
  String? code;
  int? captain;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  OpponentTeamClass({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.captain,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory OpponentTeamClass.fromJson(Map<String, dynamic> json) =>
      OpponentTeamClass(
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

class TeamElement {
  int? id;
  int? leagueId;
  int? teamId;
  DateTime? createdAt;
  DateTime? updatedAt;
  OpponentTeamClass? team;

  TeamElement({
    this.id,
    this.leagueId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
    this.team,
  });

  factory TeamElement.fromJson(Map<String, dynamic> json) => TeamElement(
        id: json["id"],
        leagueId: json["league_id"],
        teamId: json["team_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        team: json["team"] == null
            ? null
            : OpponentTeamClass.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "league_id": leagueId,
        "team_id": teamId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "team": team?.toJson(),
      };
}

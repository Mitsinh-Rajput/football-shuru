// To parse this JSON data, do
//
//     final pendingLeagueMatchModel = pendingLeagueMatchModelFromJson(jsonString);

import 'dart:convert';

List<PendingLeagueMatchModel> pendingLeagueMatchModelFromJson(String str) =>
    List<PendingLeagueMatchModel>.from(
        json.decode(str).map((x) => PendingLeagueMatchModel.fromJson(x)));

String pendingLeagueMatchModelToJson(List<PendingLeagueMatchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingLeagueMatchModel {
  int? id;
  int? leagueId;
  int? teamId;
  int? opponentTeamId;
  dynamic teamGoals;
  dynamic opponentTeamGoals;
  dynamic isDraw;
  dynamic isCancelled;
  DateTime? scheduledTime;
  int? scheduledBy;
  String? scheduledTimeStatus;
  dynamic winnerTeam;
  dynamic winnerTeamResponseByUser;
  String? winningTeamConfirmation;
  DateTime? createdAt;
  DateTime? updatedAt;
  Team? opponentTeam;
  Team? team;
  League? league;

  PendingLeagueMatchModel({
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
    this.league,
  });

  factory PendingLeagueMatchModel.fromJson(Map<String, dynamic> json) =>
      PendingLeagueMatchModel(
        id: json["id"],
        leagueId: json["league_id"],
        teamId: json["team_id"],
        opponentTeamId: json["opponent_team_id"],
        teamGoals: json["team_goals"],
        opponentTeamGoals: json["opponent_team_goals"],
        isDraw: json["is_draw"],
        isCancelled: json["is_cancelled"],
        scheduledTime: json["scheduled_time"] == null
            ? null
            : DateTime.parse(json["scheduled_time"]),
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
            : Team.fromJson(json["opponent_team"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        league: json["league"] == null ? null : League.fromJson(json["league"]),
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
        "scheduled_time": scheduledTime?.toIso8601String(),
        "scheduled_by": scheduledBy,
        "scheduled_time_status": scheduledTimeStatus,
        "winner_team": winnerTeam,
        "winner_team_response_by_user": winnerTeamResponseByUser,
        "winning_team_confirmation": winningTeamConfirmation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "opponent_team": opponentTeam?.toJson(),
        "team": team?.toJson(),
        "league": league?.toJson(),
      };
}

class League {
  int? id;
  String? name;
  dynamic image;
  String? type;
  dynamic description;
  String? numberOfParticipants;
  String? pincode;
  dynamic userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? scorecards;

  League({
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
    this.scorecards,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
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
        scorecards: json["scorecards"] == null
            ? []
            : List<dynamic>.from(json["scorecards"]!.map((x) => x)),
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
        "scorecards": scorecards == null
            ? []
            : List<dynamic>.from(scorecards!.map((x) => x)),
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
  CaptainUser? captainUser;

  Team({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.captain,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.captainUser,
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
        captainUser: json["captain_user"] == null
            ? null
            : CaptainUser.fromJson(json["captain_user"]),
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
        "captain_user": captainUser?.toJson(),
      };
}

class CaptainUser {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gender;
  DateTime? dob;
  String? about;
  String? pincode;

  CaptainUser({
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

  factory CaptainUser.fromJson(Map<String, dynamic> json) => CaptainUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "about": about,
        "pincode": pincode,
      };
}

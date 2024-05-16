import 'dart:convert';

List<PendingMatchListModel> pendingMatchListModelFromJson(String str) =>
    List<PendingMatchListModel>.from(
        json.decode(str).map((x) => PendingMatchListModel.fromJson(x)));

String pendingMatchListModelToJson(List<PendingMatchListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingMatchListModel {
  final int? id;
  final int? teamId;
  final int? groundId;
  final int? opponentTeamId;
  final DateTime? scheduledTime;
  final int? scheduledBy;
  final String? scheduledStatus;
  final int? winnerTeam;
  final int? winnerTeamResponseByUser;
  final String? winningTeamConfirmation;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? teamGoals;
  final int? opponentTeamGoals;
  final dynamic isDraw;
  final dynamic isCancelled;
  final Team? opponentTeam;
  final Team? team;
  final Ground? ground;
  final List<Scorecard>? scorecards;

  PendingMatchListModel({
    this.id,
    this.teamId,
    this.groundId,
    this.opponentTeamId,
    this.scheduledTime,
    this.scheduledBy,
    this.scheduledStatus,
    this.winnerTeam,
    this.winnerTeamResponseByUser,
    this.winningTeamConfirmation,
    this.createdAt,
    this.updatedAt,
    this.teamGoals,
    this.opponentTeamGoals,
    this.isDraw,
    this.isCancelled,
    this.opponentTeam,
    this.team,
    this.ground,
    this.scorecards,
  });

  factory PendingMatchListModel.fromJson(Map<String, dynamic> json) =>
      PendingMatchListModel(
        id: json["id"],
        teamId: json["team_id"],
        groundId: json["ground_id"],
        opponentTeamId: json["opponent_team_id"],
        scheduledTime: json["scheduled_time"] == null
            ? null
            : DateTime.parse(json["scheduled_time"]),
        scheduledBy: json["scheduled_by"],
        scheduledStatus: json["scheduled_status"],
        winnerTeam: json["winner_team"],
        winnerTeamResponseByUser: json["winner_team_response_by_user"],
        winningTeamConfirmation: json["winning_team_confirmation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        teamGoals: json["team_goals"],
        opponentTeamGoals: json["opponent_team_goals"],
        isDraw: json["is_draw"],
        isCancelled: json["is_cancelled"],
        opponentTeam: json["opponent_team"] == null
            ? null
            : Team.fromJson(json["opponent_team"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        ground: json["ground"] == null ? null : Ground.fromJson(json["ground"]),
        scorecards: json["scorecards"] == null
            ? []
            : List<Scorecard>.from(
                json["scorecards"]!.map((x) => Scorecard.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "ground_id": groundId,
        "opponent_team_id": opponentTeamId,
        "scheduled_time": scheduledTime?.toIso8601String(),
        "scheduled_by": scheduledBy,
        "scheduled_status": scheduledStatus,
        "winner_team": winnerTeam,
        "winner_team_response_by_user": winnerTeamResponseByUser,
        "winning_team_confirmation": winningTeamConfirmation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "team_goals": teamGoals,
        "opponent_team_goals": opponentTeamGoals,
        "is_draw": isDraw,
        "is_cancelled": isCancelled,
        "opponent_team": opponentTeam?.toJson(),
        "team": team?.toJson(),
        "ground": ground?.toJson(),
        "scorecards": scorecards == null
            ? []
            : List<dynamic>.from(scorecards!.map((x) => x.toJson())),
      };
}

class Ground {
  final int? id;
  final String? title;
  final String? address;
  final int? pincode;
  final dynamic latlong;
  final dynamic userId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? image;
  final String? description;
  final dynamic mapLocation;
  final int? groundKing;

  Ground({
    this.id,
    this.title,
    this.address,
    this.pincode,
    this.latlong,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.description,
    this.mapLocation,
    this.groundKing,
  });

  factory Ground.fromJson(Map<String, dynamic> json) => Ground(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        pincode: json["pincode"],
        latlong: json["latlong"],
        userId: json["user_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        description: json["description"],
        mapLocation: json["map_location"],
        groundKing: json["ground_king"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "pincode": pincode,
        "latlong": latlong,
        "user_id": userId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "description": description,
        "map_location": mapLocation,
        "ground_king": groundKing,
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
  final CaptainUser? captainUser;

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

class Scorecard {
  final int? id;
  final int? userId;
  final int? goals;
  final int? assist;
  final String? bestMidfield;
  final String? bestDefender;
  final int? teamId;
  final int? groundId;
  final int? groundKingChallengeId;
  final int? dataEnteredByUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Scorecard({
    this.id,
    this.userId,
    this.goals,
    this.assist,
    this.bestMidfield,
    this.bestDefender,
    this.teamId,
    this.groundId,
    this.groundKingChallengeId,
    this.dataEnteredByUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Scorecard.fromJson(Map<String, dynamic> json) => Scorecard(
        id: json["id"],
        userId: json["user_id"],
        goals: json["goals"],
        assist: json["assist"],
        bestMidfield: json["best_midfield"],
        bestDefender: json["best_defender"],
        teamId: json["team_id"],
        groundId: json["ground_id"],
        groundKingChallengeId: json["ground_king_challenge_id"],
        dataEnteredByUser: json["data_entered_by_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "goals": goals,
        "assist": assist,
        "best_midfield": bestMidfield,
        "best_defender": bestDefender,
        "team_id": teamId,
        "ground_id": groundId,
        "ground_king_challenge_id": groundKingChallengeId,
        "data_entered_by_user": dataEnteredByUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

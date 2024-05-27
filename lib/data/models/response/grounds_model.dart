// To parse this JSON data, do
//
//     final grounds = groundsFromJson(jsonString);

import 'dart:convert';

List<Grounds> groundsListFromJson(String str) =>
    List<Grounds>.from(json.decode(str).map((x) => Grounds.fromJson(x)));
Grounds groundsFromJson(String str) => Grounds.fromJson(json.decode(str));

String groundsToJson(List<Grounds> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  final Team? groundKingTeam;
  final GroundKingChallenge? groundKingChallenge;

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
    this.groundKingTeam,
    this.groundKingChallenge,
  });

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        title: json["title"],
        userCount: json["users_count"],
        unReadMessages: json["unread_messages_count"],
        address: json["address"],
        pincode: json["pincode"],
        images:
            json['image'] == null ? [] : (json["image"] as String).split(','),
        // Splitting the image string into a list of URLs
        description: json["description"],
        groundKing: json["ground_king"],
        groundKingTeam: json["ground_king_team"] == null
            ? null
            : Team.fromJson(json["ground_king_team"]),
        groundKingChallenge: json["ground_king_challenge"] == null
            ? null
            : GroundKingChallenge.fromJson(json["ground_king_challenge"]),
        hasUser:
            json["hasUser"] == null ? null : HasUser.fromJson(json["hasUser"]),
        lastMessageDate: json["last_message_date"] == null
            ? null
            : LastMessageDate.fromJson(json["last_message_date"]),
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
        "ground_king_team": groundKingTeam?.toJson(),
        "ground_king_challenge": groundKingChallenge?.toJson(),
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

  factory LastMessageDate.fromJson(Map<String, dynamic> json) =>
      LastMessageDate(
        id: json["id"],
        message: json["message"],
        groundId: json["ground_id"],
        userId: json["user_id"],
        file: json["file"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]).toLocal(),
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

GroundKingChallenge groundKingChallengeFromJson(String str) =>
    GroundKingChallenge.fromJson(json.decode(str));

String groundKingChallengeToJson(GroundKingChallenge data) =>
    json.encode(data.toJson());

class GroundKingChallenge {
  final int? id;
  final int? teamId;
  final int? groundId;
  final dynamic opponentTeamId;
  final dynamic scheduledTime;
  final dynamic scheduledBy;
  final String? scheduledStatus;
  final dynamic winnerTeam;
  final dynamic winnerTeamResponseByUser;
  final String? winningTeamConfirmation;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Team? opponentTeam;
  final Team? team;

  GroundKingChallenge({
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
    this.opponentTeam,
    this.team,
  });

  factory GroundKingChallenge.fromJson(Map<String, dynamic> json) =>
      GroundKingChallenge(
        id: json["id"],
        teamId: json["team_id"],
        groundId: json["ground_id"],
        opponentTeamId: json["opponent_team_id"],
        scheduledTime: json["scheduled_time"],
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
        opponentTeam: json["opponent_team"] == null
            ? null
            : Team.fromJson(json["opponent_team"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "ground_id": groundId,
        "opponent_team_id": opponentTeamId,
        "scheduled_time": scheduledTime,
        "scheduled_by": scheduledBy,
        "scheduled_status": scheduledStatus,
        "winner_team": winnerTeam,
        "winner_team_response_by_user": winnerTeamResponseByUser,
        "winning_team_confirmation": winningTeamConfirmation,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "opponent_team": opponentTeam?.toJson(),
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

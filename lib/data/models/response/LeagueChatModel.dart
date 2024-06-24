// To parse this JSON data, do
//
//     final leagueChatModel = leagueChatModelFromJson(jsonString);

import 'dart:convert';

List<LeagueChatModel> leagueChatModelFromJson(String str) => List<LeagueChatModel>.from(json.decode(str).map((x) => LeagueChatModel.fromJson(x)));

String leagueChatModelToJson(List<LeagueChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeagueChatModel {
  int? id;
  String? message;
  dynamic file;
  int? leagueId;
  dynamic teamId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  LeagueChatModel({
    this.id,
    this.message,
    this.file,
    this.leagueId,
    this.teamId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory LeagueChatModel.fromJson(Map<String, dynamic> json) => LeagueChatModel(
    id: json["id"],
    message: json["message"],
    file: json["file"],
    leagueId: json["league_id"],
    teamId: json["team_id"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "file": file,
    "league_id": leagueId,
    "team_id": teamId,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user?.toJson(),
  };
}

class User {
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
  List<TeamElement>? teams;

  User({
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
    this.teams,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    teams: json["teams"] == null ? [] : List<TeamElement>.from(json["teams"]!.map((x) => TeamElement.fromJson(x))),
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
    "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x.toJson())),
  };
}

class TeamElement {
  int? id;
  int? userId;
  int? teamId;
  DateTime? createdAt;
  DateTime? updatedAt;
  TeamTeam? team;

  TeamElement({
    this.id,
    this.userId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
    this.team,
  });

  factory TeamElement.fromJson(Map<String, dynamic> json) => TeamElement(
    id: json["id"],
    userId: json["user_id"],
    teamId: json["team_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    team: json["team"] == null ? null : TeamTeam.fromJson(json["team"]),
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

class TeamTeam {
  int? id;
  String? name;
  String? logo;
  String? code;
  int? captain;
  int? createdBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<League>? leagues;

  TeamTeam({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.captain,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.leagues,
  });

  factory TeamTeam.fromJson(Map<String, dynamic> json) => TeamTeam(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    code: json["code"],
    captain: json["captain"],
    createdBy: json["created_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    leagues: json["leagues"] == null ? [] : List<League>.from(json["leagues"]!.map((x) => League.fromJson(x))),
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
    "leagues": leagues == null ? [] : List<dynamic>.from(leagues!.map((x) => x.toJson())),
  };
}

class League {
  int? id;
  int? leagueId;
  int? teamId;
  DateTime? createdAt;
  DateTime? updatedAt;

  League({
    this.id,
    this.leagueId,
    this.teamId,
    this.createdAt,
    this.updatedAt,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    leagueId: json["league_id"],
    teamId: json["team_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "league_id": leagueId,
    "team_id": teamId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final statisticModel = statisticModelFromJson(jsonString);

import 'dart:convert';

List<StatisticModel> statisticModelFromJson(String str) =>
    List<StatisticModel>.from(
        json.decode(str).map((x) => StatisticModel.fromJson(x)));

String statisticModelToJson(List<StatisticModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatisticModel {
  int? leagueId;
  int? teamId;
  int? userId;
  int? count;
  User? user;
  League? league;
  Team? team;

  StatisticModel({
    this.leagueId,
    this.teamId,
    this.userId,
    this.count,
    this.user,
    this.league,
    this.team,
  });

  factory StatisticModel.fromJson(Map<String, dynamic> json) => StatisticModel(
        leagueId: json["league_id"],
        teamId: json["team_id"],
        userId: json["user_id"],
        count: json["count"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        league: json["league"] == null ? null : League.fromJson(json["league"]),
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "league_id": leagueId,
        "team_id": teamId,
        "user_id": userId,
        "count": count,
        "user": user?.toJson(),
        "league": league?.toJson(),
        "team": team?.toJson(),
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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

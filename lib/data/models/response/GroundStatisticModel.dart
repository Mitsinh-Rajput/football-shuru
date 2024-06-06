// To parse this JSON data, do
//
//     final groundStatisticModel = groundStatisticModelFromJson(jsonString);

import 'dart:convert';

List<GroundStatisticModel> groundStatisticModelFromJson(String str) => List<GroundStatisticModel>.from(json.decode(str).map((x) => GroundStatisticModel.fromJson(x)));

String groundStatisticModelToJson(List<GroundStatisticModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroundStatisticModel {
  int? groundId;
  int? teamId;
  int? userId;
  dynamic count;
  User? user;
  Ground? ground;
  Team? team;

  GroundStatisticModel({
    this.groundId,
    this.teamId,
    this.userId,
    this.count,
    this.user,
    this.ground,
    this.team,
  });

  factory GroundStatisticModel.fromJson(Map<String, dynamic> json) => GroundStatisticModel(
    groundId: json["ground_id"],
    teamId: json["team_id"],
    userId: json["user_id"],
    count: json["count"]?.toString(),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    ground: json["ground"] == null ? null : Ground.fromJson(json["ground"]),
    team: json["team"] == null ? null : Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "ground_id": groundId,
    "team_id": teamId,
    "user_id": userId,
    "count": count,
    "user": user?.toJson(),
    "ground": ground?.toJson(),
    "team": team?.toJson(),
  };
}

class Ground {
  int? id;
  String? title;
  String? address;
  int? pincode;
  dynamic latlong;
  dynamic userId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  String? description;
  dynamic mapLocation;
  int? groundKing;

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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

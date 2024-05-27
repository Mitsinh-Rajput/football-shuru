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

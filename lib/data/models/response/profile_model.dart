// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
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

  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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

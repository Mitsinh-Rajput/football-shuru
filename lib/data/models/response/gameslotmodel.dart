// To parse this JSON data, do
//
//     final gameSlot = gameSlotFromJson(jsonString);

import 'dart:convert';

List<GameSlot> gameSlotFromJson(String str) => List<GameSlot>.from(json.decode(str).map((x) => GameSlot.fromJson(x)));

String gameSlotToJson(List<GameSlot> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameSlot {
  int? id;
  DateTime? dateTime;
  String? title;
  CreatedBy? createdBy;
  LoggedInUserResponse? loggedInUserResponse;
  DateTime? createdAt;
  int? outCount;
  int? inCount;
  int? totalCount;
  List<GameSlotAttendance>? gameSlotAttendances;

  GameSlot({
    this.id,
    this.dateTime,
    this.title,
    this.createdBy,
    this.loggedInUserResponse,
    this.createdAt,
    this.outCount,
    this.inCount,
    this.totalCount,
    this.gameSlotAttendances,
  });

  factory GameSlot.fromJson(Map<String, dynamic> json) => GameSlot(
        id: json["id"],
        dateTime: json["date_time"] == null ? null : DateTime.parse(json["date_time"]),
        title: json["title"],
        createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
        loggedInUserResponse: json["logged_in_user_response"] == null ? LoggedInUserResponse(status: false) : LoggedInUserResponse.fromJson(json["logged_in_user_response"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
        outCount: json["out_count"],
        inCount: json["in_count"],
        totalCount: json["total_count"],
        gameSlotAttendances: json["game_slot_attendances"] == null ? [] : List<GameSlotAttendance>.from(json["game_slot_attendances"]!.map((x) => GameSlotAttendance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_time": dateTime?.toIso8601String(),
        "title": title,
        "created_by": createdBy?.toJson(),
        "logged_in_user_response": loggedInUserResponse?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "out_count": outCount,
        "in_count": inCount,
        "total_count": totalCount,
        "game_slot_attendances": gameSlotAttendances == null ? [] : List<dynamic>.from(gameSlotAttendances!.map((x) => x.toJson())),
      };

  @override
  bool operator ==(Object other) => other is GameSlot && id == other.id && dateTime == other.dateTime;

  @override
  int get hashCode => Object.hash(id, dateTime); // <----- here
}

class CreatedBy {
  final int? id;
  final String? name;

  CreatedBy({
    this.id,
    this.name,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class GameSlotAttendance {
  final int? id;
  final bool? status;
  final CreatedBy? user;

  GameSlotAttendance({
    this.id,
    this.status,
    this.user,
  });

  factory GameSlotAttendance.fromJson(Map<String, dynamic> json) => GameSlotAttendance(
        id: json["id"],
        status: json["status"],
        user: json["user"] == null ? null : CreatedBy.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "user": user?.toJson(),
      };
}

class LoggedInUserResponse {
  final int? id;
  bool? status;

  LoggedInUserResponse({
    this.id,
    this.status,
  });

  factory LoggedInUserResponse.fromJson(Map<String, dynamic> json) => LoggedInUserResponse(
        id: json["id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
}

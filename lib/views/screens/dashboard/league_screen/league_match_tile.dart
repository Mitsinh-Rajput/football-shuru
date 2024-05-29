import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/services/constants.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/date_picker_widget.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:get/get.dart';

import '../../../base/custom_image.dart';

class LeagueMatchTile extends StatefulWidget {
  final int index;
  final int leagueId;
  const LeagueMatchTile(
      {super.key, required this.leagueId, required this.index});

  @override
  State<LeagueMatchTile> createState() => _LeagueMatchTileState();
}

class _LeagueMatchTileState extends State<LeagueMatchTile> {
  int? _teamId;
  int? _opponentTeamId;

  int indexForChallengingChampionTeam = 0;
  bool isLoading = true;
  bool isAccepted = true;
  bool isUserTeam = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentLeagueController>(
        builder: (tournamentLeagueController) {
      bool isCaptain = false;
      if (Get.find<TournamentLeagueController>()
              .leagueDetails
              ?.leagueMatchSchedules?[widget.index]
              .team
              ?.captain ==
          Get.find<AuthController>().profile?.id) {
        isCaptain = true;
        _teamId = Get.find<TournamentLeagueController>()
            .leagueDetails
            ?.leagueMatchSchedules?[widget.index]
            .team
            ?.id;
      } else if (Get.find<TournamentLeagueController>()
              .leagueDetails
              ?.leagueMatchSchedules?[widget.index]
              .opponentTeam
              ?.captain ==
          Get.find<AuthController>().profile?.id) {
        isCaptain = true;
        _teamId = Get.find<TournamentLeagueController>()
            .leagueDetails
            ?.leagueMatchSchedules?[widget.index]
            .opponentTeam
            ?.id;
      }
      if (Get.find<TournamentLeagueController>()
              .leagueDetails
              ?.leagueMatchSchedules?[widget.index]
              .scheduledTimeStatus ==
          "rejected") {
        return tournamentLeagueController.isLoading
            ? CustomShimmer(
                child: Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(196, 196, 196, 1))),
                ),
              )
            : Container(
                height: 150,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.10),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(196, 196, 196, 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Match schedule is in process",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 145, 0, 1),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey,
                                        )),
                                    child: CustomImage(
                                        radius: 20,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.fill,
                                        path:
                                            '${AppConstants.baseUrl}${tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].team?.logo ?? ""}'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Team A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Text(
                                    tournamentLeagueController
                                            .leagueDetails
                                            ?.leagueMatchSchedules?[
                                                widget.index]
                                            .team
                                            ?.name ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                "Vs",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                    ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Team B",
                                    // textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    tournamentLeagueController
                                            .leagueDetails
                                            ?.leagueMatchSchedules?[
                                                widget.index]
                                            .opponentTeam
                                            ?.name ??
                                        "",
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFFE0E0E0),
                                      width: 1,
                                    )),
                                child: CustomImage(
                                    radius: 20,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                    path:
                                        '${AppConstants.baseUrl}${tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].opponentTeam?.logo ?? ""}'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 145, 0, 0.1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: (_teamId ?? 0) !=
                                            tournamentLeagueController
                                                .leagueDetails
                                                ?.leagueMatchSchedules?[
                                                    widget.index]
                                                .scheduledBy &&
                                        tournamentLeagueController
                                                .leagueDetails
                                                ?.leagueMatchSchedules?[
                                                    widget.index]
                                                .scheduledBy !=
                                            null
                                    ? "${DateTime.parse(tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].scheduledTime).dayDateTime}?"
                                    : tournamentLeagueController
                                                .leagueDetails
                                                ?.leagueMatchSchedules?[
                                                    widget.index]
                                                .scheduledBy !=
                                            null
                                        ? "${DateTime.parse(tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].scheduledTime).dayDateTime}. Waiting for response "
                                        : isCaptain
                                            ? "Please select a date for the match"
                                            : "Date selection in process",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontSize: 8, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (isCaptain)
                              if (_teamId !=
                                  tournamentLeagueController
                                      .leagueDetails
                                      ?.leagueMatchSchedules?[widget.index]
                                      .scheduledBy)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: CustomDatePicker(
                                    getTime: true,
                                    onChanged: (value) {
                                      if ((_teamId ?? 0) !=
                                          tournamentLeagueController
                                              .leagueDetails
                                              ?.leagueMatchSchedules?[
                                                  widget.index]
                                              .scheduledBy) {
                                        tournamentLeagueController
                                            .scheduleTime(
                                                leagueMatchScheduleId:
                                                    tournamentLeagueController
                                                            .leagueDetails
                                                            ?.leagueMatchSchedules?[
                                                                widget.index]
                                                            .id ??
                                                        0,
                                                scheduledBy: _teamId ?? 0,
                                                scheduledTime:
                                                    value!.toString())
                                            .then((value) {
                                          if (value.isSuccess) {
                                            Fluttertoast.showToast(
                                                msg: value.message);
                                            tournamentLeagueController
                                                .getLeagueDetail(
                                                    leagueId: widget.leagueId);
                                            tournamentLeagueController.update();
                                          }
                                        });
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please wait for the opponent to set the schedule");
                                      }

                                      // log(value.toString());
                                    },
                                    today: false,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xFF40424E),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            (_teamId ?? 0) !=
                                                        tournamentLeagueController
                                                            .leagueDetails
                                                            ?.leagueMatchSchedules?[
                                                                widget.index]
                                                            .scheduledBy &&
                                                    tournamentLeagueController
                                                            .leagueDetails
                                                            ?.leagueMatchSchedules?[
                                                                widget.index]
                                                            .scheduledBy !=
                                                        null
                                                ? "Reschedule"
                                                : "Select Time Slot",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 9),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (isCaptain)
                              if ((_teamId ?? 0) !=
                                      tournamentLeagueController
                                          .leagueDetails
                                          ?.leagueMatchSchedules?[widget.index]
                                          .scheduledBy &&
                                  tournamentLeagueController
                                          .leagueDetails
                                          ?.leagueMatchSchedules?[widget.index]
                                          .scheduledBy !=
                                      null)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: CustomButton(
                                    onTap: () {
                                      tournamentLeagueController
                                          .approveSchedule(
                                              leagueMatchScheduleId:
                                                  tournamentLeagueController
                                                          .leagueDetails
                                                          ?.leagueMatchSchedules?[
                                                              widget.index]
                                                          .id ??
                                                      0)
                                          .then((value) {
                                        if (value.isSuccess) {
                                          Fluttertoast.showToast(
                                              msg: value.message);
                                          tournamentLeagueController
                                              .getLeagueDetail(
                                                  leagueId: widget.leagueId);
                                          tournamentLeagueController.update();
                                        }
                                      });
                                    },
                                    type: ButtonType.primary,
                                    radius: 5,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Accept",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                          size: 12,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      } else {
        return tournamentLeagueController.isLoading
            ? CustomShimmer(
                child: Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(196, 196, 196, 1))),
                ),
              )
            : Container(
                height: 150,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(196, 196, 196, 1))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Match has been scheduled",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            255, 145, 0, 1),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.grey,
                                        )),
                                    child: CustomImage(
                                        radius: 20,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.fill,
                                        path:
                                            '${AppConstants.baseUrl}${tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].team?.logo ?? ""}'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Team A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Text(
                                    tournamentLeagueController
                                            .leagueDetails
                                            ?.leagueMatchSchedules?[
                                                widget.index]
                                            .team
                                            ?.name ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                "Vs",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                    ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Team B",
                                    // textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    tournamentLeagueController
                                            .leagueDetails
                                            ?.leagueMatchSchedules?[
                                                widget.index]
                                            .opponentTeam
                                            ?.name ??
                                        "",
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFFE0E0E0),
                                      width: 1,
                                    )),
                                child: CustomImage(
                                    radius: 20,
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.fill,
                                    path:
                                        '${AppConstants.baseUrl}${tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].opponentTeam?.logo ?? ""}'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 145, 0, 0.1),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Match Scheduled on ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          fontSize: 8, color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          "${DateTime.parse(tournamentLeagueController.leagueDetails?.leagueMatchSchedules?[widget.index].scheduledTime).dayDateTime}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              fontSize: 8,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }
    });
  }
}

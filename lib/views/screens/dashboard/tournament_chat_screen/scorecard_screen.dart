import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/data/models/response/joinedteam_model.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/screens/dashboard/dashboard_screen.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/scorecar_player_tile.dart';
import 'package:get/get.dart';

import '../../../../controllers/kingchallenge_controller.dart';
import '../../../../controllers/team_controller.dart';
import '../../../../services/constants.dart';
import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';

class ScoreCardScreen extends StatefulWidget {
  final MatchData;
  final bool isLeague;
  const ScoreCardScreen(
      {super.key, required this.MatchData, this.isLeague = false});

  @override
  State<ScoreCardScreen> createState() => _ScoreCardScreenState();
}

class _ScoreCardScreenState extends State<ScoreCardScreen> {
  int? totalgoals;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<TeamControllor>().getJoinedTeam().then((value) {
        Get.find<KingChallengeController>().scorecardDataList.clear();
        for (var j = 0; j < Get.find<TeamControllor>().joinedTeam.length; j++) {
          // print("dssdasd" +
          //     (Get.find<TeamControllor>().joinedTeam[j].team?.id ?? "")
          //         .toString());
          // print("dssdasd" + (widget.MatchData.team?.id ?? "").toString());
          if (Get.find<TeamControllor>().joinedTeam[j].team?.id.toString() ==
                  (widget.MatchData.team?.id ?? 0).toString() ||
              Get.find<TeamControllor>().joinedTeam[j].team?.id.toString() ==
                  (widget.MatchData.opponentTeam?.id ?? 0).toString()) {
            for (UserElement i
                in Get.find<TeamControllor>().joinedTeam[j].team?.users ?? []) {
              print(i.user?.name ?? "");
              Get.find<KingChallengeController>().scorecardDataList.add({
                "user_id": i.user?.id,
                "goals": 0,
                "assist": 0,
                "best_midfield": "No",
                "best_defender": "No"
              });
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Scorecard",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF40424E),
                ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(size.width, size.height * 0.05),
            child: Column(
              children: [
                const Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Sr. No\n& Name",
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "No. of\nGoals",
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "No. of\nAssist",
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Best \nMidField",
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Best \nDefender",
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(0, 4))
                    ],
                  ),
                )
              ],
            ),
          )),
      body: GetBuilder<TeamControllor>(builder: (teamControllor) {
        int? i;
        for (var j = 0; j < teamControllor.joinedTeam.length; j++) {
          if (Get.find<TeamControllor>().joinedTeam[j].team?.id.toString() ==
                  (widget.MatchData.team?.id ?? 0).toString() ||
              Get.find<TeamControllor>().joinedTeam[j].team?.id.toString() ==
                  (widget.MatchData.opponentTeam?.id ?? 0).toString()) {
            i = j;
          }
        }

        if (i == null) {
          return const SizedBox.shrink();
        } else {
          totalgoals =
              (Get.find<TeamControllor>().joinedTeam[i].team?.id.toString() ==
                      (widget.MatchData.team?.id ?? 0).toString())
                  ? widget.MatchData.teamGoals
                  : widget.MatchData.opponentTeamGoals;
          return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount:
                  (teamControllor.joinedTeam[i].team?.users ?? []).length,
              itemBuilder: (context, index) {
                final member =
                    teamControllor.joinedTeam[i ?? 0].team?.users?[index];
                int memberIndex = 0;
                for (var k = 0;
                    k <
                        Get.find<KingChallengeController>()
                            .scorecardDataList
                            .length;
                    k++) {
                  log(Get.find<KingChallengeController>()
                      .scorecardDataList[k]["user_id"]
                      .toString());
                  if (Get.find<KingChallengeController>().scorecardDataList[k]
                          ["user_id"] ==
                      member?.user?.id) {
                    memberIndex = k;
                    break;
                  }
                }
                return ScoreCardPlayerTile(
                  totalgoals: totalgoals ?? 0,
                  index: index,
                  member: member ?? UserElement(),
                  memberIndex: memberIndex,
                );
              });
        }
      }),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey.shade400))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                            color: ((widget.MatchData.winnerTeam ?? 0) ==
                                    (widget.MatchData.team?.id ?? 0))
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : Colors.grey,
                          )),
                      child: CustomImage(
                          radius: 20,
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                          path:
                              '${AppConstants.baseUrl}${widget.MatchData.team?.logo ?? ""}'),
                    ),
                    ((widget.MatchData.winnerTeam ?? 0) ==
                            (widget.MatchData.team?.id ?? 0))
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 145, 0, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CustomImage(
                                  height: 8,
                                  width: 8,
                                  path: Assets.imagesCrown1,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      widget.MatchData.teamGoals == null
                          ? "Team A"
                          : (widget.MatchData.teamGoals ?? 0).toString(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: widget.MatchData.teamGoals == null ? 8 : 22,
                          fontWeight: widget.MatchData.teamGoals == null
                              ? FontWeight.w400
                              : FontWeight.w700),
                    ),
                    Text(
                      widget.MatchData.team?.name ?? "",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 11,
                          fontWeight: widget.MatchData.teamGoals == null
                              ? FontWeight.w700
                              : FontWeight.w400),
                    ),
                  ],
                ),
                Text(
                  "Vs",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                ),
                Column(
                  children: [
                    Text(
                      widget.MatchData.opponentTeamGoals == null
                          ? "Team B"
                          : (widget.MatchData.opponentTeamGoals ?? 0)
                              .toString(),
                      // textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: widget.MatchData.opponentTeamGoals == null
                              ? 8
                              : 22,
                          fontWeight: widget.MatchData.opponentTeamGoals == null
                              ? FontWeight.w400
                              : FontWeight.w700),
                    ),
                    Text(
                      widget.MatchData.opponentTeam?.name ?? "",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 11,
                          fontWeight: widget.MatchData.opponentTeamGoals == null
                              ? FontWeight.w700
                              : FontWeight.w400),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: ((widget.MatchData.winnerTeam ?? 0) ==
                                    (widget.MatchData.opponentTeam?.id ?? 0))
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : Colors.grey,
                          )),
                      child: CustomImage(
                          radius: 20,
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                          path:
                              '${AppConstants.baseUrl}${widget.MatchData.opponentTeam?.logo ?? ""}'),
                    ),
                    ((widget.MatchData.winnerTeam ?? 0) ==
                            (widget.MatchData.opponentTeam?.id ?? 0))
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 145, 0, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CustomImage(
                                  height: 8,
                                  width: 8,
                                  path: Assets.imagesCrown1,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              color: const Color(0xFF263238),
              onTap: () {
                // log(Get.find<KingChallengeController>()
                //     .scorecardDataList
                //     .toString());

                Map<String, dynamic> data = {
                  "team_id": widget.MatchData.team?.id,
                };
                int totalPlayerGoals = 0;
                List<Map<String, dynamic>> scores = [];
                for (var i
                    in Get.find<KingChallengeController>().scorecardDataList) {
                  totalPlayerGoals += int.parse(i["goals"] ?? 0);
                  scores.add({
                    i["user_id"].toString(): {
                      "goals": i["goals"],
                      "assist": i["assist"],
                      "best_midfield": i["best_midfield"],
                      "best_defender": i["best_defender"]
                    }
                  });
                }
                data.addAll({"scores": scores});
                if (totalPlayerGoals > (totalgoals ?? 0)) {
                  Fluttertoast.showToast(
                      msg: "Number of Goals cannot be more than total goal");
                } else {
                  if (widget.isLeague) {
                    data.addAll({
                      "league_id": widget.MatchData.leagueId,
                      "league_match_schedule_id": widget.MatchData.id,
                    });
                    Get.find<TournamentLeagueController>()
                        .scorecard(data)
                        .then((value) {
                      if (value.isSuccess) {
                        Fluttertoast.showToast(msg: value.message);
                        Navigator.pushAndRemoveUntil(
                            context,
                            getCustomRoute(child: const DashboardScreen()),
                            (route) => false);
                      }
                    });
                  } else {
                    data.addAll({
                      "ground_id": widget.MatchData.groundId,
                      "ground_king_challenge_id": widget.MatchData.id,
                    });
                    Get.find<KingChallengeController>()
                        .scorecard(data)
                        .then((value) {
                      if (value.isSuccess) {
                        Fluttertoast.showToast(msg: value.message);
                        Navigator.pushAndRemoveUntil(
                            context,
                            getCustomRoute(child: const DashboardScreen()),
                            (route) => false);
                      }
                    });
                  }
                }
              },
              radius: 10,
              height: 50,
              child: Text(
                "Submit Scorecard",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

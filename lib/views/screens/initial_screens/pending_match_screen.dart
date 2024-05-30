import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/scorecard_screen.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/setwinner_screen.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/constants.dart';
import '../../../services/route_helper.dart';
import '../../base/custom_image.dart';
import '../dashboard/dashboard_screen.dart';

class PendingMatchScreen extends StatefulWidget {
  const PendingMatchScreen({super.key});

  @override
  State<PendingMatchScreen> createState() => _PendingMatchScreenState();
}

class _PendingMatchScreenState extends State<PendingMatchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<TeamControllor>().getJoinedTeam();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pending Matches"),
        centerTitle: true,
        actions: [
          if (kDebugMode)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: CustomButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    getCustomRoute(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 600),
                      child: const DashboardScreen(),
                    ),
                  );
                },
                title: "Skip",
              ),
            )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<KingChallengeController>().getPendingList();
        },
        child: GetBuilder<KingChallengeController>(
          builder: (kingChallengeController) {
            return ListView.separated(
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                  final matchData =
                      kingChallengeController.pendingMatchResultList[index];

                  return GestureDetector(
                    onTap: () {
                      if (matchData.winningTeamConfirmation == "confirmed") {
                        Navigator.push(
                            context,
                            getCustomRoute(
                                child: ScoreCardScreen(
                              MatchData: matchData,
                            )));
                      } else {
                        Navigator.push(
                            context,
                            getCustomRoute(
                                child: SetWinnerScreen(
                              MatchData: matchData,
                            )));
                      }
                    },
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
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
                                        (matchData.ground?.title ?? ""),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 2,
                                                color: ((matchData.winnerTeam ??
                                                            0) ==
                                                        (matchData.team?.id ??
                                                            0))
                                                    ? const Color.fromRGBO(
                                                        255, 145, 0, 1)
                                                    : Colors.grey,
                                              )),
                                          child: CustomImage(
                                              radius: 20,
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.fill,
                                              path:
                                                  '${AppConstants.baseUrl}${matchData.team?.logo ?? ""}'),
                                        ),
                                        ((matchData.winnerTeam ?? 0) ==
                                                (matchData.team?.id ?? 0))
                                            ? Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 145, 0, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
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
                                          matchData.teamGoals == null
                                              ? "Team A"
                                              : (matchData.teamGoals ?? 0)
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize:
                                                      matchData.teamGoals ==
                                                              null
                                                          ? 8
                                                          : 22,
                                                  fontWeight:
                                                      matchData.teamGoals ==
                                                              null
                                                          ? FontWeight.w400
                                                          : FontWeight.w700),
                                        ),
                                        Text(
                                          matchData.team?.name ?? "",
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 11,
                                                  fontWeight:
                                                      matchData.teamGoals ==
                                                              null
                                                          ? FontWeight.w700
                                                          : FontWeight.w400),
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
                                          matchData.opponentTeamGoals == null
                                              ? "Team B"
                                              : (matchData.opponentTeamGoals ??
                                                      0)
                                                  .toString(),
                                          // textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: matchData
                                                              .opponentTeamGoals ==
                                                          null
                                                      ? 8
                                                      : 22,
                                                  fontWeight: matchData
                                                              .opponentTeamGoals ==
                                                          null
                                                      ? FontWeight.w400
                                                      : FontWeight.w700),
                                        ),
                                        Text(
                                          matchData.opponentTeam?.name ?? "",
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: matchData
                                                              .opponentTeamGoals ==
                                                          null
                                                      ? FontWeight.w700
                                                      : FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 2,
                                                color: ((matchData.winnerTeam ??
                                                            0) ==
                                                        (matchData.opponentTeam
                                                                ?.id ??
                                                            0))
                                                    ? const Color.fromRGBO(
                                                        255, 145, 0, 1)
                                                    : Colors.grey,
                                              )),
                                          child: CustomImage(
                                              radius: 20,
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.fill,
                                              path:
                                                  '${AppConstants.baseUrl}${matchData.opponentTeam?.logo ?? ""}'),
                                        ),
                                        ((matchData.winnerTeam ?? 0) ==
                                                (matchData.opponentTeam?.id ??
                                                    0))
                                            ? Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 145, 0, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: (matchData.winningTeamConfirmation ==
                                              "confirmed")
                                          ? "Scorecard not submitted"
                                          : (matchData.winningTeamConfirmation ==
                                                      "pending" &&
                                                  matchData.winnerTeam ==
                                                      null &&
                                                  matchData.teamGoals == null &&
                                                  matchData.opponentTeamGoals ==
                                                      null)
                                              ? "Result not declared"
                                              : (matchData.winningTeamConfirmation ==
                                                          "pending" &&
                                                      matchData
                                                              .winnerTeamResponseByUser ==
                                                          Get.find<
                                                                  AuthController>()
                                                              .profile
                                                              ?.id)
                                                  ? "Waiting for opponent's confirmation"
                                                  : "Your confirmation is pending",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              fontSize: 8, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount:
                    kingChallengeController.pendingMatchResultList.length);
          },
        ),
      ),
    );
  }
}

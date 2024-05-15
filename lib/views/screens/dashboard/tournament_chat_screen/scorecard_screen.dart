import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/data/models/response/joinedteam_model.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/scorecar_player_tile.dart';
import 'package:get/get.dart';

import '../../../../controllers/homepage_controller.dart';
import '../../../../controllers/kingchallenge_controller.dart';
import '../../../../controllers/team_controller.dart';
import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';

class ScoreCardScreen extends StatefulWidget {
  final bool isTeamAWinner;
  const ScoreCardScreen({super.key, required this.isTeamAWinner});

  @override
  State<ScoreCardScreen> createState() => _ScoreCardScreenState();
}

class _ScoreCardScreenState extends State<ScoreCardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<TeamControllor>().getJoinedTeam().then((value) {
        Get.find<KingChallengeController>().scorecardDataList.clear();
        for (var j = 0; j < Get.find<TeamControllor>().joinedTeam.length; j++) {
          if (Get.find<TeamControllor>().joinedTeam[j].team?.id ==
                  Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.team
                      ?.id! ||
              Get.find<TeamControllor>().joinedTeam[j].team?.id ==
                  Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.opponentTeam
                      ?.id!) {
            for (UserElement i
                in Get.find<TeamControllor>().joinedTeam[j].team?.users ?? []) {
              Get.find<KingChallengeController>().scorecardDataList.add({
                "user_id": i.user?.id,
                "goals": 0,
                "assist": 0,
                "best_midfield": "",
                "best_defender": ""
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
          if (teamControllor.joinedTeam[j].team?.id ==
                  Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.team
                      ?.id! ||
              teamControllor.joinedTeam[j].team?.id ==
                  Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.opponentTeam
                      ?.id!) {
            i = j;
          }
        }
        if (i == null) {
          return const SizedBox.shrink();
        } else {
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
                            color: widget.isTeamAWinner
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : const Color(0xFFA5A5A5),
                          )),
                      child: CustomImage(
                        radius: 20,
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        path: Get.find<HomePageController>()
                                .groundsDetail
                                ?.groundKingChallenge
                                ?.team
                                ?.logo ??
                            "",
                      ),
                    ),
                    widget.isTeamAWinner
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
                                    path:
                                        "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KtgSPjADbFef0XclcRL4-HfqDdzt0Peoi~9I2iBlSq-deQeJtZb6RcisiIdvgKaOnTNXKo5x8wMEzgUWFAe4YTh2omCmwJH6x1HqTsCaouEZbEP1VWSb1d14gjiz1zMpVlmdFqCXvKodrACJAffKBKmUumRbXItn5W2jTw4dX-6tBk6b4-CskgkBKl-dZImpgJ0B1MnUgYYp8X0H7kTJeE9Gmrx9ofHkLHarlbeApCnvwVa-QqKK2JajNJlrsJLBN1zZEUwC2t70GmqpD-Mbb3MnPtL4tugqrCCrMELmOGjVp2phbwhNZ6YB7YHOsbWpjoQ8FPIowv64esDaKaUGJQ__"),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Team A",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      Get.find<HomePageController>()
                              .groundsDetail
                              ?.groundKingChallenge
                              ?.team
                              ?.name ??
                          "",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
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
                      "Team B",
                      // textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFA5A5A5)),
                    ),
                    Text(
                      Get.find<HomePageController>()
                              .groundsDetail
                              ?.groundKingChallenge
                              ?.opponentTeam
                              ?.name ??
                          "",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFA5A5A5)),
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
                            color: !widget.isTeamAWinner
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : const Color(0xFFA5A5A5),
                          )),
                      child: CustomImage(
                        radius: 20,
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        path: Get.find<HomePageController>()
                                .groundsDetail
                                ?.groundKingChallenge
                                ?.opponentTeam
                                ?.logo ??
                            "",
                      ),
                    ),
                    !widget.isTeamAWinner
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
                                    path:
                                        "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KtgSPjADbFef0XclcRL4-HfqDdzt0Peoi~9I2iBlSq-deQeJtZb6RcisiIdvgKaOnTNXKo5x8wMEzgUWFAe4YTh2omCmwJH6x1HqTsCaouEZbEP1VWSb1d14gjiz1zMpVlmdFqCXvKodrACJAffKBKmUumRbXItn5W2jTw4dX-6tBk6b4-CskgkBKl-dZImpgJ0B1MnUgYYp8X0H7kTJeE9Gmrx9ofHkLHarlbeApCnvwVa-QqKK2JajNJlrsJLBN1zZEUwC2t70GmqpD-Mbb3MnPtL4tugqrCCrMELmOGjVp2phbwhNZ6YB7YHOsbWpjoQ8FPIowv64esDaKaUGJQ__"),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
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
                  "team_id": Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.team
                      ?.id,
                  "ground_id": Get.find<HomePageController>().groundsDetail?.id,
                  "ground_king_challenge_id": Get.find<HomePageController>()
                      .groundsDetail
                      ?.groundKingChallenge
                      ?.id,
                };
                List<Map<String, dynamic>> scores = [];
                for (var i
                    in Get.find<KingChallengeController>().scorecardDataList) {
                  scores.add({
                    i["user_id"].toString(): {
                      "goals": i["goals"],
                      "assist": i["assist"],
                      "best_midfield": i["best_midfield"],
                      "best_defender": i["best_defender"]
                    }
                  });
                }
                print(scores);
                data.addAll({"scores": scores});
                print(data);
                Get.find<KingChallengeController>()
                    .scorecard(data)
                    .then((value) {
                  if (value.isSuccess) {
                    Fluttertoast.showToast(msg: value.message);
                  }
                });
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

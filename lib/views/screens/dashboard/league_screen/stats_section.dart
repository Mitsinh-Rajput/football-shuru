import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:get/get.dart';

import '../../../../data/models/response/statistic_model.dart';
import '../../../../services/constants.dart';
import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';
import '../../../base/lottie_builder.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List titles = ["Goals", "Assist", "Best Defenders", "Best Midfielders"];
  int buttonIndex = 0;
  List<StatisticModel> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = Get.find<TournamentLeagueController>().leagueGoals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: CustomButton(
                          borderColor: (buttonIndex == index)
                              ? null
                              : Colors.grey.shade500,
                          color: (buttonIndex == index)
                              ? const Color.fromRGBO(38, 50, 56, 1)
                              : Colors.white,
                          height: 30,
                          elevation: 0,
                          radius: 15,
                          type: (buttonIndex == index)
                              ? ButtonType.primary
                              : ButtonType.secondary,
                          child: Text(
                            titles[index],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 12,
                                    color: (buttonIndex == index)
                                        ? Colors.white
                                        : Colors.black),
                          ),
                          onTap: () {
                            setState(() {
                              buttonIndex = index;
                              if (index == 0) {
                                data = Get.find<TournamentLeagueController>()
                                    .leagueGoals;
                              } else if (index == 1) {
                                data = Get.find<TournamentLeagueController>()
                                    .leagueAssists;
                              } else if (index == 2) {
                                data = Get.find<TournamentLeagueController>()
                                    .leagueBestDefenders;
                              } else if (index == 3) {
                                data = Get.find<TournamentLeagueController>()
                                    .leagueBestMidfielders;
                              }
                            });
                          }),
                    );
                  }),
            ),
            const SizedBox(
              height: 14,
            ),
            data.isEmpty
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomLottie(
                  assetLottie: Assets.lottiesFootballWait,
                  height: 200,
                ),
                Text(
                  "Please wait, ${titles[buttonIndex]} are being calculated...",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 16),
                )
              ],
            )
                : ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  StatisticModel player = data[index];
                  return Container(
                    height: 90,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(196, 196, 196, 1))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${index + 1}.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 1,
                                        color: Colors.grey.shade500,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.2),
                                                offset: Offset(
                                                  1.0,
                                                  1.0,
                                                ),
                                                blurRadius: 1.0,
                                                spreadRadius: 1.0,
                                              )
                                            ],
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white,
                                            )),
                                        child: CustomImage(
                                            radius: 20,
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.fill,
                                            path:
                                                '${AppConstants.baseUrl}${player.team?.logo ?? ""}'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            player.team?.name ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            player.user?.name ?? "",
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
                                    ],
                                  ),
                                  Text(
                                    (player.count ?? "0"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                  )
                                  // RichText(
                                  //   textAlign: TextAlign.center,
                                  //   text: TextSpan(
                                  //       text:
                                  //           "Number of ${buttonIndex == 0 ? "Goals" : buttonIndex == 1 ? "Assists" : buttonIndex == 2 ? "Best Defender Awards" : "Best Midfielder Awards"} - ",
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .titleSmall!
                                  //           .copyWith(
                                  //               fontSize: 9,
                                  //               fontWeight: FontWeight.w600),
                                  //       children: [
                                  //         TextSpan(
                                  //           text: "\n${(player.count ?? "0")}",
                                  //           style: Theme.of(context)
                                  //               .textTheme
                                  //               .titleSmall!
                                  //               .copyWith(
                                  //                   fontSize: 11,
                                  //                   fontWeight:
                                  //                       FontWeight.w400),
                                  //         ),
                                  //       ]),
                                  // )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

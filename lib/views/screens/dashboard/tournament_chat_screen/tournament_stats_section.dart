import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:football_shuru/data/models/response/GroundStatisticModel.dart';
import 'package:get/get.dart';

import '../../../../services/constants.dart';
import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';

class TournamentStatsSection extends StatefulWidget {
  const TournamentStatsSection({super.key});

  @override
  State<TournamentStatsSection> createState() => _TournamentStatsSectionState();
}

class _TournamentStatsSectionState extends State<TournamentStatsSection> {
  List titles = ["Goals", "Assist", "Best Defenders", "Best Midfielders"];
  int buttonIndex = 0;
  List<GroundStatisticModel> data = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = Get.find<KingChallengeController>().groundGoals;
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
                                data = Get.find<KingChallengeController>()
                                    .groundGoals;
                              } else if (index == 1) {
                                data = Get.find<KingChallengeController>()
                                    .groundAssists;
                              } else if (index == 2) {
                                data = Get.find<KingChallengeController>()
                                    .groundBestDefender;
                              } else if (index == 3) {
                                data = Get.find<KingChallengeController>()
                                    .groundBestMidFielder;
                              }
                            });
                          }),
                    );
                  }),
            ),
            const SizedBox(
              height: 6,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  GroundStatisticModel player = data[index];
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

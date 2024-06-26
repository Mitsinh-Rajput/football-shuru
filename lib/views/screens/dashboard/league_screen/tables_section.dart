import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/views/base/lottie_builder.dart';
import 'package:get/get.dart';

import '../../../../data/models/response/league_table_model.dart';
import '../../../../services/constants.dart';
import '../../../base/custom_image.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key});

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Teams",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "P",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      "W",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                      "D",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "L",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            GetBuilder<TournamentLeagueController>(
                builder: (tournamentLeagueController) {
              return tournamentLeagueController.isLoading
                  ? Center(
                      child: CustomLottie(
                        assetLottie: Assets.lottiesFootball,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          tournamentLeagueController.leagueTableList.length,
                      itemBuilder: (context, index) {
                        LeagueTableModel tableRow =
                            tournamentLeagueController.leagueTableList[index];
                        return Container(
                          height: 70,
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
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
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                )),
                                            child: CustomImage(
                                              radius: 20,
                                              height: 30,
                                              width: 30,
                                              fit: BoxFit.fill,
                                              path:
                                                  '${AppConstants.baseUrl}${tableRow.team?.logo ?? ""}',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            tableRow.team?.name ?? "",
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
                                      Row(
                                        children: [
                                          Text(
                                            (tableRow.totalMatchesPlayed ?? 0)
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            (tableRow.winningMatches ?? 0)
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            (tableRow.drawMatches ?? 0)
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            (tableRow.loseMatches ?? 0)
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          // const SizedBox(
                                          //   width: 30,
                                          // ),
                                          // Text(
                                          //   "26",
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .titleSmall!
                                          //       .copyWith(
                                          //           fontSize: 13,
                                          //           fontWeight:
                                          //               FontWeight.w400),
                                          // ),
                                          // const SizedBox(
                                          //   width: 5,
                                          // )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 1,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            224, 224, 224, 1))),
                              )
                            ],
                          ),
                        );
                      });
            })
          ],
        ),
      ),
    );
  }
}

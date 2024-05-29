import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/data/models/response/league_model.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/selected_team_for_tournament.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_details.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/theme.dart';
import '../../../base/common_button.dart';
import '../league_screen/add_league.dart';

class LeagueAndTourScreen extends StatefulWidget {
  const LeagueAndTourScreen({super.key});

  @override
  State<LeagueAndTourScreen> createState() => _LeagueAndTourScreenState();
}

class _LeagueAndTourScreenState extends State<LeagueAndTourScreen> {
  List typesOfLeaguelist = [
    "League’s match",
    "League’s match",
    "Knock out",
    "Round robins",
    "League’s match"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "League’s / Tournament",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      getCustomRoute(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          child: AddLeague()));
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Add League",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          GetBuilder<TournamentLeagueController>(
              builder: (tournamentLeagueController) {
            if (tournamentLeagueController.isLoading) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: typesOfLeaguelist.length,
                  itemBuilder: (context, index) {
                    return CustomShimmer(
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: Colors.grey.shade200),
                        ),
                      ),
                    );
                  });
            }
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (tournamentLeagueController.league ?? []).length,
                itemBuilder: (context, index) {
                  LeagueModel league = tournamentLeagueController.league[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 115,
                          width: 3,
                          color: primaryColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            league.name ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 16,
                                                  color: Colors.black87,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "10 Feb 2024 to 22 Feb 2024",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 11,
                                                  color: Colors.black87,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            typesOfLeaguelist[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "Participate ${league.numberOfParticipants} Team",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                color: const Color(0xffFF9100),
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                //
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "Description : ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: league.description ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomButton(
                                      height: 34,
                                      elevation: 0,
                                      radius: 6,
                                      type: ButtonType.secondary,
                                      borderColor: Colors.grey.shade800,
                                      title: "View Details",
                                      fontSize: 10,
                                      onTap: () async {
                                        await Get.find<
                                                TournamentLeagueController>()
                                            .getLeagueDetail(
                                                leagueId:
                                                    tournamentLeagueController
                                                            .league[index].id ??
                                                        0);
                                        Get.find<TournamentLeagueController>()
                                            .update();
                                        Navigator.push(
                                          context,
                                          getCustomRoute(
                                            type: PageTransitionType.fade,
                                            duration: const Duration(
                                                milliseconds: 600),
                                            child: LeagueDetailsPage(
                                              typesOfLeague:
                                                  typesOfLeaguelist[index],
                                              league: tournamentLeagueController
                                                  .league[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: CustomButton(
                                        // minWidth: 0,
                                        color: primaryColor,
                                        height: 34,
                                        elevation: 0,
                                        radius: 6,
                                        type: ButtonType.primary,
                                        onTap: ((league.teams ?? []).length ==
                                                int.parse(league
                                                        .numberOfParticipants ??
                                                    "0"))
                                            ? null
                                            : () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text("Confimation"),
                                                        content: Text(
                                                            "Are you sure you want to participate?"),
                                                        actions: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    CustomButton(
                                                                  elevation: 0,
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    TeamSelectionDialogue().dialogue(
                                                                        context,
                                                                        league);
                                                                  },
                                                                  child: Text(
                                                                      "Yes"),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    CustomButton(
                                                                  elevation: 0,
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      "No"),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      );
                                                    });
                                              },
                                        // title: "23/40 Team • Participate Now",
                                        child: Text(
                                          "${(league.teams ?? []).length}/${league.numberOfParticipants} Team • ${((league.teams ?? []).length == int.parse(league.numberOfParticipants ?? "0")) ? "Team Full" : "Participate Now"}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }
}

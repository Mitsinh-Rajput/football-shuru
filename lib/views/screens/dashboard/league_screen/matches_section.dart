import 'package:flutter/material.dart';
import 'package:football_shuru/generated/assets.dart';
import 'package:football_shuru/views/base/lottie_builder.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_match_tile.dart';
import 'package:get/get.dart';

import '../../../../controllers/tournament_league_controller.dart';
import '../../../../data/models/response/league_model.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Get.find<TournamentLeagueController>()
            .getLeagueDetail(leagueId: Get.find<TournamentLeagueController>()
            .leagueDetails?.id?? 0);
      },
      child: (Get.find<TournamentLeagueController>()
                      .leagueDetails
                      ?.leagueMatchSchedules ??
                  [])
              .isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomLottie(
                  assetLottie: Assets.lottiesFootballWait,
                  height: 200,
                ),
                Text(
                  "Please wait, matches are being assigned...",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 16),
                )
              ],
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Text(
                      "Participants Matches group’s",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(38, 50, 56, 1),
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (Get.find<TournamentLeagueController>()
                                  .leagueDetails
                                  ?.leagueMatchSchedules ??
                              [])
                          .length,
                      itemBuilder: (context, index) {
                        LeagueMatchSchedule match =
                            Get.find<TournamentLeagueController>()
                                    .leagueDetails
                                    ?.leagueMatchSchedules?[index] ??
                                LeagueMatchSchedule();
                        return LeagueMatchTile(
                          index: index,
                          leagueId: match.leagueId ?? 0,
                        );
                      })
                ],
              ),
            ),
    );
  }
}

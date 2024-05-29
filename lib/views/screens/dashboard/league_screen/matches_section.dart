import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
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
              physics: NeverScrollableScrollPhysics(),
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
    );
  }
}

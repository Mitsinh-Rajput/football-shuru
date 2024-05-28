import 'package:flutter/material.dart';

import '../../../../data/models/response/league_model.dart';
import '../../../../services/constants.dart';
import '../../../base/custom_image.dart';

class MatchesPage extends StatefulWidget {
  final List<LeagueMatchSchedule> leagueMatches;
  const MatchesPage({super.key, required this.leagueMatches});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Participants Matches group’s",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(38, 50, 56, 1),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.leagueMatches.length,
                itemBuilder: (context, index) {
                  LeagueMatchSchedule match = widget.leagueMatches[index];
                  return Container(
                    height: 150,
                    margin: const EdgeInsets.symmetric(vertical: 10),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tournament: Group Match ${index + 1}",
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
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                            '${AppConstants.baseUrl}${match.team?.logo ?? ""}'),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        match.team?.name ?? "",
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
                                    "V/s",
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Team B",
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      Text(
                                        match.opponentTeam?.name ?? "",
                                        textAlign: TextAlign.end,
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
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    child: CustomImage(
                                        radius: 20,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.fill,
                                        path:
                                            '${AppConstants.baseUrl}${match.opponentTeam?.logo ?? ""}'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 145, 0, 0.25),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Started date 10 feb 2024, 10 AM to 5 PM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(64, 66, 78, 1),
                                      ),
                                ),
                                Text(
                                  "Started at. 0:10:26",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            43, 63, 108, 1),
                                      ),
                                ),
                              ],
                            ),
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

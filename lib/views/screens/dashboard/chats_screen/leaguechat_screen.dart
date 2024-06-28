import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_details.dart';
import 'package:get/get.dart';

import '../../../../data/models/response/league_model.dart';
import '../../../../services/route_helper.dart';
import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';
import '../../../base/lottie_builder.dart';

class LeagueChatScreen extends StatefulWidget {
  final List memberCount;
  const LeagueChatScreen({super.key, required this.memberCount});

  @override
  State<LeagueChatScreen> createState() => _LeagueChatScreenState();
}

class _LeagueChatScreenState extends State<LeagueChatScreen> {
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentLeagueController>(builder: (tournamentLeagueController) {
      return tournamentLeagueController.isLoading
          ? Center(
        child: CustomLottie(
          assetLottie: Assets.lottiesFootball,
          height: 50,
        ),
      )
          : ListView.builder(
        itemCount: tournamentLeagueController.league.length,
        itemBuilder: (context, index) {
          final LeagueModel league = tournamentLeagueController.league[index];

          return GestureDetector(
            onTap: (){
              Navigator.push(context, getCustomRoute(child:  LeagueDetailsPage(typesOfLeague: league.type ?? "", league: league,chatroom: true)));
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    radius: 50,
                    path: league.image ?? "",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            league.name ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // if (league.lastMessage?.message != null)
                        //   Container(
                        //     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        //     child: Text(
                        //       team.team?.lastMessage?.message ?? "",
                        //       maxLines: 1,
                        //       overflow: TextOverflow.ellipsis,
                        //       style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        //         color: textPrimary,
                        //         fontWeight: FontWeight.w300,
                        //       ),
                        //     ),
                        //   ),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "${widget.memberCount[index] ?? ""} • members".toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: const Color(0xffFF9100),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  // if (team.team?.lastMessage?.createdAt != null)
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  //         child: Text(
                  //           DateFormatters().hMA.format(team.team!.lastMessage!.createdAt!),
                  //           style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //       if (team.team?.unreadMessagesCount?.isGreaterThan(0) ?? false)
                  //         const SizedBox(
                  //           height: 4,
                  //         ),
                  //       if (team.team?.unreadMessagesCount?.isGreaterThan(0) ?? false)
                  //         Container(
                  //           padding: const EdgeInsets.all(6),
                  //           decoration: const BoxDecoration(
                  //             color: Colors.green,
                  //             shape: BoxShape.circle,
                  //           ),
                  //           child: Text(
                  //             "${team.team?.unreadMessagesCount}",
                  //             style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //         ),
                  //     ],
                  //   )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

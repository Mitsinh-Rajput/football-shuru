import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/data/models/response/league_model.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/lottie_builder.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/knock_out_matches.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_chat.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/matches_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/stats_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/tables_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/teams_section.dart';
import 'package:get/get.dart';

import '../../../base/common_button.dart';

class LeagueDetailsPage extends StatefulWidget {
  final String typesOfLeague;
  final LeagueModel league;
  final bool chatroom;
  const LeagueDetailsPage(
      {super.key, required this.typesOfLeague, required this.league,  this.chatroom=false});

  @override
  State<LeagueDetailsPage> createState() => _LeagueDetailsPageState();
}

class _LeagueDetailsPageState extends State<LeagueDetailsPage> {
  late final PageController pageController;
  int index = 0;

  List<SliderList> introList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.chatroom){
      index=4;
    }
    pageController = PageController(initialPage: index);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<TournamentLeagueController>()
          .getLeagueDetail(leagueId: widget.league.id ?? 0);
      Get.find<TournamentLeagueController>()
          .getStatisticData(leagueId: widget.league.id ?? 0, type: "goal");
      Get.find<TournamentLeagueController>()
          .getStatisticData(leagueId: widget.league.id ?? 0, type: "assist");
      Get.find<TournamentLeagueController>().getStatisticData(
          leagueId: widget.league.id ?? 0, type: "best_defender");
      Get.find<TournamentLeagueController>().getStatisticData(
          leagueId: widget.league.id ?? 0, type: "best_midfield");
    });
    introList = [
      SliderList(
          title: "Matches",
          content: (widget.typesOfLeague == "knockout")
              ? const KnockOutPage()
              : const MatchesPage()),
      SliderList(title: "Tables", content: const TableSection()),
      SliderList(title: "Stats", content: const Stats()),
      SliderList(
          title: "Teams",
          content: Teams(
            teams:
            (Get.find<TournamentLeagueController>().leagueDetails?.teams ??
                widget.league.teams ??
                []),
          )),
      SliderList(
          title: "Chatroom",
          content: LeagueChat(leagueModel: widget.league,)),
    ];
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<TournamentLeagueController>().leagueDetails = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              Assets.imagesArrowLeft,
              height: 24,
              width: 24,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            const CustomImage(
              height: 24,
              width: 24,
              path: Assets.imagesEllipse68,
            ),
      const SizedBox(
              width: 10,
            ),
            Text(
              widget.league.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        actions: [
          // Image.asset(
          //   Assets.imagesShareIconUIA,
          //   height: 22,
          //   width: 22,
          // ),
          // const SizedBox(
          //   width: 26,
          // ),
          // Image.asset(
          //   Assets.imagesChat,
          //   height: 22,
          //   width: 22,
          // ),
          // const SizedBox(
          //   width: 16,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 8, bottom: 10),
            child: CustomButton(
                radius: 4,
                color: const Color.fromRGBO(255, 200, 57, 1),
                child: Text(
                  widget.typesOfLeague,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
                onTap: () {}),
          ),
        ],
        //
      ),
      body: GetBuilder<TournamentLeagueController>(
          builder: (tournamentLeagueController) {
        return tournamentLeagueController.isLoading
            ? const Center(
                child: CustomLottie(
                  assetLottie: Assets.lottiesFootball,
                  height: 50,
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 50,
                    color: const Color.fromRGBO(38, 50, 56, 1),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 0; i < introList.length; i++)
                              GestureDetector(
                                onTap: () {
                                  pageController
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.linear,
                                  )
                                      .then((value) {
                                    setState(() {
                                      index = i;
                                    });
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Text(
                                        introList[i].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 2,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                          color: (i == index)
                                              ? const Color.fromRGBO(
                                                  255, 200, 57, 1)
                                              : const Color.fromRGBO(
                                                  38, 50, 56, 1),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: PageView.builder(
                          onPageChanged: (index) {
                            setState(() {
                              this.index = index;
                            });
                          },
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: introList.length,
                          itemBuilder: (context, index) {
                            return introList[index].content;
                          },),),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: KnockOutPage(),
                  //   ),
                  // )
                ],
              );
      }),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Container(
      //   width: 50,
      //     height: 50,
      //     padding: EdgeInsets.all(10),
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(40),
      //       color: Colors.black12
      //     ),
      //     child: GestureDetector(onTap: () => _openChatPopup(context),child: const CustomImage(path: Assets.imagesChats,height: 30,width: 30,),)),
    );
  }
}

class SliderList {
  String title;
  Widget content;
  SliderList({
    required this.title,
    required this.content,
  });
}

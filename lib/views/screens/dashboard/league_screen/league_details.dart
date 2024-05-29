import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/data/models/response/league_model.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/knock_out_matches.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/matches_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/stats_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/tables_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/teams_section.dart';
import 'package:get/get.dart';

class LeagueDetailsPage extends StatefulWidget {
  final String typesOfLeague;
  final LeagueModel league;
  const LeagueDetailsPage(
      {super.key, required this.typesOfLeague, required this.league});

  @override
  State<LeagueDetailsPage> createState() => _LeagueDetailsPageState();
}

class _LeagueDetailsPageState extends State<LeagueDetailsPage> {
  final pageController = PageController();
  int index = 0;

  List<SliderList> introList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<TournamentLeagueController>()
          .getLeagueDetail(leagueId: widget.league.id ?? 0);
      Get.find<TournamentLeagueController>().update();
    });
    introList = [
      SliderList(
          title: "Matches",
          content: (widget.typesOfLeague == "Knock out")
              ? const KnockOutPage()
              : MatchesPage()),
      SliderList(
          title: "Teams",
          content: Teams(
            teams:
                (Get.find<TournamentLeagueController>().leagueDetails?.teams ??
                    []),
          )),
      SliderList(title: "Tables", content: const TableSection()),
      SliderList(title: "Stats", content: const Stats()),
    ];
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
        title: Text(
          "League/Tournament",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 16, color: Colors.white),
        ),
        actions: [
          Image.asset(
            Assets.imagesShareIconUIA,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 26,
          ),
          Image.asset(
            Assets.imagesChat,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        //
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(38, 50, 56, 1),
            height: 270,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          height: 30,
                          radius: 4,
                          color: const Color.fromRGBO(255, 200, 57, 1),
                          child: Text(
                            widget.typesOfLeague,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 11,
                                ),
                          ),
                          onTap: () {}),
                    ],
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                    child: const CustomImage(
                      height: 50,
                      width: 50,
                      path: Assets.imagesEllipse68,
                    ),
                  ),
                  Text(widget.league.name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 20, color: Colors.white)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "10 Feb 2024 to 22 Feb 2024 • 276k Participant",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 11,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          radius: 0,
                          child: Row(
                            children: [
                              const CustomImage(path: Assets.imagesAdd),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Join Tournament",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12, color: Colors.white),
                              )
                            ],
                          ),
                          onTap: () {}),
                      CustomButton(
                          color: Colors.white,
                          radius: 0,
                          child: Row(
                            children: [
                              const CustomImage(
                                  height: 24,
                                  width: 24,
                                  path: Assets.imagesReceiptText),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Join Tournament",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                    ),
                              )
                            ],
                          ),
                          onTap: () {})
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            color: const Color.fromRGBO(38, 50, 56, 1),
            child: Column(
              children: [
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
                                      ? const Color.fromRGBO(255, 200, 57, 1)
                                      : const Color.fromRGBO(38, 50, 56, 1),
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
                  }))
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //     child: KnockOutPage(),
          //   ),
          // )
        ],
      ),
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

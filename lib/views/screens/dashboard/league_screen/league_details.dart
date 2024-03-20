import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/knock_out_matches.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/matches_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/stats_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/tables_section.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/teams_section.dart';

import '../../../../generated/assets.dart';
import '../../../../services/theme.dart';

class LeagueDetailsPage extends StatefulWidget {
  final String typesOfLeague;
  const LeagueDetailsPage({super.key, required this.typesOfLeague});

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
    introList = [
      SliderList(
          title: "Matches",
          content: (widget.typesOfLeague == "Knock out")
              ? KnockOutPage()
              : MatchesPage()),
      SliderList(
          title: "Teams",
          content: Teams()),
      SliderList(
          title: "Tables",
          content: TableSection()),
      SliderList(
          title: "Stats",
          content: Stats()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: GestureDetector(
          onTap: (){
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
            color: Color.fromRGBO(38, 50, 56, 1),
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
                          color: Color.fromRGBO(255, 200, 57, 1),
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
                    child: CustomImage(
                      height: 50,
                      width: 50,
                      path: Assets.imagesEllipse68,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 255, 255, 0.1),
                    ),
                  ),
                  Text("Ground King League’s",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 20, color: Colors.white)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "10 Feb 2024 to 22 Feb 2024 • 276k Participant",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 11,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                          radius: 0,
                          child: Row(
                            children: [
                              CustomImage(path: Assets.imagesAdd),
                              SizedBox(
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
                              CustomImage(
                                  height: 24,
                                  width: 24,
                                  path: Assets.imagesReceiptText),
                              SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            color: Color.fromRGBO(38, 50, 56, 1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < introList.length; i++)
                      Column(
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: (i == index)
                                  ? Color.fromRGBO(255, 200, 57, 1)
                                  : Color.fromRGBO(38, 50, 56, 1),
                            )),
                          )
                        ],
                      ),
                  ],
                ),
                SizedBox(
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

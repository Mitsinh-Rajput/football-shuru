import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_appbar.dart';
import 'package:football_shuru/views/base/custom_image.dart';

import '../../../../services/theme.dart';

class LeagueScreen extends StatefulWidget {
  const LeagueScreen({super.key});

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  final pageController = PageController();
  int index = 0;
  List league_tournament = [
    LeaguePageList(title: "Open to participate", content: [
      LeagueList(
          title: "Ground King League’s",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "League's match",
          participate_count: "40",
          participate_league: "40/40 Team • Participate Now"),
      LeagueList(
          title: "Youth King Club 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Knock out",
          participate_count: "20",
          participate_league: "20/20 Team • Participate Now"),
      LeagueList(
          title: "King Pride 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Round robins",
          participate_count: "56",
          participate_league: "20/20 Team • Participate Now"),
    ]),
    LeaguePageList(title: "Ongoing", content: [
      LeagueList(
          title: "Ground King League’s",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "League's match",
          participate_count: "40",
          participate_league: "40/40 Team • Participate Now"),
      LeagueList(
          title: "Youth King Club 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Knock out",
          participate_count: "20",
          participate_league: "20/20 Team • Participate Now"),
      LeagueList(
          title: "King Pride 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Round robins",
          participate_count: "56",
          participate_league: "20/20 Team • Participate Now"),
    ]),
    LeaguePageList(title: "Completed", content: [
      LeagueList(
          title: "Ground King League’s",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "League's match",
          participate_count: "40",
          participate_league: "40/40 Team • Participate Now"),
      LeagueList(
          title: "Youth King Club 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Knock out",
          participate_count: "20",
          participate_league: "20/20 Team • Participate Now"),
      LeagueList(
          title: "King Pride 2024",
          date: "10 Feb 2024 to 22 Feb 2024",
          address:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          league_type: "Round robins",
          participate_count: "56",
          participate_league: "20/20 Team • Participate Now"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "League's / Tournament",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  CustomImage(
                      height: 24, width: 24, path: Assets.imagesSetting5)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < league_tournament.length; i++)
                    Center(
                      child: Container(
                        // height: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 7),
                          child: Text(
                            league_tournament[i].title,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: (i == index)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(30),
                            color: i == index ? primaryColor : Colors.white),
                      ),
                    )
                ],
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
                    itemCount: league_tournament.length,
                    itemBuilder: (context, index) {
                      return ListView.builder(
                          itemCount: league_tournament[index].content.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade200),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      league_tournament[index]
                                                          .content[i]
                                                          .title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      "Publish date: " +
                                                          league_tournament[
                                                                  index]
                                                              .content[i]
                                                              .date,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 8,
                                                            color:
                                                                Colors.black87,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 14,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Text(
                                                      league_tournament[index]
                                                          .content[i]
                                                          .league_type,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    "Participate ${league_tournament[index].content[i].participate_count} Team",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                          color: const Color(
                                                              0xffFF9100),
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
                                                text: "Address : ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        league_tournament[index]
                                                            .content[i]
                                                            .address,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ]),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomButton(
                                                height: 18,
                                                elevation: 0,
                                                radius: 6,
                                                type: ButtonType.secondary,
                                                title: "View Details",
                                                fontSize: 8,
                                                onTap: () {},
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              (index == 0)
                                                  ? Expanded(
                                                      child: CustomButton(
                                                        color: primaryColor,
                                                        height: 18,
                                                        elevation: 0,
                                                        radius: 6,
                                                        type:
                                                            ButtonType.primary,
                                                        title:
                                                            "23/40 Team • Participate Now",
                                                        fontSize: 8,
                                                        onTap: () {},
                                                      ),
                                                    )
                                                  : Text("40/40 Team"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaguePageList {
  String title;
  List<LeagueList> content;
  LeaguePageList({
    required this.title,
    required this.content,
  });
}

class LeagueList {
  String title;
  String date;
  String address;
  String league_type;
  String participate_count;
  String participate_league;
  LeagueList({
    required this.title,
    required this.date,
    required this.address,
    required this.league_type,
    required this.participate_count,
    required this.participate_league,
  });
}

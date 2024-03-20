import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/views/base/common_button.dart';
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
      LeagueList(
          title: "BBC Pride 2024",
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.25),
                ),
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "Add League",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "League's / Tournament",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const CustomImage(
                      height: 24, width: 24, path: Assets.imagesSetting5)
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var i = 0; i < league_tournament.length; i++)
                      GestureDetector(
                        onTap: () {
                          pageController
                              .animateToPage(i,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.ease)
                              .then((value) {
                            setState(() {
                              this.index = i;
                            });
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 14),
                          // height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: (i == index) ? 0 : 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: i == index ? primaryColor : Colors.white,
                          ),
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
                        ),
                      )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 14,
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
                            margin: const EdgeInsets.only(
                              bottom: 16,
                              left: 16,
                              right: 16,
                            ),
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
                                                          color: Colors.black87,
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "Publish date: " +
                                                        league_tournament[index]
                                                            .content[i]
                                                            .date,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontSize: 9,
                                                          color: Colors.black87,
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
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      0,
                                                    ),
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
                                                        fontSize: 10,
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
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              children: [
                                                TextSpan(
                                                  text: league_tournament[index]
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
                                              height: 34,
                                              elevation: 0,
                                              radius: 6,
                                              type: ButtonType.secondary,
                                              borderColor: Colors.grey.shade800,
                                              title: "View Details",
                                              fontSize: 10,
                                              onTap: () {},
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            (index == 0)
                                                ? Expanded(
                                                    child: CustomButton(
                                                      color: primaryColor,
                                                      height: 34,
                                                      elevation: 0,
                                                      radius: 6,
                                                      type: ButtonType.primary,

                                                      onTap: () {},
                                                      // title:
                                                      //     "23/40 Team • Participate Now",
                                                      child: Text(
                                                        "23/40 Team • Participate Now",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall!
                                                            .copyWith(
                                                              color:
                                                                  Colors.white,
                                                          fontSize: 10
                                                            ),
                                                      ),
                                                    ),
                                                  )
                                                : const Text("40/40 Team"),
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

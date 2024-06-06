import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/chat_controller.dart';
import 'package:football_shuru/controllers/gameslot_controller.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/game_slot.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/ground_chatroom.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/ground_king_champion_tile.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/tournament_stats_section.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../base/custom_image.dart';
import '../../../base/lottie_builder.dart';
import '../../../base/snack_bar.dart';

class SelectGroundChatScreen extends StatefulWidget {
  final int groundId;
  final Grounds? selectedGround;

  const SelectGroundChatScreen(
      {super.key, required this.groundId, this.selectedGround});

  @override
  State<SelectGroundChatScreen> createState() => _SelectGroundChatScreenState();
}

class _SelectGroundChatScreenState extends State<SelectGroundChatScreen>
    with SingleTickerProviderStateMixin {
  int totalGameSlot = 0;
  Grounds? _ground;

  late TabController _tabController;

  final ScrollController _scrollController = ScrollController();

  bool isLoading = true;

  // bool isScroll = true;

  @override
  void initState() {
    super.initState();
    _ground = widget.selectedGround;
    Timer.run(() async {
      await Get.find<ChatController>().loadChats(groundId: widget.groundId);
      await Get.find<GameSlotController>()
          .getGameSlotDetails(groundId: widget.groundId)
          .then((value) {
        if (value.isSuccess) {
          totalGameSlot = Get.find<GameSlotController>().gameSlotDetail.length;
        }
      });
      Get.find<HomePageController>()
          .getgroundsDetail(groundId: widget.groundId)
          .then((value) {
        if (value.isSuccess) {
          _ground = Get.find<HomePageController>().groundsDetail;
          isLoading = false;
        }
      });
      await Get.find<KingChallengeController>()
          .getGroundTeamList(groundId: widget.groundId);
      setState(() {});
      Get.find<KingChallengeController>()
          .getGroundStatisticData(groundId: widget.groundId, type: "goal");
      Get.find<KingChallengeController>()
          .getGroundStatisticData(groundId: widget.groundId, type: "assist");
      Get.find<KingChallengeController>()
          .getGroundStatisticData(groundId: widget.groundId, type: "best_defender");
      Get.find<KingChallengeController>()
          .getGroundStatisticData(groundId: widget.groundId,type: "best_midfield");
    });
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PopScope(
      onPopInvoked: (value) {
        if (value) {
          Get.find<ChatController>().lastSeenUpdate(groundId: widget.groundId);
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            GetBuilder<HomePageController>(builder: (homePageController) {
              // isLoading = homePageController.isLoading;
              return SliverAppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                ),
                pinned: true,
                surfaceTintColor: const Color(0xFF263238),
                backgroundColor: const Color(0xFF263238),
                title: Text(
                  _ground?.title ?? "Ground",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                actions: [
                  if (homePageController.logoutloading)
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: const CircularProgressIndicator())
                  else
                    IconButton(
                        onPressed: () {
                          homePageController
                              .leaveGround(groundId: widget.groundId)
                              .then((value) {
                            if (value.isSuccess) {
                              Get.find<AuthController>().getgrounds();
                              Get.find<HomePageController>().getJoinedGrounds();
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: value.message,
                                  toastLength: Toast.LENGTH_LONG);
                            } else {
                              showSnackBar(context, content: value.message);
                            }
                          });
                        },
                        icon: const Icon(IconlyLight.logout))
                ],
              );
            }),
            GetBuilder<HomePageController>(builder: (homePageController) {
              // isLoading = homePageController.isLoading;
              return SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 170 + 100,
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            color: const Color(0xFF263238),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomImage(
                                  height: 46,
                                  width: 46,
                                  path: Assets.imagesAward1,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                    text: TextSpan(
                                        text: "TROPHY",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 200, 57, 1),
                                            ),
                                        children: [
                                      TextSpan(
                                        text: "\nfor leading the board",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(context, getCustomRoute(child: SetWinnerScreen()));
                          //   },
                          //   child: Text("Set Winner"),
                          // ),
                          isLoading ?  Center(
                            child: CustomLottie(
                              assetLottie: Assets.lottiesFootball,
                              height: 50,
                            ),
                          )
                              : Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: GroundKingChampion(
                                    // groundKingChallenge: _ground?.groundKingChallenge,
                                    groundId: _ground?.id ?? 0,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            SliverFillRemaining(
              child: Column(
                children: [
                  // const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${_ground?.title ?? ""}•  Ground King  •  ${_ground?.userCount ?? 1} members",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF9100),
                          ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Theme(
                    data: ThemeData(useMaterial3: false),
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        dividerColor: Colors.grey.shade200,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontWeight: FontWeight.w700, fontSize: 13),
                        indicatorWeight: 3.0,
                        labelColor: Colors.black,
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.titleSmall,
                        unselectedLabelColor: Colors.grey.shade500,
                        controller: _tabController,
                        tabs: <Tab>[
                          const Tab(child: Text("Ground Chatroom")),
                          Tab(
                              child: Row(
                            children: [
                              const Text("Game Slot"),
                              if (totalGameSlot.isGreaterThan(0))
                                const SizedBox(width: 6),
                              if (totalGameSlot.isGreaterThan(0))
                                Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFF4343)),
                                    child: Center(
                                        child: Text("$totalGameSlot",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10)))),
                            ],
                          )),
                          const Tab(child: Text("Players Stats")),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        GroundChatroom(
                          groundId: widget.groundId,
                        ),
                        GameSlot(
                          groundId: widget.groundId,
                        ),
                        const TournamentStatsSection()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

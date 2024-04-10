import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/chat_controller.dart';
import 'package:football_shuru/controllers/gameslot_controller.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/game_slot.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/ground_chatroom.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/tournament_stats_section.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../base/custom_image.dart';
import '../../../base/snack_bar.dart';

class SelectGroundChatScreen extends StatefulWidget {
  final int groundId;
  final Grounds? selectedGround;

  const SelectGroundChatScreen({super.key, required this.groundId, this.selectedGround});

  @override
  State<SelectGroundChatScreen> createState() => _SelectGroundChatScreenState();
}

class _SelectGroundChatScreenState extends State<SelectGroundChatScreen> with SingleTickerProviderStateMixin {
  int totalGameSlot = 0;
  Grounds? _ground;

  late TabController _tabController;

  final ScrollController _scrollController = ScrollController();

  // bool isScroll = true;

  @override
  void initState() {
    super.initState();
    _ground = widget.selectedGround;
    Timer.run(() async {
      await Get.find<ChatController>().loadChats(groundId: widget.groundId);
      await Get.find<GameSlotController>().getGameSlotDetails(groundId: widget.groundId).then((value) {
        if (value.isSuccess) {
          totalGameSlot = Get.find<GameSlotController>().gameSlotDetail.length;
        }
      });
      Get.find<HomePageController>().getgroundsDetail(groundId: widget.groundId).then((value) {
        if (value.isSuccess) {
          _ground = Get.find<HomePageController>().groundsDetail;
        }
      });
      setState(() {});
    });
    _tabController = TabController(vsync: this, length: 3);

    // _scrollController.addListener(() {
    //   if (_scrollController.offset > 25 && !isScroll) {
    //     setState(() {
    //       isScroll = true;
    //     });
    //   } else if (_scrollController.offset <= 25 && isScroll) {
    //     setState(() {
    //       isScroll = false;
    //     });
    //   }
    // });
    // print(isScroll);
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
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                ),
                actions: [
                  if (homePageController.logoutloading)
                    Container(padding: const EdgeInsets.all(10), child: const CircularProgressIndicator())
                  else
                    IconButton(
                        onPressed: () {
                          homePageController.leaveGround(groundId: widget.groundId).then((value) {
                            if (value.isSuccess) {
                              Get.find<AuthController>().getgrounds();
                              Get.find<HomePageController>().getJoinedGrounds();
                              Navigator.pop(context);
                              Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
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
              return SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      color: const Color(0xFF263238),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
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
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(255, 200, 57, 1),
                                            ),
                                        children: [
                                      TextSpan(
                                        text: "\nfor leading the board",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
                                      )
                                    ])),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -70,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ], color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromRGBO(196, 196, 196, 1))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Ground King Champion",
                                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromRGBO(255, 145, 0, 1),
                                                ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(
                                                        width: 2,
                                                        color: const Color.fromRGBO(255, 145, 0, 1),
                                                      )),
                                                  child: const CustomImage(
                                                      radius: 20,
                                                      height: 40,
                                                      width: 40,
                                                      fit: BoxFit.fill,
                                                      path:
                                                          "https://s3-alpha-sig.figma.com/img/4350/319e/ccd2879e061c826355e07a93a56087c5?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JISvq4ZHQLpf~~ponap2y~Uq-hqnAwnfl87oYIy4CuSDBH682Ey19MFaR9c9wLIz1DEnfGHfKE15ceYZstHTSh2be9KY2JuulOHADPPTRMLm5tCbfxqQrjyN5d2agIcu9PxufWHWhkxTXlJTQ-RaBmDjXCjt6f7Xyp6S8N9l5-e4Dhg7QMAgwlfzQdGS7FmVnfF3PcKnVEDK2s-fIDS-dOZ1UOzeJug5r9h84gOcILh2VOuMI6E0ScJ9NI7hDFLa47kc58-0mmNMQJ32bbKtiWGUCGUjrELZNO7Yr7HpAkVMF0S7ddAUcZo2k6q0mDKWw7W0pNWJ5RTt7hJC41HMoA__"),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 0,
                                                  child: Container(
                                                    height: 14,
                                                    width: 14,
                                                    decoration: BoxDecoration(color: const Color.fromRGBO(255, 145, 0, 1), borderRadius: BorderRadius.circular(20)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(2.0),
                                                      child: CustomImage(
                                                          height: 8,
                                                          width: 8,
                                                          path:
                                                              "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OyeffN2kYlSmiVZpDr24eIsDH2uRwisZU2Ty-7ERVj0fK0zKEfA4Zi4JBGTiy8sSmX-lKKc~KBFmiIK8gg622QcH3NAQ5GJfdOv7LTVofihpMMN3y3ym0nDwMu4np37Bqx-baUFcPbRCKXbMFI-HJ0zV5vRJu1FqYISnPMh6u-QeN~62qj1TYHPm53iEVvPo1OA46COKzp9A9iCqhoL3A24FOmFqzbsK6H-8dXfExexPcglxwRbcPnEBVjpHjg12f8nBqJVphqQ~7p-5Z2yaecsSiYQzxZJZFEyVNYmHV8ztWc30XCSy1V3DHGWg5GjkYAtHjKrQE6Y0ph1sc5R0aA__"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Team Ground king",
                                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                ),
                                                Text(
                                                  "Club Of Thane \nCenter",
                                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Vs",
                                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color.fromRGBO(217, 217, 217, 1),
                                                  ),
                                            ),
                                            Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Text(
                                                    "OTHER TEAM",
                                                    textAlign: TextAlign.end,
                                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                          fontSize: 8,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  "Club of madras \nKnights",
                                                  textAlign: TextAlign.end,
                                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                        fontSize: 11,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(
                                                      color: const Color(0xFFE0E0E0),
                                                      width: 1,
                                                    )),
                                                child: const Icon(Icons.add)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 145, 0, 0.1),
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: "Challenge Club of Thane Centre?",
                                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
                                                children: [
                                                  TextSpan(
                                                    text: " Challenge Now",
                                                    style:
                                                        Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xFFFF9100)),
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                  const SizedBox(height: 75),
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
                        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700, fontSize: 13),
                        indicatorWeight: 3.0,
                        labelColor: Colors.black,
                        unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
                        unselectedLabelColor: Colors.grey.shade500,
                        controller: _tabController,
                        tabs: <Tab>[
                          const Tab(child: Text("Ground Chatroom")),
                          Tab(
                              child: Row(
                            children: [
                              const Text("Game Slot"),
                              if (totalGameSlot.isGreaterThan(0)) const SizedBox(width: 6),
                              if (totalGameSlot.isGreaterThan(0))
                                Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffFF4343)),
                                    child: Center(child: Text("$totalGameSlot", textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 10)))),
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

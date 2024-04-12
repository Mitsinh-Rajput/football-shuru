import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:football_shuru/controllers/gameslot_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/gameslotplayer.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/newgameslotsheet.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../services/route_helper.dart';
import '../../../base/custom_image.dart';

class GameSlot extends StatefulWidget {
  final int groundId;
  const GameSlot({super.key, required this.groundId});

  @override
  State<GameSlot> createState() => _GameSlotState();
}

class _GameSlotState extends State<GameSlot> {
  bool isSwitchOn = false;
  bool switchbutton = true;
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      await pusher.subscribe(channelName: "game-slots-on-ground-${widget.groundId}");
    });
  }

  @override
  void dispose() {
    pusher.unsubscribe(channelName: "game-slots-on-ground-${widget.groundId}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GameSlotController>(builder: (gameSlotController) {
        if (gameSlotController.isLoading && gameSlotController.gameSlotDetail.isEmpty) {
          return CustomShimmer(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF455A64).withOpacity(0.4))),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "12 Feb 2024 10:12 AM",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFFFF9100)),
                                children: [
                                  TextSpan(
                                    text: "\nSchedule",
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400, color: const Color(0xFF455A64)),
                                  ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Football  match",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   getCustomRoute(
                                  //     type: PageTransitionType.fade,
                                  //     duration: const Duration(milliseconds: 600),
                                  //     child: const PlayerListScreen(),
                                  //   ),
                                  // );
                                },
                                child: Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: "230+",
                                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18, height: 0, fontWeight: FontWeight.w700),
                                            children: [
                                          TextSpan(
                                            text: "\nPlayers shown interest",
                                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8, height: 0, fontWeight: FontWeight.w400),
                                          ),
                                        ])),
                                    const SizedBox(width: 10),
                                    Icon(size: 30, Icons.keyboard_arrow_right_outlined),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CustomImage(
                                      radius: 50,
                                      height: 20,
                                      width: 20,
                                      path:
                                          "https://s3-alpha-sig.figma.com/img/edbc/827e/ddd9eb8d1b1f8a34ea7de88255893a11?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L33otg20rmNDjbv2godV47V2VKD4bEukiEVlI0FAICF2D9vNJwX7HfLaWAJ1vfLzFeMPrMqP4lIpanRlxkvL6ayojKlAqsfWlzGzAKsg0NfGPjDrYmpnIsnvBOC3pQh8yy2HwEABL9tuszzm3vQPqW4WM2THrgjgyEu4SVPv0xA12IpmPpSUU2Gr5N2MLAloiEm43dNrdxbwWbVWqnfusKUybziAqaN89X4yECYFEQTSF5lwj1zx~RnOYf5-O48vKnh3QdgjGeoD2paa7mMYC8d9IPsC3vKOMV9~pBcKjz3uYYyygvqTbTB7Lw7-0jm259hn~BVtt5C-YkpAeFxPvA__"),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        "Darrell Steward",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Posted on 10 Feb 2024",
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                activeText: "In",
                                valueFontSize: 13.0,
                                width: 80,
                                borderRadius: 30.0,
                                inactiveText: "Out",
                                inactiveColor: const Color(0xFFFF6B6B),
                                activeColor: const Color(0xFF02BF4D),
                                showOnOff: true,
                                activeTextColor: Colors.white,
                                inactiveTextColor: Colors.white,
                                value: isSwitchOn,
                                onToggle: (val) {
                                  setState(() {
                                    isSwitchOn = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
          child: ListView.builder(
            itemCount: gameSlotController.gameSlotDetail.length,
            itemBuilder: (BuildContext context, int index) {
              final gameslot = gameSlotController.gameSlotDetail[index];
              return Container(
                padding: const EdgeInsets.all(15.0),
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF455A64).withOpacity(0.4))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "${gameslot.dateTime?.dateTime ?? DateTime.now()}",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFFFF9100)),
                          children: [
                            TextSpan(
                              text: "\nSchedule",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400, color: const Color(0xFF455A64)),
                            ),
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${gameslot.title ?? ""}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              getCustomRoute(
                                type: PageTransitionType.fade,
                                duration: const Duration(milliseconds: 600),
                                child: GameSlotPlayerListScreen(selectedGameSlot: gameslot),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "${gameslot.inCount ?? 1}+",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18, height: 0, fontWeight: FontWeight.w700),
                                      children: [
                                    TextSpan(
                                      text: "\nPlayers shown interest",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8, height: 0, fontWeight: FontWeight.w400),
                                    ),
                                  ])),
                              const SizedBox(width: 10),
                              const Icon(size: 30, Icons.keyboard_arrow_right_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${gameslot.createdBy?.name ?? ''}",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Posted on ${gameslot.createdAt!.dateTime}",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        FlutterSwitch(
                          activeText: "In",
                          valueFontSize: 13.0,
                          width: 80,
                          borderRadius: 30.0,
                          inactiveText: "Out",
                          inactiveColor: const Color(0xFFFF6B6B),
                          activeColor: const Color(0xFF02BF4D),
                          showOnOff: true,
                          activeTextColor: Colors.white,
                          inactiveTextColor: Colors.white,
                          value: gameslot.loggedInUserResponse?.status ?? false,
                          onToggle: (val) {
                            gameSlotController
                                .gameSlotAttendance(gameSlotId: gameslot.id!, status: (gameslot.loggedInUserResponse?.status ?? true) == false ? "in" : "out")
                                .then((value) {
                              if (value.isSuccess) {
                                gameSlotController.getGameSlotDetails(groundId: widget.groundId);
                              }
                            });
                            print(isSwitchOn);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: CustomButton(
          onTap: () {
            NewGameSlotDialogue().dialogue(context, widget.groundId);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(color: Colors.white, Icons.add),
                  const SizedBox(width: 10),
                  Text(
                    "Create New Game Slot",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/scorecard_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/response/PendingMatchListModel.dart';
import '../../../../services/theme.dart';

class SetWinnerScreen extends StatefulWidget {
  final PendingMatchListModel MatchData;
  // final int groundId;
  const SetWinnerScreen({super.key, required this.MatchData});

  @override
  State<SetWinnerScreen> createState() => _SetWinnerScreenState();
}

class _SetWinnerScreenState extends State<SetWinnerScreen> {
  TextEditingController teamAGoalCount = TextEditingController(text: "0");
  TextEditingController teamBGoalCount = TextEditingController(text: "0");
  bool isSelected = false;

  List<RadioModel> RadioList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teamAGoalCount.text = widget.MatchData.teamGoals != null
        ? widget.MatchData.teamGoals.toString()
        : "0";
    teamBGoalCount.text = widget.MatchData.opponentTeamGoals != null
        ? widget.MatchData.opponentTeamGoals.toString()
        : "0";
    RadioList.add(RadioModel(false, widget.MatchData.team?.name ?? "",
        widget.MatchData.team?.logo ?? "", "Team A"));
    RadioList.add(RadioModel(false, widget.MatchData.opponentTeam?.name ?? "",
        widget.MatchData.opponentTeam?.logo ?? "", "Team B"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(
                    path: Assets.imagesDribbble,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Champions League",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF40424E)),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "${DateFormat('EEEE, d MMMM').format(widget.MatchData.scheduledTime ?? DateTime.now())} • Ground king champion Result",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Who is the winner?",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF40424E)),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: RadioList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      setState(() {
                        RadioList.forEach(
                            (element) => element.isSelected = false);
                        RadioList[index].isSelected = true;
                        if (index == 0) {
                          teamAGoalCount.text =
                              (int.parse(teamBGoalCount.text) + 1).toString();
                        } else {
                          teamBGoalCount.text =
                              (int.parse(teamAGoalCount.text) + 1).toString();
                        }
                      });
                    },
                    child: RadioItem(item: RadioList[index]),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Please enter the score of match",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 40,
                        child: TextFormField(
                          controller: teamAGoalCount,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    // letterSpacing: 2,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary,
                                  ),
                          onChanged: (value) {
                            setState(() {
                              if (RadioList[0].isSelected) {
                                if (int.parse(value) <
                                    int.parse(teamBGoalCount.text)) {
                                  teamAGoalCount.text =
                                      (int.parse(teamBGoalCount.text) + 1)
                                          .toString();
                                }
                              }
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Text(
                        widget.MatchData.team?.name ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Text(
                    "-",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 80, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 40,
                        child: TextField(
                          controller: teamBGoalCount,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    // letterSpacing: 2,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary,
                                  ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Text(
                        widget.MatchData.opponentTeam?.name ?? "",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey.shade400))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                            color: RadioList[0].isSelected
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : const Color(0xFFA5A5A5),
                          )),
                      child: CustomImage(
                        radius: 20,
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        path: widget.MatchData.team?.logo ?? "",
                      ),
                    ),
                    RadioList[0].isSelected
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 145, 0, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CustomImage(
                                  height: 8,
                                  width: 8,
                                  path: Assets.imagesCrown1,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Team A",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      widget.MatchData.team?.name ?? "",
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
                    Text(
                      "Team B",
                      // textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFA5A5A5)),
                    ),
                    Text(
                      widget.MatchData.opponentTeam?.name ?? "",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFA5A5A5)),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: RadioList[1].isSelected
                                ? const Color.fromRGBO(255, 145, 0, 1)
                                : const Color(0xFFA5A5A5),
                          )),
                      child: CustomImage(
                        radius: 20,
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        path: widget.MatchData.opponentTeam?.logo ?? "",
                      ),
                    ),
                    RadioList[1].isSelected
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 145, 0, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: CustomImage(
                                  height: 8,
                                  width: 8,
                                  path: Assets.imagesCrown1,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              color: const Color(0xFF263238),
              onTap: () {
                int winnerId = RadioList[0].isSelected
                    ? widget.MatchData.team?.id ?? 0
                    : widget.MatchData.opponentTeam?.id ?? 0;
                Get.find<HomePageController>()
                    .setWinner(
                  challengeId: Get.find<HomePageController>()
                          .groundsDetail
                          ?.groundKingChallenge
                          ?.id ??
                      0,
                  teamGoals: int.parse(teamAGoalCount.text),
                  opponentTeamGoals: int.parse(teamBGoalCount.text),
                  winnerTeamId: winnerId,
                )
                    .then((value) {
                  log(value.message);
                  if (value.isSuccess) {
                    if (value.message == "Winner is Decided") {
                      Navigator.push(
                          context,
                          getCustomRoute(
                              child: ScoreCardScreen(
                            isTeamAWinner: RadioList[0].isSelected,
                          )));
                    }
                  }

                  /// Remove this navigation before building apk
                  // Navigator.push(
                  //     context,
                  //     getCustomRoute(
                  //         child: ScoreCardScreen(
                  //       isTeamAWinner: RadioList[0].isSelected,
                  //     )));
                  Fluttertoast.showToast(msg: value.message);
                });
              },
              radius: 10,
              height: 50,
              child: Text(
                "Submit & Next",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class WinnerClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(size.width * 2 / 3, 0.0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(WinnerClipper oldClipper) => false;
// }

class RadioItem extends StatefulWidget {
  final RadioModel item;
  const RadioItem({super.key, required this.item});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              border: Border.all(
                  color: widget.item.isSelected
                      ? const Color(0xFF0EA84C)
                      : const Color(0xFFE0E0E0)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.item.isSelected
                        ? const Color(0xFF0EA84C)
                        : const Color(0xFFE0E0E0)),
              ),
              const SizedBox(
                width: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFF9100),
                          width: 2,
                        )),
                    child: CustomImage(
                      path: widget.item.logo,
                      radius: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                  widget.item.isSelected
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFF9100),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CustomImage(
                                height: 8,
                                width: 8,
                                path: Assets.imagesCrown1,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.team,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.item.teamName,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF40424E)),
                  ),
                ],
              )
            ],
          ),
        ),
        if (widget.item.isSelected)
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              // clipper: WinnerClipper(),
              child: Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Center(
                  child: Text(
                    "Winner Team",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class RadioModel {
  bool isSelected;
  final String logo;
  final String teamName;
  final String team;

  RadioModel(this.isSelected, this.teamName, this.logo, this.team);
}

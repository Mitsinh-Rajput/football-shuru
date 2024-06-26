import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/services/constants.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/date_picker_widget.dart';
import 'package:get/get.dart';

import '../../../../controllers/kingchallenge_controller.dart';
import '../../../../data/models/response/groundteam_model.dart';
import '../../../base/custom_image.dart';
import '../../../base/lottie_builder.dart';

class GroundKingChampion extends StatefulWidget {
  final int groundId;
  const GroundKingChampion({super.key, required this.groundId});

  @override
  State<GroundKingChampion> createState() => _GroundKingChampionState();
}

class _GroundKingChampionState extends State<GroundKingChampion> {
  int? _teamId;
  int? _opponentTeamId;
  int index = 0;
  int indexForChallengingChampionTeam = 0;
  bool isLoading = true;
  bool isAccepted = true;
  bool isUserTeam = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KingChallengeController>(
        builder: (kingChallengeController) {
      return kingChallengeController.isLoading
          ?  Center(
          child: CustomLottie(
          assetLottie: Assets.lottiesFootball,
          height: 50,
          ),
          )
              : GetBuilder<HomePageController>(builder: (homePageController) {
              bool isCaptain = false;
              if (homePageController.groundsDetail?.groundKingTeam?.captain ==
                  Get.find<AuthController>().profile?.id) {
                isCaptain = true;
              } else if (homePageController
                      .groundsDetail?.groundKingChallenge?.team?.captain ==
                  Get.find<AuthController>().profile?.id) {
                isCaptain = true;
              } else if (homePageController.groundsDetail?.groundKingChallenge
                      ?.opponentTeam?.captain ==
                  Get.find<AuthController>().profile?.id) {
                isCaptain = true;
              } else if (kingChallengeController.groundTeamList == []) {
                isCaptain = false;
              }
              if (homePageController.groundsDetail?.groundKingChallenge ==
                  null) {
                if (homePageController.groundsDetail?.groundKingTeam == null) {
                  return homePageController.isLoading
                      ?  Center(
                    child: CustomLottie(
                      assetLottie: Assets.lottiesFootball,
                      height: 50,
                    ),
                  )
                      : Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 15),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Post a challenge to become a ground king",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    if (_teamId == null)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xFFE0E0E0),
                                                        width: 1,
                                                      )),
                                                  child: const Icon(Icons.add)),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFFF9100),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: CustomImage(
                                                        height: 8,
                                                        width: 8,
                                                        path: Assets
                                                            .imagesCrown1),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "ADD Team A",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                              Text(
                                                "Apply for Ground King",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 28,
                                            width: 100,
                                            padding:
                                                const EdgeInsets.only(left: 9),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.black12),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                dropdownColor: Colors.white,
                                                underline: null,
                                                value: _teamId,
                                                hint: Text(
                                                  'Select Team',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(fontSize: 10),
                                                ),
                                                items: kingChallengeController
                                                    .groundTeamList
                                                    .map((GroundTeam item) {
                                                  return DropdownMenuItem(
                                                    value: item.team!.id,
                                                    child: Text(
                                                      item.team?.name ?? "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge!
                                                          .copyWith(
                                                              fontSize: 10),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _teamId = newValue as int;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    else
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xFFFF9100),
                                                        width: 1,
                                                      )),
                                                  child: CustomImage(
                                                    path:
                                                        "${AppConstants.baseUrl}${kingChallengeController.groundTeamList.where((element) => element.teamId == _teamId).toList()[index].team!.logo}",
                                                    radius: 50,
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 14,
                                                  width: 14,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 145, 0, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: CustomImage(
                                                      height: 8,
                                                      width: 8,
                                                      path: Assets.imagesCrown1,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "ADD Team A",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                              ),
                                              Text(
                                                Get.find<KingChallengeController>()
                                                        .groundTeamList
                                                        .where((element) =>
                                                            element.teamId ==
                                                            _teamId)
                                                        .toList()[index]
                                                        .team
                                                        ?.name ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          CustomButton(
                                            height: 28,
                                            onTap: () {
                                              kingChallengeController
                                                  .createChallenge(
                                                      groundId: widget.groundId,
                                                      teamId: _teamId!)
                                                  .then((value) {
                                                if (value.isSuccess) {
                                                  Fluttertoast.showToast(
                                                      msg: value.message);
                                                  // Navigator.pop(context);
                                                  homePageController
                                                      .getgroundsDetail(
                                                          groundId:
                                                              widget.groundId);
                                                  homePageController.update();
                                                }
                                              });
                                            },
                                            type: ButtonType.primary,
                                            radius: 20,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Submit",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                          CustomButton(
                                            height: 28,
                                            onTap: () {
                                              _teamId = null;
                                              setState(() {});
                                            },
                                            type: ButtonType.primary,
                                            color: const Color(0xFFFF6B6B),
                                            radius: 20,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Cancel",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 145, 0, 0.1),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: (_teamId != null)
                                                ? "Apply by completing the Ground King Challenge and submitting"
                                                : "Welcome to ${homePageController.groundsDetail?.title}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500),
                                            children: [
                                              // (_teamId != null)
                                              //     ? const TextSpan()
                                              //     : TextSpan(
                                              //         text: " Post a challenge!",
                                              //         style:
                                              //             Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: const Color(0xFFFF9100)),
                                              //       ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                } else {
                  for (var i = 0;
                      i <
                          Get.find<KingChallengeController>()
                              .groundTeamList
                              .length;
                      i++) {
                    if (Get.find<KingChallengeController>()
                            .groundTeamList[i]
                            .team
                            ?.id ==
                        Get.find<HomePageController>()
                            .groundsDetail
                            ?.groundKingTeam
                            ?.id) {
                      indexForChallengingChampionTeam = i;
                      break;
                    }
                  }
                  return homePageController.isLoading
                      ?  Center(
                    child: CustomLottie(
                      assetLottie: Assets.lottiesFootball,
                      height: 50,
                    ),
                  )
                      :  Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                  color: Colors.black.withOpacity(0.25),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 15),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Ground king Champion",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: const Color.fromRGBO(
                                                        255, 145, 0, 1),
                                                  )),
                                              child: CustomImage(
                                                  radius: 20,
                                                  height: 40,
                                                  width: 40,
                                                  fit: BoxFit.fill,
                                                  path:
                                                      '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingTeam?.logo ?? ""}'),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        255, 145, 0, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
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
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Team A",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                            Text(
                                              homePageController.groundsDetail
                                                      ?.groundKingTeam?.name ??
                                                  "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Vs",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w700,
                                                color: const Color.fromRGBO(
                                                    217, 217, 217, 1),
                                              ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Team B",
                                              // textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      fontSize: 8,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xFFA5A5A5)),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                for (var i
                                                    in kingChallengeController
                                                        .groundTeamList) {
                                                  print(i.team?.id);
                                                }
                                                print(
                                                    indexForChallengingChampionTeam);
                                                print(homePageController
                                                    .groundsDetail
                                                    ?.groundKingTeam
                                                    ?.id);
                                              },
                                              child: Text(
                                                kingChallengeController
                                                            .groundTeamList[
                                                                indexForChallengingChampionTeam]
                                                            .teamId ==
                                                        homePageController
                                                            .groundsDetail
                                                            ?.groundKingTeam
                                                            ?.id
                                                    ? "Waiting for \nopponent"
                                                    : "Challenge \nGround King",
                                                textAlign: TextAlign.end,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color(
                                                            0xFFA5A5A5)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xFFE0E0E0),
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
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: kingChallengeController
                                                      .groundTeamList[
                                                          indexForChallengingChampionTeam]
                                                      .teamId ==
                                                  homePageController
                                                      .groundsDetail
                                                      ?.groundKingTeam
                                                      ?.id
                                              ? "Wait for opponent"
                                              : _opponentTeamId == null
                                                  ? "Accept Challenge?"
                                                  : "Confirmation (${kingChallengeController.groundTeamList.where((element) => element.teamId == _opponentTeamId).toList()[0].team?.name} ):",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      kingChallengeController
                                                  .groundTeamList[
                                                      indexForChallengingChampionTeam]
                                                  .teamId ==
                                              homePageController.groundsDetail
                                                  ?.groundKingTeam?.id
                                          ? const SizedBox.shrink()
                                          : _opponentTeamId == null
                                              ? (isAccepted)
                                                  ? Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      5.0),
                                                          child: CustomButton(
                                                            onTap: () {
                                                              showDialog<void>(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false, // user must tap button for close dialog!
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Confirmation'),
                                                                    content:
                                                                        const SingleChildScrollView(
                                                                      child:
                                                                          ListBody(
                                                                        children: <Widget>[
                                                                          Text(
                                                                              'Do you want to proceed?'),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'Yes'),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            isAccepted =
                                                                                false;
                                                                          });
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        child: const Text(
                                                                            'No'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Text(
                                                              "Yes",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical:
                                                                      5.0),
                                                          child: CustomButton(
                                                            color: Colors.red,
                                                            onTap: () {
                                                              setState(() {
                                                                isAccepted =
                                                                    true;
                                                              });
                                                            },
                                                            child: Text(
                                                              "No",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          9,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5.0),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 7),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.green,
                                                        ),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                            iconDisabledColor:
                                                                Colors.white,
                                                            iconEnabledColor:
                                                                Colors.white,
                                                            dropdownColor:
                                                                Colors.white,
                                                            value:
                                                                _opponentTeamId,
                                                            hint: Text(
                                                              'Select Team',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          10,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                            items: kingChallengeController
                                                                .groundTeamList
                                                                .map((GroundTeam
                                                                    item) {
                                                              return DropdownMenuItem(
                                                                value: item
                                                                    .team?.id,
                                                                child: Text(
                                                                  item.team
                                                                          ?.name ??
                                                                      "",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .labelLarge!
                                                                      .copyWith(
                                                                          fontSize:
                                                                              10),
                                                                ),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newValue) {
                                                              setState(() {
                                                                _opponentTeamId =
                                                                    newValue
                                                                        as int;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                              : Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5.0),
                                                  child: Row(
                                                    children: [
                                                      CustomButton(
                                                        height: 28,
                                                        onTap: () {
                                                          kingChallengeController
                                                              .setOpponent(
                                                                  groundId: widget
                                                                      .groundId,
                                                                  teamId: homePageController
                                                                          .groundsDetail
                                                                          ?.groundKingTeam
                                                                          ?.id ??
                                                                      0,
                                                                  opponentTeamId:
                                                                      _opponentTeamId!)
                                                              .then((value) {
                                                            if (value
                                                                .isSuccess) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg: value
                                                                          .message);
                                                              // Navigator.pop(context);
                                                              homePageController
                                                                  .getgroundsDetail(
                                                                      groundId:
                                                                          widget
                                                                              .groundId);
                                                              homePageController
                                                                  .update();
                                                            }
                                                          });
                                                        },
                                                        type:
                                                            ButtonType.primary,
                                                        radius: 10,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Submit",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .check_circle_outline,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      CustomButton(
                                                        height: 28,
                                                        onTap: () {
                                                          _opponentTeamId =
                                                              null;
                                                          setState(() {});
                                                        },
                                                        type:
                                                            ButtonType.primary,
                                                        color: const Color(
                                                            0xFFFF6B6B),
                                                        radius: 10,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Cancel",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                            const SizedBox(
                                                              width: 5,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .check_circle_outline,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                }
              } else if (homePageController
                      .groundsDetail?.groundKingChallenge?.opponentTeamId ==
                  null) {
                return homePageController.isLoading
                    ?  Center(
                  child: CustomLottie(
                    assetLottie: Assets.lottiesFootball,
                    height: 50,
                  ),
                )
                    : Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(196, 196, 196, 1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${homePageController.groundsDetail?.groundKingChallenge?.team?.name ?? ""} has posted a challenge",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 145, 0, 1),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                )),
                                            child: CustomImage(
                                                radius: 20,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.fill,
                                                path:
                                                    '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingChallenge?.team?.logo ?? ""}'),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
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
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team A",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            homePageController
                                                    .groundsDetail
                                                    ?.groundKingChallenge
                                                    ?.team
                                                    ?.name ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Vs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team B",
                                            // textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFFA5A5A5)),
                                          ),
                                          Text(
                                            kingChallengeController
                                                        .groundTeamList[index]
                                                        .teamId ==
                                                    kingChallengeController
                                                        .teamId
                                                ? "Waiting for \nopponent"
                                                : "Challenge \nGround King",
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w700,
                                                    color: const Color(
                                                        0xFFA5A5A5)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: kingChallengeController
                                                    .groundTeamList[index]
                                                    .teamId ==
                                                kingChallengeController.teamId
                                            ? "Wait for opponent"
                                            : _opponentTeamId == null
                                                ? "Accept Challenge?"
                                                : "Confirmation (${kingChallengeController.groundTeamList.where((element) => element.teamId == _opponentTeamId).toList()[0].team?.name} ):",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    kingChallengeController
                                                .groundTeamList[index].teamId ==
                                            kingChallengeController.teamId
                                        ? const SizedBox.shrink()
                                        : _opponentTeamId == null
                                            ? (isAccepted)
                                                ? Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5.0),
                                                        child: CustomButton(
                                                          onTap: () {
                                                            showDialog<void>(
                                                              context: context,
                                                              barrierDismissible:
                                                                  false, // user must tap button for close dialog!
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Confirmation'),
                                                                  content:
                                                                      const SingleChildScrollView(
                                                                    child:
                                                                        ListBody(
                                                                      children: <Widget>[
                                                                        Text(
                                                                            'Do you want to proceed?'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: const Text(
                                                                          'Yes'),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          isAccepted =
                                                                              false;
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                    TextButton(
                                                                      child: const Text(
                                                                          'No'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Text(
                                                            "Yes",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelLarge!
                                                                .copyWith(
                                                                    fontSize: 9,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5.0),
                                                        child: CustomButton(
                                                          color: Colors.red,
                                                          onTap: () {
                                                            setState(() {
                                                              isAccepted = true;
                                                            });
                                                          },
                                                          child: Text(
                                                            "No",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelLarge!
                                                                .copyWith(
                                                                    fontSize: 9,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5.0),
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 7),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.green,
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: DropdownButton(
                                                          iconDisabledColor:
                                                              Colors.white,
                                                          iconEnabledColor:
                                                              Colors.white,
                                                          dropdownColor:
                                                              Colors.white,
                                                          value:
                                                              _opponentTeamId,
                                                          hint: Text(
                                                            'Select Team',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelLarge!
                                                                .copyWith(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          items: kingChallengeController
                                                              .groundTeamList
                                                              .map((GroundTeam
                                                                  item) {
                                                            return DropdownMenuItem(
                                                              value:
                                                                  item.team?.id,
                                                              child: Text(
                                                                item.team
                                                                        ?.name ??
                                                                    "",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge!
                                                                    .copyWith(
                                                                        fontSize:
                                                                            10),
                                                              ),
                                                            );
                                                          }).toList(),
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              _opponentTeamId =
                                                                  newValue
                                                                      as int;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                child: Row(
                                                  children: [
                                                    CustomButton(
                                                      height: 28,
                                                      onTap: () {
                                                        kingChallengeController
                                                            .setOpponent(
                                                                groundId: widget
                                                                    .groundId,
                                                                teamId:
                                                                    kingChallengeController
                                                                        .teamId!,
                                                                opponentTeamId:
                                                                    _opponentTeamId!)
                                                            .then((value) {
                                                          if (value.isSuccess) {
                                                            Fluttertoast
                                                                .showToast(
                                                                    msg: value
                                                                        .message);
                                                            // Navigator.pop(context);
                                                            homePageController
                                                                .getgroundsDetail(
                                                                    groundId: widget
                                                                        .groundId);
                                                            homePageController
                                                                .update();
                                                          }
                                                        });
                                                      },
                                                      type: ButtonType.primary,
                                                      radius: 10,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Submit",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelLarge!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .check_circle_outline,
                                                            color: Colors.white,
                                                            size: 12,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CustomButton(
                                                      height: 28,
                                                      onTap: () {
                                                        _opponentTeamId = null;
                                                        setState(() {});
                                                      },
                                                      type: ButtonType.primary,
                                                      color: const Color(
                                                          0xFFFF6B6B),
                                                      radius: 10,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Cancel",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelLarge!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .check_circle_outline,
                                                            color: Colors.white,
                                                            size: 12,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              } else if (homePageController
                      .groundsDetail?.groundKingChallenge?.scheduledStatus ==
                  "rejected") {
                return homePageController.isLoading
                    ?  Center(
                  child: CustomLottie(
                    assetLottie: Assets.lottiesFootball,
                    height: 50,
                  ),
                )
                    : Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(196, 196, 196, 1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Match schedule is in process",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 145, 0, 1),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                )),
                                            child: CustomImage(
                                                radius: 20,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.fill,
                                                path:
                                                    '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingChallenge?.team?.logo ?? ""}'),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
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
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team A",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            homePageController
                                                    .groundsDetail
                                                    ?.groundKingChallenge
                                                    ?.team
                                                    ?.name ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Vs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team B",
                                            // textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Text(
                                            Get.find<HomePageController>()
                                                    .groundsDetail
                                                    ?.groundKingChallenge
                                                    ?.opponentTeam
                                                    ?.name ??
                                                "",
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: const Color(0xFFE0E0E0),
                                              width: 1,
                                            )),
                                        child: CustomImage(
                                            radius: 20,
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.fill,
                                            path:
                                                '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingChallenge?.opponentTeam?.logo ?? ""}'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 145, 0, 0.1),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: kingChallengeController
                                                        .groundTeamList[index]
                                                        .teamId !=
                                                    homePageController
                                                        .groundsDetail
                                                        ?.groundKingChallenge
                                                        ?.scheduledBy &&
                                                homePageController
                                                        .groundsDetail
                                                        ?.groundKingChallenge
                                                        ?.scheduledBy !=
                                                    null
                                            ? "${DateTime.parse(homePageController.groundsDetail?.groundKingChallenge?.scheduledTime).dayDateTime}?"
                                            : homePageController
                                                        .groundsDetail
                                                        ?.groundKingChallenge
                                                        ?.scheduledTime !=
                                                    null
                                                ? "${DateTime.parse(homePageController.groundsDetail?.groundKingChallenge?.scheduledTime).dayDateTime}. Waiting for response "
                                                : isCaptain
                                                    ? "Please select a date for the match"
                                                    : "Date selection in process",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                fontSize: 8,
                                                color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (isCaptain)
                                      if (kingChallengeController
                                              .groundTeamList[index].teamId !=
                                          homePageController
                                              .groundsDetail
                                              ?.groundKingChallenge
                                              ?.scheduledBy)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: CustomDatePicker(
                                            getTime: true,
                                            onChanged: (value) {
                                              if (kingChallengeController
                                                      .groundTeamList[index]
                                                      .teamId !=
                                                  homePageController
                                                      .groundsDetail
                                                      ?.groundKingChallenge
                                                      ?.scheduledBy) {
                                                kingChallengeController
                                                    .scheduleTime(
                                                        groundId: homePageController
                                                            .groundsDetail!
                                                            .groundKingChallenge!
                                                            .id!,
                                                        scheduledBy:
                                                            kingChallengeController
                                                                .groundTeamList[
                                                                    index]
                                                                .teamId!,
                                                        scheduledTime:
                                                            value!.toString())
                                                    .then((value) {
                                                  if (value.isSuccess) {
                                                    Fluttertoast.showToast(
                                                        msg: value.message);
                                                    // Navigator.pop(context);
                                                    homePageController
                                                        .getgroundsDetail(
                                                            groundId: widget
                                                                .groundId);
                                                    homePageController.update();
                                                  }
                                                });
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Please wait for the opponent to set the schedule");
                                              }

                                              // log(value.toString());
                                            },
                                            today: false,
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color(0xFF40424E),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    kingChallengeController
                                                                    .groundTeamList[
                                                                        index]
                                                                    .teamId !=
                                                                homePageController
                                                                    .groundsDetail
                                                                    ?.groundKingChallenge
                                                                    ?.scheduledBy &&
                                                            homePageController
                                                                    .groundsDetail
                                                                    ?.groundKingChallenge
                                                                    ?.scheduledBy !=
                                                                null
                                                        ? "Reschedule"
                                                        : "Select Time Slot",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelLarge!
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontSize: 9),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.white,
                                                    size: 12,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    if (isCaptain)
                                      if (kingChallengeController
                                                  .groundTeamList[index]
                                                  .teamId !=
                                              homePageController
                                                  .groundsDetail
                                                  ?.groundKingChallenge
                                                  ?.scheduledBy &&
                                          homePageController
                                                  .groundsDetail
                                                  ?.groundKingChallenge
                                                  ?.scheduledBy !=
                                              null)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: CustomButton(
                                            onTap: () {
                                              kingChallengeController
                                                  .approveSchedule(
                                                      groundChallengeId:
                                                          homePageController
                                                              .groundsDetail!
                                                              .groundKingChallenge!
                                                              .id!)
                                                  .then((value) {
                                                if (value.isSuccess) {
                                                  Fluttertoast.showToast(
                                                      msg: value.message);
                                                  homePageController
                                                      .getgroundsDetail(
                                                          groundId:
                                                              widget.groundId);
                                                  homePageController.update();
                                                  // Navigator.pop(context);
                                                }
                                              });
                                            },
                                            type: ButtonType.primary,
                                            radius: 5,
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Accept",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 12,
                                                )
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
                      );
              } else {
                return homePageController.isLoading
                    ?  Center(
                  child: CustomLottie(
                    assetLottie: Assets.lottiesFootball,
                    height: 50,
                  ),
                )
                    : Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(196, 196, 196, 1))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 15),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Match has been scheduled",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(
                                                    255, 145, 0, 1),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                  width: 2,
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                )),
                                            child: CustomImage(
                                                radius: 20,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.fill,
                                                path:
                                                    '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingChallenge?.team?.logo ?? ""}'),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 14,
                                              width: 14,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      255, 145, 0, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
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
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team A",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            homePageController
                                                    .groundsDetail
                                                    ?.groundKingChallenge
                                                    ?.team
                                                    ?.name ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Vs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team B",
                                            // textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                          Text(
                                            Get.find<HomePageController>()
                                                    .groundsDetail
                                                    ?.groundKingChallenge
                                                    ?.opponentTeam
                                                    ?.name ??
                                                "",
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: const Color(0xFFE0E0E0),
                                              width: 1,
                                            )),
                                        child: CustomImage(
                                            radius: 20,
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.fill,
                                            path:
                                                '${AppConstants.baseUrl}${homePageController.groundsDetail?.groundKingChallenge?.opponentTeam?.logo ?? ""}'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 145, 0, 0.1),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Match Scheduled on ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  fontSize: 8,
                                                  color: Colors.black),
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${DateTime.parse(homePageController.groundsDetail?.groundKingChallenge?.scheduledTime).dayDateTime}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                      fontSize: 8,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              }
            });
    });
  }
}

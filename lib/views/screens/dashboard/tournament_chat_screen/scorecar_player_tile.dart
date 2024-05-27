import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:get/get.dart';

import '../../../../data/models/response/joinedteam_model.dart';

class ScoreCardPlayerTile extends StatefulWidget {
  final int totalgoals;
  final int index;
  final int memberIndex;
  final UserElement member;
  const ScoreCardPlayerTile(
      {super.key,
      required this.index,
      required this.member,
      required this.memberIndex,
      required this.totalgoals});

  @override
  State<ScoreCardPlayerTile> createState() => _ScoreCardPlayerTileState();
}

class _ScoreCardPlayerTileState extends State<ScoreCardPlayerTile> {
  String bestMidField = "No";
  String bestDefender = "No";
  TextEditingController noOfGoal = TextEditingController(text: "00");
  TextEditingController noOfAssist = TextEditingController(text: "00");
  late int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: widget.index % 2 == 0 ? Color(0xFFF5F5F5) : Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Text(
            widget.member.user?.name ?? "",
            textAlign: TextAlign.center,
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
            child: TextField(
              controller: noOfGoal,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (val) {
                setState(() {
                  if (val != "") {
                    if (int.parse(val) > widget.totalgoals) {
                      noOfGoal.text = widget.totalgoals.toString();
                      Fluttertoast.showToast(
                          msg:
                              "Number of Goals cannot be more than total goals");
                    }
                  }
                });
                Get.find<KingChallengeController>()
                    .scorecardDataList[widget.memberIndex]["goals"] = val;
              },
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
            child: TextField(
              controller: noOfAssist,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (val) {
                Get.find<KingChallengeController>()
                    .scorecardDataList[widget.memberIndex]["assist"] = val;
              },
            ),
          )),
          Expanded(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              underline: Container(),
              value: bestMidField,
              onChanged: (String? newValue) {
                setState(() {
                  bestMidField = newValue!;
                  Get.find<KingChallengeController>()
                          .scorecardDataList[widget.memberIndex]
                      ["best_midfield"] = bestMidField;
                });
              },
              items: <String>['Yes', 'No'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              underline: Container(),
              value: bestDefender,
              onChanged: (String? newValue) {
                setState(() {
                  bestDefender = newValue!;
                  Get.find<KingChallengeController>()
                          .scorecardDataList[widget.memberIndex]
                      ["best_defender"] = bestDefender;
                });
              },
              items: <String>['Yes', 'No'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

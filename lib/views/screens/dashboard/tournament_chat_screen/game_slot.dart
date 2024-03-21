import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/screens/dashboard/player_list.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/route_helper.dart';
import '../../../base/custom_image.dart';

class GameSlot extends StatefulWidget {
  const GameSlot({super.key});

  @override
  State<GameSlot> createState() => _GameSlotState();
}

class _GameSlotState extends State<GameSlot> {
  bool isSwitchOn = false;
  bool switchbutton = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF455A64).withOpacity(0.4))
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                      text: "12 Feb 2024 10:12 AM",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                        color: Color(0xFFFF9100)
                              ),
                      children: [
                        TextSpan(
                          text: "\nschedule",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                            color: Color(0xFF455A64)
                                  ),
                        ),
                      ]
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Football  match",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600
                                ),),
                        Row(
                          children: [
                            RichText(text: TextSpan(
                              text: "230+",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700
                                      ),
                              children: [
                                TextSpan(
                                  text: "\nPlayers shown interest",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400
                                          ),
                                ),
                              ]
                            )),
                            SizedBox(
                            width: 10
                            ),
                            IconButton(icon:Icon(size: 30,Icons.keyboard_arrow_right_outlined), onPressed: () {
                              Navigator.push(
                                context,
                                getCustomRoute(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 600),
                                  child: const PlayerListScreen(),
                                ),
                              );
                            },)
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                    height: 15
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImage(
                                radius: 50,
                                height: 20,
                                width: 20,
                                path: "https://s3-alpha-sig.figma.com/img/edbc/827e/ddd9eb8d1b1f8a34ea7de88255893a11?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L33otg20rmNDjbv2godV47V2VKD4bEukiEVlI0FAICF2D9vNJwX7HfLaWAJ1vfLzFeMPrMqP4lIpanRlxkvL6ayojKlAqsfWlzGzAKsg0NfGPjDrYmpnIsnvBOC3pQh8yy2HwEABL9tuszzm3vQPqW4WM2THrgjgyEu4SVPv0xA12IpmPpSUU2Gr5N2MLAloiEm43dNrdxbwWbVWqnfusKUybziAqaN89X4yECYFEQTSF5lwj1zx~RnOYf5-O48vKnh3QdgjGeoD2paa7mMYC8d9IPsC3vKOMV9~pBcKjz3uYYyygvqTbTB7Lw7-0jm259hn~BVtt5C-YkpAeFxPvA__"),
                            SizedBox(
                                width: 10
                            ),
                            Column(
                              children: [
                                Text("Darrell Steward",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("Posted on 10 Feb 2024",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400
                                        ),)
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
                          inactiveColor: Color(0xFFFF6B6B),
                          activeColor: Color(0xFF02BF4D),
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
            SizedBox(
                height: 15
            ),
            Container(
              height: 170,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF455A64).withOpacity(0.4))
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                        text: "12 Feb 2024 10:12 AM",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF9100)
                        ),
                        children: [
                          TextSpan(
                            text: "\nschedule",
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF455A64)
                            ),
                          ),
                        ]
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Football  match",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600
                        ),),
                        Row(
                          children: [
                            RichText(text: TextSpan(
                                text: "230+",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                                children: [
                                  TextSpan(
                                    text: "\nPlayers shown interest",
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ]
                            )),
                            SizedBox(
                                width: 10
                            ),
                            IconButton(icon:Icon(size: 30,Icons.keyboard_arrow_right_outlined), onPressed: () {
                              Navigator.push(
                                context,
                                getCustomRoute(
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 600),
                                  child: const PlayerListScreen(),
                                ),
                              );
                            },)
                          ],
                        ),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImage(
                                radius: 50,
                                height: 20,
                                width: 20,
                                path: "https://s3-alpha-sig.figma.com/img/edbc/827e/ddd9eb8d1b1f8a34ea7de88255893a11?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=L33otg20rmNDjbv2godV47V2VKD4bEukiEVlI0FAICF2D9vNJwX7HfLaWAJ1vfLzFeMPrMqP4lIpanRlxkvL6ayojKlAqsfWlzGzAKsg0NfGPjDrYmpnIsnvBOC3pQh8yy2HwEABL9tuszzm3vQPqW4WM2THrgjgyEu4SVPv0xA12IpmPpSUU2Gr5N2MLAloiEm43dNrdxbwWbVWqnfusKUybziAqaN89X4yECYFEQTSF5lwj1zx~RnOYf5-O48vKnh3QdgjGeoD2paa7mMYC8d9IPsC3vKOMV9~pBcKjz3uYYyygvqTbTB7Lw7-0jm259hn~BVtt5C-YkpAeFxPvA__"),
                            SizedBox(
                                width: 10
                            ),
                            Column(
                              children: [
                                Text("Darrell Steward",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600
                                ),),
                                Text("Posted on 10 Feb 2024",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                ),)
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
                          inactiveColor: Color(0xFFFF6B6B),
                          activeColor: Color(0xFF02BF4D),
                          showOnOff: true,
                          activeTextColor: Colors.white,
                          inactiveTextColor: Colors.white,
                          value: switchbutton,
                          onToggle: (val) {
                            setState(() {
                              switchbutton = val;
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
}

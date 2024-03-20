import 'package:flutter/material.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_details.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/theme.dart';
import '../../../base/common_button.dart';

class LeagueAndTourTile extends StatefulWidget {
  final String typesOfLeague;
  const LeagueAndTourTile({super.key, required this.typesOfLeague});

  @override
  State<LeagueAndTourTile> createState() => _LeagueAndTourTileState();
}

class _LeagueAndTourTileState extends State<LeagueAndTourTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey.shade200),
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ground King League’s",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "10 Feb 2024 to 22 Feb 2024",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11,
                                    color: Colors.black87,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              widget.typesOfLeague,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Participate 40 Team",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: const Color(0xffFF9100),
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
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        children: [
                          TextSpan(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomButton(
                        height: 34,
                        elevation: 0,
                        radius: 6,
                        type: ButtonType.secondary,
                        borderColor: Colors.grey.shade800,
                        title: "View Details",
                        fontSize: 10,
                        onTap: () {
                          Navigator.push(
                            context,
                            getCustomRoute(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 600),
                              child: LeagueDetailsPage(typesOfLeague: widget.typesOfLeague,),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CustomButton(
                          // minWidth: 0,
                          color: primaryColor,
                          height: 34,
                          elevation: 0,
                          radius: 6,
                          type: ButtonType.primary,
                          onTap: () {},
                          // title: "23/40 Team • Participate Now",
                          child: Text(
                            "23/40 Team • Participate Now",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Colors.white,
                              fontSize: 10
                                ),
                          ),
                        ),
                      ),
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
  }
}

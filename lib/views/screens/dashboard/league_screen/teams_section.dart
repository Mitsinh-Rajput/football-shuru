import 'package:flutter/material.dart';

import '../../../../data/models/response/league_model.dart';
import '../../../../services/constants.dart';
import '../../../base/custom_image.dart';

class Teams extends StatefulWidget {
  final List<TeamElement> teams;
  const Teams({super.key, required this.teams});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Participants Teams",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(38, 50, 56, 1),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.teams.length,
                itemBuilder: (context, index) {
                  TeamElement team = widget.teams[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromRGBO(196, 196, 196, 1))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.grey,
                                                )),
                                            child: CustomImage(
                                                radius: 20,
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.fill,
                                                path:
                                                    '${AppConstants.baseUrl}${team.team?.logo ?? ""}'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Team ${index + 1}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                          Text(
                                            team.team?.name ?? "",
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
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "Joined Date - ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                            text: "\n12 Feb 2024 / 10:12 AM",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}

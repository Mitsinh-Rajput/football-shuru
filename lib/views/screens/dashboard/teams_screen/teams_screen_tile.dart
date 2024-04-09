import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/services/date_formatters_and_converters.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:get/get.dart';

import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class TeamsScreenTile extends StatefulWidget {
  const TeamsScreenTile({super.key});

  @override
  State<TeamsScreenTile> createState() => _TeamsScreenTileState();
}

class _TeamsScreenTileState extends State<TeamsScreenTile> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamControllor>(builder: (teamControllor) {
      if (teamControllor.isLoading && teamControllor.joinedTeam.isEmpty) {
        return CustomShimmer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "My List of Teams",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        const CustomImage(
                          radius: 50,
                          path:
                              "https://content.jdmagicbox.com/comp/mumbai/p8/022pxx22.xx22.220811180605.h5p8/catalogue/enc-sports-turf-jk-gram-thane-west-mumbai-yhq2pyqds4.jpg?clr=145229",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Team Ground king 1".toUpperCase(),
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Club Of Thane Center",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              color: textPrimary,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "Joined Date -\n",
                                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                                color: textPrimary,
                                                fontWeight: FontWeight.w900,
                                              ),
                                          children: [
                                            TextSpan(
                                              text: "12Feb2024/10:12AM",
                                              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                                    color: textPrimary,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My List of Teams",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: textPrimary,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(
            width: 16,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: teamControllor.joinedTeam.length,
            itemBuilder: (context, index) {
              final team = teamControllor.joinedTeam[index];
              return Container(
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    CustomImage(
                      radius: 50,
                      path: "${team.team?.logo ?? ''}",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Team Ground king 1".toUpperCase(),
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  team.team?.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: textPrimary,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Joined Date -\n",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: textPrimary,
                                          fontWeight: FontWeight.w900,
                                        ),
                                    children: [
                                      TextSpan(
                                        text: "${DateFormatters().dateTime.format(team.createdAt!)}",
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                              color: textPrimary,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

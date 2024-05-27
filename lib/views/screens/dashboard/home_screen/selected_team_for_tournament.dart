import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/tournament_league_controller.dart';
import 'package:football_shuru/views/base/snack_bar.dart';
import 'package:get/get.dart';

import '../../../../controllers/team_controller.dart';
import '../../../../services/date_formatters_and_converters.dart';
import '../../../../services/theme.dart';
import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';
import '../../../base/shimmer.dart';

class TeamSelectionDialogue {
  dialogue(context, int leagueId) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return PopScope(
            canPop: false,
            child: TeamSelectionScreen(
              leagueId: leagueId,
            ),
          );
        }));
  }
}

class TeamSelectionScreen extends StatefulWidget {
  final int leagueId;
  const TeamSelectionScreen({
    super.key,
    required this.leagueId,
  });

  @override
  State<TeamSelectionScreen> createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen> {
  bool _showButton = false;
  int? teamId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<TeamControllor>().getJoinedTeam();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Team",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<TeamControllor>(builder: (teamControllor) {
            if (teamControllor.isLoading && teamControllor.joinedTeam.isEmpty) {
              return CustomShimmer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
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
                      itemCount: 2,
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
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Team Ground king 1".toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Club Of Thane Center",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                    color: textPrimary,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "Joined Date -\n",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      color: textPrimary,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                children: [
                                                  TextSpan(
                                                    text: "12Feb2024/10:12AM",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .copyWith(
                                                          color: textPrimary,
                                                          fontWeight:
                                                              FontWeight.w400,
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
            } else if (!teamControllor.isLoading &&
                teamControllor.joinedTeam.isEmpty) {
              return const SizedBox.shrink();
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
                  height: 16,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: teamControllor.joinedTeam.length,
                  itemBuilder: (context, index) {
                    final team = teamControllor.joinedTeam[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _showButton = true;
                          teamId = team.id;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: team.id == teamId
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          children: [
                            CustomImage(
                              radius: 50,
                              path: team.team?.logo ?? '',
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          team.team?.name ?? "",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                color: textPrimary,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: "Joined Date -\n",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color: textPrimary,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                            children: [
                                              TextSpan(
                                                text: DateFormatters()
                                                    .dateTime
                                                    .format(team.createdAt ??
                                                        DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall!
                                                    .copyWith(
                                                      color: textPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_showButton)
                  CustomButton(
                    elevation: 0,
                    onTap: () async {
                      if (teamId != null) {
                        await Get.find<TournamentLeagueController>()
                            .assignLeague(
                                teamId: teamId.toString(),
                                leagueId: widget.leagueId.toString())
                            .then((value) {
                          if (value.isSuccess) {
                            Navigator.pop(context);
                            showSnackBar(context, content: value.message);
                          }
                        });
                      }
                    },
                    child: Text("Submit"),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

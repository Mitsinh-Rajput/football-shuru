import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/services/date_formatters_and_converters.dart';
import 'package:get/get.dart';

import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class TeamChatScreen extends StatefulWidget {
  const TeamChatScreen({super.key});

  @override
  State<TeamChatScreen> createState() => _TeamChatScreenState();
}

class _TeamChatScreenState extends State<TeamChatScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<TeamControllor>(builder: (teamControllor) {
      return ListView.builder(
        itemCount: teamControllor.joinedTeam.length,
        itemBuilder: (context, index) {
          final team = teamControllor.joinedTeam[index];
          return Container(
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 6,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  radius: 50,
                  path: team.team?.logo ?? "",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          team.team?.name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      if (team.team?.lastMessage?.message != null)
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            team.team?.lastMessage?.message ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: textPrimary,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "${team.team?.usersCount ?? ""} • members".toUpperCase(),
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: const Color(0xffFF9100),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                if (team.team?.lastMessage?.createdAt != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          DateFormatters().hMA.format(team.team!.lastMessage!.createdAt!),
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      if (team.team?.unreadMessagesCount?.isGreaterThan(0) ?? false)
                        const SizedBox(
                          height: 4,
                        ),
                      if (team.team?.unreadMessagesCount?.isGreaterThan(0) ?? false)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${team.team?.unreadMessagesCount}",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                    ],
                  )
              ],
            ),
          );
        },
      );
    });
  }
}

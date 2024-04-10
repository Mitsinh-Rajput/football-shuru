import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:get/get.dart';

import '../../../../services/route_helper.dart';
import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';
import '../tournament_chat_screen/tournament_chat_screen.dart';
import 'chat_tile.dart';

class GroundChatScreen extends StatefulWidget {
  const GroundChatScreen({super.key});

  @override
  State<GroundChatScreen> createState() => _GroundChatScreenState();
}

class _GroundChatScreenState extends State<GroundChatScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomePageController>(builder: (homePageController) {
      if (homePageController.isLoading && homePageController.joinedGrounds.isEmpty) {
        return CustomShimmer(
            child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const MyChatTile();
          },
        ));
      }
      return ListView.separated(
        itemCount: homePageController.joinedGrounds.length,
        itemBuilder: (context, index) {
          final ground = homePageController.joinedGrounds[index];
          return GestureDetector(
            onTap: () {
              ground.unReadMessages = 0;
              Navigator.push(context, getCustomRoute(child: SelectGroundChatScreen(selectedGround: ground, groundId: ground.id!)));
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 6,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImage(
                    radius: 50,
                    path: ground.images.isNotEmpty
                        ? ground.images[0]
                        : "https://content.jdmagicbox.com/comp/mumbai/p8/022pxx22.xx22.220811180605.h5p8/catalogue/enc-sports-turf-jk-gram-thane-west-mumbai-yhq2pyqds4.jpg?clr=145229",
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
                        Text(
                          ground.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        if (ground.lastMessageDate?.message?.isValid ?? false)
                          Text(
                            ground.lastMessageDate?.message ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: textPrimary,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.people_outline_rounded,
                              size: 20,
                              color: Color(0xffFF9100),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              " ${ground.userCount ?? 1} • members".toUpperCase(),
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: const Color(0xffFF9100),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        ground.lastMessageDate?.createdAt?.hMA ?? "",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      if ((ground.unReadMessages ?? 0).isGreaterThan(1))
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "${ground.unReadMessages}",
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
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 1,
            color: Colors.grey.shade200,
          );
        },
      );
    });
  }
}

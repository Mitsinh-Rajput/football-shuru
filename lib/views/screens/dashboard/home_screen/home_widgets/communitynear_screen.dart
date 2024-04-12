import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../services/route_helper.dart';
import '../../../../base/custom_image.dart';
import '../../tournament_chat_screen/tournament_chat_screen.dart';
import '../community_near_me.dart';

class CommunityNearMeScreen extends StatefulWidget {
  const CommunityNearMeScreen({super.key});

  @override
  State<CommunityNearMeScreen> createState() => _CommunityNearMeScreenState();
}

class _CommunityNearMeScreenState extends State<CommunityNearMeScreen> {
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Ground community near me",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                        ),
                      ),
                    ),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: 150,
                width: size.width,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                      child: const CommunityNearMe(),
                    );
                  },
                ),
              ),
              //
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      } else if (!homePageController.isLoading && homePageController.joinedGrounds.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Ground community near me",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                  ),
                ),
                Image.asset(
                  Assets.imagesArrowRight,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 150,
            width: size.width,
            child: ListView.builder(
              itemCount: homePageController.joinedGrounds.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final ground = homePageController.joinedGrounds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      getCustomRoute(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 600),
                        child: SelectGroundChatScreen(
                          selectedGround: ground,
                          groundId: ground.id!,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade200,
                          )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              if (ground.images.isNotEmpty)
                                CustomImage(
                                  radius: 40,
                                  path: ground.images[0],
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.cover,
                                ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  ground.title ?? '',
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black87,
                                      ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                                text: "Address: ",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  TextSpan(
                                    text: ground.address ?? "",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ]),
                          ),
                          //
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                ),
                                child: Text(
                                  "Follow • 5.6 K",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                              //
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                "${ground.userCount ?? 1} Members",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //
          const SizedBox(
            height: 30,
          ),
        ],
      );
    });
  }
}

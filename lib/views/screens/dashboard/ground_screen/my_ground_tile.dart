import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/tournament_chat_screen.dart';
import 'package:get/get.dart';

import '../../../../services/route_helper.dart';
import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class MyGrounds extends StatefulWidget {
  const MyGrounds({super.key});

  @override
  State<MyGrounds> createState() => _MyGroundsState();
}

class _MyGroundsState extends State<MyGrounds> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Your grounds",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: textPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 5),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homePageController.joinedGrounds.length,
            itemBuilder: (context, index) {
              final ground = homePageController.joinedGrounds[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, getCustomRoute(child: TournamentChatScreen(groundId: ground.id!)));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImage(
                        radius: 6,
                        path: ground.images.isNotEmpty ? ground.images[0] : Assets.imagesPlaceholder,
                        height: 100,
                        width: 90,
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
                                    ground.title ?? '',
                                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                          fontSize: 14,
                                          color: textPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                const Icon(
                                  Icons.more_horiz,
                                  size: 24,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Football Ground • Poin king  club for",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              ground.description ?? "",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.people_outline_rounded,
                                  size: 24,
                                  color: textPrimary,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "5,00 member",
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                        color: textPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

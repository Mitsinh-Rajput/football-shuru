import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/my_ground_tile.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/route_helper.dart';
import '../../initial_screens/location_screen.dart';

class MyGroundScreen extends StatefulWidget {
  const MyGroundScreen({super.key});

  @override
  State<MyGroundScreen> createState() => _MyGroundScreenState();
}

class _MyGroundScreenState extends State<MyGroundScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      await Get.find<HomePageController>().getJoinedGrounds();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              Assets.imagesMenu,
              height: 24,
              width: 24,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.grey.shade200,
          ),
          child: TextField(
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: "Search Nearby grounds",
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.grey.shade400,
                  ),
            ),
          ),
        ),
        actions: [
          const SizedBox(
            width: 16,
          ),
          Image.asset(
            Assets.imagesSearch,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(
            size.width,
            1,
          ),
          child: Container(
            color: Colors.grey.shade200,
            height: 1,
            width: double.infinity,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            getCustomRoute(
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 400),
              child: const LocationScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: primaryColor, boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.25),
            ),
          ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                "Add Ground",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<HomePageController>().getJoinedGrounds();
        },
        child: GetBuilder<HomePageController>(builder: (homePageController) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyGrounds(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Recommended grounds",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 16),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomImage(
                              radius: 6,
                              path: "https://www.playall.in/images/gallery/faridabad_futsal_3.png",
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
                                          "Cooperage Football Ground",
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
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temaliqua.",
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
                      );
                    },
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

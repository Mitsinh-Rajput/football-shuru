import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/add_ground.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/community_near_me.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/league_and_tour_tile.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/near_ground.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/tournament_chat_screen.dart';
import 'package:football_shuru/views/screens/initial_screens/location_screen.dart';
import 'package:football_shuru/views/screens/initial_screens/splash_screen.dart';
import 'package:football_shuru/views/screens/widgets/changepincode_bottomsheet.dart';
import 'package:football_shuru/views/screens/widgets/primarybanner_widget.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/route_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() {});
  }

  List typesOfLeaguelist = ["League’s match", "Knock out", "Round robins", "League’s match"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
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
        title: GestureDetector(
          onTap: () {
            Navigator.push(context, getCustomRoute(child: const LocationScreen()));
          },
          child: RichText(
            text: TextSpan(
                text: "Football ",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textPrimary,
                    ),
                children: [
                  TextSpan(
                    text: "Shuru",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: textPrimary,
                        ),
                  ),
                ]),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.find<AuthController>().clearSharedData();

              Navigator.push(context, getCustomRoute(child: const SplashScreen()));
            },
            child: Image.asset(
              Assets.imagesSearch,
              height: 22,
              width: 22,
            ),
          ),
          const SizedBox(
            width: 26,
          ),
          Image.asset(
            Assets.imagesNotification,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(size.width, 30),
            child: GetBuilder<AuthController>(builder: (authController) {
              return Align(
                child: Container(
                  height: 30,
                  color: const Color(0xffFFF4EF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: RichText(
                        text: TextSpan(
                          text: 'Your Pincode: ',
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xffFF9A6C), fontWeight: FontWeight.w300),
                          children: [
                            TextSpan(
                              text: authController.profile?.pincode ?? "",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(color: const Color(0xffFF9A6C)),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          ChangePincodeBottomSheet().dialogue(context);
                        },
                        child: Text(
                          "Change Now",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })),
        //
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            // banner
            const PrimaryBannerWidget(), const SizedBox(height: 15),

            //! Community ground --
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
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        getCustomRoute(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          child: const TournamentChatScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                      child: const CommunityNearMe(),
                    ),
                  );
                },
              ),
            ),
            //
            const SizedBox(
              height: 30,
            ),
            //! Nearby ground --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Nearby ground’s",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        getCustomRoute(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          child: const AddGround(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Add Ground",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 11 / 0.1,
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        getCustomRoute(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 600),
                          child: const NearGround(),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(color: Color(0xffD6F5E3), shape: BoxShape.circle),
                            child: const CustomImage(
                              height: 50,
                              width: 50,
                              radius: 50,
                              path: "https://5.imimg.com/data5/SELLER/Default/2021/3/TU/VP/FT/125148535/cricket-ground-development-500x500.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Sector 23, plot 1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //! Nearby ground --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "League’s / Tournament",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Add League",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: typesOfLeaguelist.length,
                itemBuilder: (context, index) {
                  return LeagueAndTourTile(
                    typesOfLeague: typesOfLeaguelist[index],
                  );
                },
              ),
            ),
            // bottom
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

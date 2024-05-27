import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/home_widgets/communitynear_screen.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/home_widgets/nearbygrounds_widget.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/league_and_tour_screen.dart';
import 'package:football_shuru/views/screens/widgets/changepincode_bottomsheet.dart';
import 'package:football_shuru/views/screens/widgets/primarybanner_widget.dart';
import 'package:get/get.dart';

import '../../../../controllers/homepage_controller.dart';
import '../../../../controllers/tournament_league_controller.dart';
import '../../../../services/route_helper.dart';
import '../../initial_screens/location_screen.dart';

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
            Navigator.push(
                context, getCustomRoute(child: const LocationScreen()));
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
              // Navigator.push(
              //     context, getCustomRoute(child: SetWinnerScreen(groundId: 0)));
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
                child: GestureDetector(
                  onTap: () {
                    ChangePincodeBottomSheet().dialogue(context);
                  },
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
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: const Color(0xffFF9A6C),
                                    fontWeight: FontWeight.w300),
                            children: [
                              TextSpan(
                                text: authController.profile?.pincode ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: const Color(0xffFF9A6C)),
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(width: 15),
                        Text(
                          "Change Now",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
        //
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<HomePageController>().getSlider();
          await Get.find<AuthController>().getgrounds();
          await Get.find<TournamentLeagueController>().getLeague();
        },
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              // banner
              PrimaryBannerWidget(), SizedBox(height: 15),

              //! Community ground --
              CommunityNearMeScreen(),
              //! Nearby ground --
              NearbyGrounds(),
              LeagueAndTourScreen(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

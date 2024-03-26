import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/chats_screen/chats_screen.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/ground_screen.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/home_screen.dart';
import 'package:football_shuru/views/screens/dashboard/league_screen/league_screen.dart';
import 'package:football_shuru/views/screens/dashboard/teams_screen/teams_screen.dart';
import 'package:get/get.dart';

import '../../../controllers/homepage_controller.dart';
import 'drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      await Get.find<HomePageController>().getSlider();
      await Get.find<AuthController>().getProfile();
    });
  }

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      body: [
        const HomeScreen(),
        const LeagueScreen(),
        const MyGroundScreen(),
        const ChatsScreen(),
        const MyTeamsScreen(),
      ][selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: primaryColor,
        currentIndex: selectIndex,
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Image.asset(
                Assets.imagesHome,
                height: 24,
                width: 24,
                color: selectIndex == 0 ? primaryColor : Colors.grey.shade600,
              )),
          BottomNavigationBarItem(
              label: "League",
              icon: Image.asset(
                Assets.imagesLeague,
                height: 24,
                width: 24,
                color: selectIndex == 1 ? primaryColor : Colors.grey.shade600,
              )),
          BottomNavigationBarItem(
              label: "Ground",
              icon: Image.asset(
                Assets.imagesGround,
                height: 24,
                width: 24,
                color: selectIndex == 2 ? primaryColor : Colors.grey.shade600,
              )),
          BottomNavigationBarItem(
              label: "Chats",
              icon: Image.asset(
                Assets.imagesChats,
                height: 24,
                width: 24,
                color: selectIndex == 3 ? primaryColor : Colors.grey.shade600,
              )),
          BottomNavigationBarItem(
              label: "Teams",
              icon: Image.asset(
                Assets.imagesTeams,
                height: 24,
                width: 24,
                color: selectIndex == 4 ? primaryColor : Colors.grey.shade600,
              )),
        ],
        onTap: (value) {
          setState(() {
            selectIndex = value;
          });
        },
      ),
    );
  }
}

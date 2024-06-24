import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/chats_screen/chat_tile.dart';
import 'package:football_shuru/views/screens/dashboard/chats_screen/groundchats_screen.dart';
import 'package:football_shuru/views/screens/dashboard/chats_screen/teamchat_screen.dart';
import 'package:get/get.dart';

import '../../../../controllers/homepage_controller.dart';
import '../../../../generated/assets.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Grounds'),
    Tab(text: 'League Chatroom'),
    Tab(text: 'Teams'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Timer.run(() async {
      await Get.find<HomePageController>().getJoinedGrounds();
      await Get.find<TeamControllor>().getJoinedTeam();
    });
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: Text(
          "Community Chat",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: textPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [
          Image.asset(
            Assets.imagesSearch,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Column(
        children: [
          Theme(
            data: ThemeData(useMaterial3: false),
            child: TabBar(
              isScrollable: true,
              indicatorColor: primaryColor,
              dividerColor: Colors.grey.shade200,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              indicatorWeight: 3.0,
              labelColor: primaryColor,
              unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
              unselectedLabelColor: Colors.grey.shade500,
              controller: _tabController,
              tabs: myTabs,
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              // final String label = tab.text!.toLowerCase();
              const GroundChatScreen(),
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const MyChatTile();
                },
              ),
              const TeamChatScreen(),
            ]),
          ),
        ],
      ),
    );
  }
}

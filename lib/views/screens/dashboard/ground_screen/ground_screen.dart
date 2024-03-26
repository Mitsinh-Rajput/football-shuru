import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/add_ground.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/my_ground_tile.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../services/route_helper.dart';

class MyGroundScreen extends StatefulWidget {
  const MyGroundScreen({super.key});

  @override
  State<MyGroundScreen> createState() => _MyGroundScreenState();
}

class _MyGroundScreenState extends State<MyGroundScreen> {
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
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            Assets.imagesMenu,
            height: 24,
            width: 24,
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
              duration: const Duration(milliseconds: 600),
              child: const AddGround(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: primaryColor,
              boxShadow: [
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
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
              // const SizedBox(
              //   height: 14,
              // ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const MyGroundTile();
                },
              ),
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
                  return const MyGroundTile();
                },
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';

import '../auth_screens/mobile_auth_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final pageController = PageController();
  int index = 0;

  List<SliderList> introList = [
    SliderList(
      title: "Available your nearby football ground !",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      imageAssets: Assets.imagesBackgroundImage,
    ),
    SliderList(
      title: "Available your nearby football ground !",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      imageAssets: Assets.imagesBackgroundImage,
    ),
    SliderList(
      title: "Available your nearby football ground !",
      subtitle:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      imageAssets: Assets.imagesBackgroundImage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (int index) {
            setState(() {
              this.index = index;
            });
            log(index.toString(), name: "Log");
          },
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: introList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        introList[index].imageAssets,
                        width: size.width,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CustomImage(
                            path: Assets.imagesFootballLogo,
                            height: size.height * .14,
                            width: size.height * .11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 20),
                        child: Text(
                          introList[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 26.0,
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          introList[index].subtitle,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: textPrimary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                for (var i = 0; i < introList.length; i++)
                  Container(
                    width: 13,
                    height: 6,
                    margin: const EdgeInsets.only(bottom: 4, left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: i == index ? primaryColor : Colors.grey.shade800,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              elevation: 0,
              radius: 50,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome Back"),
                  SizedBox(
                    width: 8,
                  ),
                  CustomImage(
                    path: Assets.imagesArrowRight,
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  getCustomRoute(
                    child: const MobileAuthScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              type: ButtonType.secondary,
              color: Colors.white,
              elevation: 0,
              radius: 50,
              child: const Text(
                "Do it later? Close app",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SliderList {
  String title;
  String subtitle;
  String imageAssets;
  SliderList({
    required this.title,
    required this.subtitle,
    required this.imageAssets,
  });
}

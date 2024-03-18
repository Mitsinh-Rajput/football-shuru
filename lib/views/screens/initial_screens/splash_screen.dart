import 'dart:async';

import 'package:flutter/material.dart';
import 'package:football_shuru/services/constants.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/initial_screens/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.run(() {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          getCustomRoute(
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 600),
            child: const IntroductionScreen(),
          ),
        );
      });

      /*if (Get.find<AuthController>().isLoggedIn()) {
        Get.find<AuthController>().getUserProfileData().then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            if (Get.find<AuthController>().checkUserData()) {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const Dashboard(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                getMaterialRoute(
                  child: const SignupScreen(),
                ),
              );
            }
          });
        });
      } else {
        Navigator.pushReplacement(
          context,
          getMaterialRoute(
            child: const LoginScreen(),
          ),
        );
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            CustomImage(
              path: Assets.imagesFootballLogo,
              height: size.height * .11,
              width: size.height * .11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppConstants.appNamePart1 + " ",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(64, 66, 78, 1)),
                ),
                Text(
                  AppConstants.appNamePart2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 22.0, color: textPrimary),
                ),
              ],
            ),
            Text(
              "SPORTS STARTS WITH US",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 11,
                    color: const Color.fromRGBO(43, 63, 108, 1),
                  ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

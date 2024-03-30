import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/screens/auth_screens/mobile_auth_screen.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/route_helper.dart';
import '../../../services/theme.dart';
import '../../base/common_button.dart';
import '../../base/custom_image.dart';
import '../../base/dialogs/deleteaccount_dialog.dart';
import 'dashboard_screen.dart';
import 'edit_profile_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<AuthController>().drawercheck = true;

    Timer.run(() async {
      if (Get.find<AuthController>().getUserToken().isValid) {
        await Get.find<AuthController>().getProfile();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<AuthController>().drawercheck = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Scaffold(
        backgroundColor: Colors.white,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            surfaceTintColor: primaryColor,
            backgroundColor: primaryColor,
            title: Text(
              "Menu",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
            ]),
        body: GetBuilder<AuthController>(builder: (authController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                if (authController.getUserToken().isValid)
                  Container(
                    width: size.width,
                    color: primaryColor,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          authController.profile?.name ?? "",
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                        ),
                        Text(
                          authController.profile?.email ?? '',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                          ),
                          child: CustomButton(
                            radius: 6,
                            height: 40,
                            color: Colors.white,
                            onTap: () {
                              Navigator.push(
                                context,
                                getCustomRoute(
                                  type: PageTransitionType.fade,
                                  child: const EditProfileScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  Assets.imagesUser,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    children: [
                      //
                      const SizedBox(
                        height: 14,
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, getCustomRoute(child: const DashboardScreen()), (route) => false);
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.home,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "Home",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      //

                      //

                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   getCustomRoute(
                          //     child: const ContactUsScreen(),
                          //   ),
                          // );
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesContctUs,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "Contact Us",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, getCustomRoute(child: const AboutUsScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesSupport,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "About Us",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      //

                      //
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, getCustomRoute(child: CustomWebView(url: authController.businessSettings?.termsCondition ?? "", title: "Term & Condition")));
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesTermAndCondition,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "Term & Condition",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      GestureDetector(
                        onTap: () {
                          // Share.share(
                          //     """${authController.businessSettings?.shareContent ?? ""}${Platform.isAndroid ? (authController.businessSettings?.appDownload ?? "https://play.google.com/store/apps/details?id=com.youthprimebook") : (authController.businessSettings?.iosAppDownload ?? "https://www.apple.com/app-store/")} .""");
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesShareapp,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "Share",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      GestureDetector(
                        onTap: () {
                          // ExtraMethods.launchWebsite(Platform.isAndroid
                          //     ? authController.businessSettings?.appDownload ?? "https://play.google.com/"
                          //     : authController.businessSettings?.iosAppDownload ?? "https://www.apple.com/in/app-store/");
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesStar1,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Text(
                                  "Rate Us",
                                  style: Theme.of(context).textTheme.labelLarge,
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: GetBuilder<AuthController>(builder: (authController) {
          // if (authController.isLoading) {
          //   return const SizedBox.shrink();
          // }
          return Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    openAppSettings();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Settings",
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                ),
                // if (authController.getUserToken().isValid)
                GestureDetector(
                  onTap: () async {
                    FirebaseAuth.instance.signOut();
                    authController.clearSharedData();
                    authController.profile = null;
                    Fluttertoast.showToast(msg: "Logout Successful");
                    Navigator.pushAndRemoveUntil(context, getCustomRoute(child: const MobileAuthScreen()), (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout_sharp,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          "Logout",
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                ),

                if (Platform.isIOS)
                  // if (Platform.isIOS && authController.getUserToken().isValid ? (authController.businessSettings?.iosOnProduction != 'on') : false)
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DeleteAccountDialog();
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 24,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Delete Account",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

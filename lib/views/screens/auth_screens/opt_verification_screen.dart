import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/firebase_controller.dart';
import 'package:football_shuru/views/screens/auth_screens/signup_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';

import '../../../services/route_helper.dart';
import '../../../services/theme.dart';
import '../../base/custom_image.dart';
import '../dashboard/dashboard_screen.dart';

class OtpVerificationDialogue {
  dialogue(context) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return const PopScope(
            canPop: false,
            child: OtpVerificationScreen(),
          );
        }));
  }
}

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool _showButton = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseController>(builder: (firebaseController) {
      return Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "OTP Verification",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "For verification, a 6-digit code has been sent to \n+91 ${firebaseController.phone.text} on your number.",
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      controller: Get.find<FirebaseController>().otpController,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            letterSpacing: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: textPrimary,
                          ),
                      onChanged: (value) {
                        setState(() {
                          if (value.length == 6) {
                            _showButton = true;
                            FocusScope.of(context).unfocus();
                          } else {
                            _showButton = false;
                          }
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: const Icon(IconlyLight.chat),
                          hintText: "Mobile OTP",
                          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (_showButton) {
                      if(kDebugMode){
                        Navigator.pushReplacement(
                          context,
                          getCustomRoute(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 600),
                            child: const DashboardScreen(),
                          ),
                        );
                      }
                      Get.find<FirebaseController>().signInWithPhoneNumber(context);

                    } else {
                      Fluttertoast.showToast(
                        msg: "Enter Valid 6 Digit Code",
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }

                    // Navigator.pushReplacement(
                    //   context,
                    //   getCustomRoute(
                    //     child: const SignUpScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: _showButton ? Colors.black : Colors.grey, borderRadius: const BorderRadius.all(Radius.circular(50))),
                    child: firebaseController.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(14),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const CustomImage(
                            path: Assets.imagesArrowRight,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                firebaseController.phone.clear();
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: "Change number? ",
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                        children: [
                          TextSpan(
                            text: "Back",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                ),
                          ),
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

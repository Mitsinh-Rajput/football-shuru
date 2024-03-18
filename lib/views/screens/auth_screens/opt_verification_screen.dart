import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/views/screens/auth_screens/signup_screen.dart';

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

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(24),
      // height: 340,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "OTP Verification",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "You receive a 6-digit code to +91 9876543210 on your number then verify next...",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textPrimary,
                        ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const CustomImage(
                          height: 24,
                          width: 24,
                          path: Assets.imagesCallCalling,
                        ),
                        hintText: "Mobile OTP",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    getCustomRoute(
                      child: const SignUpScreen(),
                    ),
                  );
                  // Navigator.pushReplacement(
                  //   context,
                  //   getCustomRoute(
                  //     child: const DashboardScreen(),
                  //   ),
                  // );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Image.asset(
                    Assets.imagesArrowRight,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Resent Otp again... 30 sec",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

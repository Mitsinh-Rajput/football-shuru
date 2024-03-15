import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Icon(Icons.info_outline),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Join using the phone number",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "We have send you an One Time Password(OTP) on this mobile number !",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 12.0, color: textPrimary),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CustomImage(path: Assets.imagesEnterOTPPana1),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: TextField(
                            decoration: InputDecoration(
                                icon: CustomImage(
                                  height: 24,
                                  width: 24,
                                  path: Assets.imagesCallCalling,
                                ),
                                hintText: "Mobile Number",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            Assets.imagesArrowRight,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 34, right: 34, bottom: 20),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "By tapping below. you acknowledge recipe of our Privacy Notice and our E-Sign Agreement.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

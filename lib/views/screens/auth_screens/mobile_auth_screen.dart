import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class MobileAuthScreen extends StatefulWidget {
  const MobileAuthScreen({super.key});

  @override
  State<MobileAuthScreen> createState() => _MobileAuthScreenState();
}

class _MobileAuthScreenState extends State<MobileAuthScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
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
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((context) {
                                    return SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.all(24),
                                        height: 340,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "OTP Verification",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "You receive a 6-digit code to +91 9876543210 on your number then verify next...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(fontSize: 11),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 24.0),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            245, 245, 245, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50)),
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                              icon: CustomImage(
                                                                height: 24,
                                                                width: 24,
                                                                path: Assets
                                                                    .imagesCallCalling,
                                                              ),
                                                              hintText:
                                                                  "Mobile OTP",
                                                              hintStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300)),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      getCustomRoute(
                                                        child:
                                                            const MobileAuthScreen(),
                                                      ),
                                                    );
                                                  },
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
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
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
                                      ),
                                    );
                                  }));
                            },
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
      ),
    );
  }
}

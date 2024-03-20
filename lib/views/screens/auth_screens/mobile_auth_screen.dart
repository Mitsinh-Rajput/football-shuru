import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:phone_selector/phone_selector.dart';

import '../../../controllers/firebase_controller.dart';
import '../../../services/route_helper.dart';
import '../../base/web_view.dart';
import 'opt_verification_screen.dart';

class MobileAuthScreen extends StatefulWidget {
  const MobileAuthScreen({super.key});

  @override
  State<MobileAuthScreen> createState() => _MobileAuthScreenState();
}

class _MobileAuthScreenState extends State<MobileAuthScreen> {
  bool _showButton = false;
  final _formKey = GlobalKey<FormState>();

  _getPhoneNumber() async {
    String phoneNumber;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      phoneNumber = (await PhoneSelector.getPhoneNumber())!;
    } catch (e) {
      phoneNumber = '';
    }
    if (mounted) {
      setState(() {
        Get.find<FirebaseController>().phone.text = phoneNumber;
        Get.find<FirebaseController>().update();
        if (phoneNumber != '') {
          _showButton = true;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Join using the phone number",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We have send you an One Time Password(OTP) on this phone number !",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12.0, color: textPrimary),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomImage(
                        path: Assets.imagesEnterOTPpana1,
                        width: size.width,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            decoration: BoxDecoration(color: const Color.fromRGBO(245, 245, 245, 1), borderRadius: BorderRadius.circular(50)),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  if (value.length == 10) {
                                    _showButton = true;
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    _showButton = false;
                                  }
                                });
                              },
                              controller: Get.find<FirebaseController>().phone,
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    letterSpacing: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary,
                                  ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const CustomImage(
                                    height: 24,
                                    width: 24,
                                    path: Assets.imagesCallCalling,
                                  ),
                                  hintText: "Phone Number",
                                  hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_showButton) {
                              //? otp screen --
                              await Get.find<FirebaseController>().verifyPhoneNumber(context: context).then((value) {
                                OtpVerificationDialogue().dialogue(context);
                              });
                            } else {
                              Fluttertoast.showToast(
                                msg: "Enter Valid Phone Number",
                                toastLength: Toast.LENGTH_LONG,
                              );
                            }
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(color: !_showButton ? Colors.grey.shade300 : Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
                            child: Image.asset(
                              Assets.imagesArrowRight,
                              color: _showButton ? Colors.white : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "By providing my phone number, I hereby agree and accept the ",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                ),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //   context,
                                    //   getCustomRoute(
                                    //       child: CustomWebView(
                                    //         url: Get.find<AuthController>().businessSettings?.termsCondition ?? "https://www.appdid.com/",
                                    //         title: 'Term & condition',
                                    //       )),
                                    // );
                                  },
                                text: "Term & condition",
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor,
                                    ),
                              ),
                              TextSpan(
                                text: " and ",
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.push(
                                    //   context,
                                    //   getCustomRoute(
                                    //       child: CustomWebView(
                                    //         url: Get.find<AuthController>().businessSettings?.privacyPolicy ?? "https://www.appdid.com/",
                                    //         title: 'Privacy policy',
                                    //       )),
                                    // );
                                  },
                                text: "Privacy policy",
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: primaryColor,
                                    ),
                              ),
                              TextSpan(
                                text: " in use of the Mobile App",
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

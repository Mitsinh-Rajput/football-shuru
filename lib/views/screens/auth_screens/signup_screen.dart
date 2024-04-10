import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/enums/gender.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/date_picker_widget.dart';
import 'package:football_shuru/views/base/dialogs/failed_dialog.dart';
import 'package:football_shuru/views/screens/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../services/date_formatters_and_converters.dart';
import '../../../services/route_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  Gender? _gender = Gender.male;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CustomImage(height: 60, width: 60, path: Assets.imagesFootballLogo),
                    ],
                  ),
                  Text(
                    "Create an account to explore amazing feature",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction, // Added autovalidateMode

                    validator: (value) {
                      if (value == null || value.isNotValid) {
                        return 'Enter Your Name';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: CustomDecoration.inputDecoration(
                      borderColor: Colors.grey.shade300,
                      floating: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      label: "Your Name",
                      hint: "Ex. name",
                      hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.grey.shade300,
                          ),
                      icon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                          path: Assets.imagesYourName,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  // if (true)
                  //   const SizedBox(
                  //     height: 20,
                  //   ),
                  // if (true)
                  //   TextFormField(
                  //     readOnly: true,
                  //     enabled: false,
                  //     controller: Get.find<FirebaseController>().phone,
                  //     decoration: CustomDecoration.inputDecoration(
                  //       borderColor: Colors.grey.shade300,
                  //       suffix: const Padding(
                  //         padding: EdgeInsets.all(15),
                  //         child: CustomImage(height: 5, width: 5, path: Assets.imagesLockCircle),
                  //       ),
                  //       floating: true,
                  //       contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  //       label: "Phone Number",
                  //       hint: "Ex. +91 9876543210",
                  //       hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  //             color: Colors.grey.shade300,
                  //           ),
                  //       icon: const Padding(
                  //         padding: EdgeInsets.all(15),
                  //         child: CustomImage(
                  //           path: Assets.imagesMobileNum,
                  //           height: 5,
                  //           width: 5,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction, // Added autovalidateMode
                    validator: (value) {
                      if (value == null || value.isNotValid) {
                        return 'Enter Your Email Address';
                      } else if (value.isNotEmail) {
                        return "Enter Valid Email Address";
                      }
                      return null;
                    },
                    controller: emailIdController,
                    decoration: CustomDecoration.inputDecoration(
                      borderColor: Colors.grey.shade300,
                      floating: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      label: "Email Id",
                      hint: "Ex. my.name@gmail.com",
                      hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.grey.shade300,
                          ),
                      icon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                          path: Assets.imagesEmailId,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: pincodeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    validator: (value) {
                      if (value == null || value.isNotValid) {
                        return 'Enter Pincode';
                      } else if (value.length != 6) {
                        return "Enter 6 Digit Pincode";
                      }
                      return null;
                    },
                    decoration: CustomDecoration.inputDecoration(
                      borderColor: Colors.grey.shade300,
                      floating: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      icon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(height: 5, width: 5, path: Assets.imagesPincode),
                      ),
                      label: "Enter pincode",
                      hint: "Ex. 4143905",
                      hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.grey.shade300,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gender selection",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(255, 154, 108, 1)),
                              value: Gender.male,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              }),
                          Text(Gender.male.value),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(255, 154, 108, 1)),
                              value: Gender.female,
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value;
                                });
                              }),
                          Text(Gender.female.value),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDatePicker(
                    today: false,
                    onChanged: (DateTime? dateTime) {
                      dateOfBirthController.text = DateFormatters().yMD.format(dateTime!);
                      setState(() {});
                    },
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // Added autovalidateMode

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Select Date Of Birth';
                        }
                        return null; // Return null if the value is valid
                      },
                      enabled: false,
                      readOnly: true,
                      controller: dateOfBirthController,
                      decoration: CustomDecoration.inputDecoration(
                        borderColor: Colors.grey.shade300,
                        floating: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                        label: "Date of Birth",
                        hint: "Ex. dd / mm / yyyy",
                        hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.grey.shade300,
                            ),
                        icon: const Padding(
                          padding: EdgeInsets.all(15),
                          child: CustomImage(
                            path: Assets.imagesCalendarTick,
                            height: 5,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isNotValid) {
                        return 'Enter About Bio Data';
                      }
                      return null; // Return null if the value is valid
                    },
                    maxLines: null,
                    expands: false,
                    keyboardType: TextInputType.multiline,
                    controller: bioController,
                    decoration: CustomDecoration.inputDecoration(
                      borderColor: Colors.grey.shade300,
                      floating: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      label: "About Bio",
                      hint: "Ex. type short bio",
                      hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.grey.shade300,
                          ),
                    ),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<AuthController>(builder: (authController) {
              return CustomButton(
                fontSize: 14,
                elevation: 0,
                radius: 10,
                height: 50,
                onTap: () {
                  log(_gender!.value.toString(), name: "Gender");
                  if (_formKey.currentState!.validate()) {
                    authController
                        .register(
                            pincode: pincodeController.text,
                            name: nameController.text,
                            gender: _gender!.value.toLowerCase(),
                            email: emailIdController.text,
                            dob: dateOfBirthController.text,
                            about: bioController.text)
                        .then((value) {
                      if (value.isSuccess) {
                        Navigator.pushReplacement(
                          context,
                          getCustomRoute(
                            child: const DashboardScreen(),
                          ),
                        );
                      } else {
                        FailedAlertDialog(
                          message: value.message,
                        );
                      }
                    });
                  } else {
                    Fluttertoast.showToast(msg: "Above Field Empty", toastLength: Toast.LENGTH_LONG);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign Up Now",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

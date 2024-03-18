import 'package:flutter/material.dart';
import 'package:football_shuru/services/enums/gender.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/date_picker_widget.dart';

import '../../../services/route_helper.dart';
import '../initial_screens/pincode_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  Gender? _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomImage(
                      height: 24,
                      width: 24,
                      path: Assets.imagesMessageQuestion,
                    ),
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
                      const CustomImage(
                          height: 60,
                          width: 60,
                          path: Assets.imagesFootballLogo),
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
                    controller: nameController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      label: "Your Name",
                      hint: "Ex. name",
                      hintStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: phoneNumberController,
                    decoration: CustomDecoration.inputDecoration(
                      suffix: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                            height: 5, width: 5, path: Assets.imagesLockCircle),
                      ),
                      floating: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      label: "Mobile Number",
                      hint: "Ex. +91 9876543210",
                      hintStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.grey.shade300,
                              ),
                      icon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                          path: Assets.imagesMobileNum,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailIdController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      label: "Email Id",
                      hint: "Ex. my.name@gmail.com",
                      hintStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
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
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Gender selection",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(255, 154, 108, 1)),
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
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(255, 154, 108, 1)),
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
                    onChanged: (DateTime? dateTime) {
                      setState(() {
                        dateOfBirthController.text =
                            dateTime.toString().split(" ")[0];
                      });
                    },
                    child: TextFormField(
                      enabled: false,
                      readOnly: true,
                      controller: dateOfBirthController,
                      decoration: CustomDecoration.inputDecoration(
                        floating: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        label: "Date of Birth",
                        hint: "Ex. dd / mm / yyyy",
                        hintStyle:
                            Theme.of(context).textTheme.labelLarge!.copyWith(
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
                    maxLength: 400,
                    maxLines: 3,
                    controller: bioController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      label: "About Bio",
                      hint: "Ex. type short bio",
                      hintStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
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
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              // title: "Sign Up Now",
              fontSize: 14,
              elevation: 0,
              radius: 10,
              height: 50,
              onTap: () {
                Navigator.push(
                  context,
                  getCustomRoute(
                    child: const LocationScreen(),
                  ),
                );
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
            )
          ],
        ),
      ),
    );
  }
}

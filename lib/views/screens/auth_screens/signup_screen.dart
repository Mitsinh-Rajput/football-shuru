import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/enums/gender.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/date_picker_widget.dart';
import 'package:football_shuru/views/screens/initial_screens/location.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomImage(
                      height: 24,
                      width: 24,
                      path: Assets.imagesMessageQuestion,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Welcome to",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomImage(
                          height: 70,
                          width: 70,
                          path: Assets.imagesFootballLogo),
                    ],
                  ),
                  Text(
                    "Create an account to explore amazing feature",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: "Your Name",
                      icon: Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                          path: Assets.imagesYourName,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: phoneNumberController,
                    decoration: CustomDecoration.inputDecoration(
                      suffix: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomImage(
                            height: 5, width: 5, path: Assets.imagesLockCircle),
                      ),
                      floating: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: "Mobile Number",
                      icon: Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomImage(
                          path: Assets.imagesMobileNum,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailIdController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: "Email Id",
                      icon: Padding(
                        padding: EdgeInsets.all(15),
                        child: CustomImage(
                          path: Assets.imagesEmailId,
                          height: 5,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Gender selection",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromRGBO(255, 154, 108, 1)),
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
                                  (states) => Color.fromRGBO(255, 154, 108, 1)),
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
                  SizedBox(
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        label: "Date of Birth",
                        icon: Padding(
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
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: phoneNumberController,
                    decoration: CustomDecoration.inputDecoration(
                      floating: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      label: "About Bio",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(bioController.text.length.toString() + "/400"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      title: "Sign Up Now",
                      onTap: () {
                        Navigator.push(
                          context,
                          getCustomRoute(
                            child: const LocationScreen(),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

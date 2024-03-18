import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Welcome to",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomImage(
                        height: 70, width: 70, path: Assets.imagesFootballLogo)
                  ],
                ),
                Text(
                  "Create an account to explore amazing feature",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    controller: nameController,
                    decoration: CustomDecoration.inputDecoration(
                      hint: "Your Name",
                      label: "Kathryn Murphy",
                      icon: CustomImage(path: Assets.imagesArrowRight),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../controllers/auth_controller.dart';
import '../../../services/theme.dart';
import '../../base/common_button.dart';

class ChangePincodeBottomSheet {
  dialogue(context) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const ChangePincodeScreen();
      },
    );
  }
}

class ChangePincodeScreen extends StatefulWidget {
  const ChangePincodeScreen({
    super.key,
  });

  @override
  State<ChangePincodeScreen> createState() => _ChangePincodeScreenState();
}

class _ChangePincodeScreenState extends State<ChangePincodeScreen> {
  bool _showButton = false;

  TextEditingController pincodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        width: double.infinity,
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Update Pincode",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Are you absolutely sure that you want to modify your pincode? Kindly verify your decision.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Pincode";
                    } else if (value.length != 6) {
                      return "Enter 6 Digit Pincode";
                    }
                    return null;
                  },
                  controller: pincodeController,
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
                  decoration: CustomDecoration.inputDecoration(
                      borderColor: Colors.grey.shade400,
                      bgColor: const Color(0xFFF5F5F5),
                      icon: const Icon(IconlyLight.location),
                      hint: "Enter Pincode",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w300)),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<AuthController>(builder: (authController) {
                  return CustomButton(
                    isLoading: authController.isLoading,
                    radius: 10,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authController
                            .updatePincode(pincode: pincodeController.text)
                            .then((value) {
                          if (value.isSuccess) {
                            Navigator.pop(context);
                          }
                        });
                      }
                    },
                    title: "Update Pincode",
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  borderColor: Colors.black87,
                  type: ButtonType.secondary,
                  radius: 10,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: "Do it later",
                ),
                const SizedBox(
                  height: 16,
                ),
              ]),
        ));
  }
}

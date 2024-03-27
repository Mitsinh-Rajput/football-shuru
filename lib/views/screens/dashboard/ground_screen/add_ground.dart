import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../services/theme.dart';
import '../../../base/image_picker_sheet.dart';

class AddGround extends StatefulWidget {
  const AddGround({super.key});

  @override
  State<AddGround> createState() => _AddGroundState();
}

class _AddGroundState extends State<AddGround> {
  TextEditingController pincodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  List<File> images = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              color: Colors.black,
              Assets.imagesArrowLeft,
              height: 24,
              width: 24,
            ),
          ),
        ),
        title: Text(
          "Add Ground",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: const Color(0xFF40424E)),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 1),
          child: Container(
            color: Colors.grey.shade200,
            height: 1,
            width: size.width,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Pincode';
                    } else if (value?.length != 6) {
                      return "Enter 6 Digit Pincode";
                    }
                    return null; // Return null if the value is valid
                  },
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(height: 24, width: 24, path: Assets.imagesPincode),
                    ),
                    floating: true,
                    label: "Enter pincode",
                    hint: "Ex. 4143905",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Name Of Ground';
                    } // Return null if the value is valid
                  },
                  controller: nameController,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(height: 24, width: 24, path: Assets.imagesNameofground),
                    ),
                    floating: true,
                    label: "Name of ground",
                    hint: "Ex. Taloja mallonium ground",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Ground Address';
                    } // Return null if the value is valid
                  },
                  controller: addressController,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(height: 24, width: 24, path: Assets.imagesAddress),
                    ),
                    floating: true,
                    label: "Ground address",
                    hint: "Ex. Vashi Sector 9a, Navi Mumbai - 400703 (Behind Father Agnel Basket Ball Court)",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Ground Description';
                    } // Return null if the value is valid
                  },
                  controller: descController,
                  maxLines: 3,
                  decoration: CustomDecoration.inputDecoration(
                    floating: true,
                    label: "Ground Description",
                    hintStyle: const TextStyle(fontSize: 14),
                    hint:
                        "Ex. Located in Navi Mumbai, Father Agnel Sports Complex is a distinguished sports club. Situated in Vashi Sector 9a, this establishment brings years of expertise to the realm of health, fitness, and sports, establishing itself as a trusted destination for individuals seeking a holistic approach to wellness.",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Google Map Location';
                    } // Return null if the value is valid
                  },
                  controller: locationController,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(height: 24, width: 24, path: Assets.imagesMap),
                    ),
                    floating: true,
                    label: "Google Map Location",
                    hint: "3XGV+QC9 Navi Mumbai, Maharashtra",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ground Images",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        if (images.isNotEmpty)
                          ...List.generate(images.length, (index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 0, right: 10, bottom: 25),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      images[index]!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: -15,
                                      right: 2,
                                      left: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          images.removeAt(index);
                                          setState(() {});
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                IconlyLight.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                        GestureDetector(
                          onTap: () async {
                            File? groundPic = await getImageBottomSheet(context);
                            if (groundPic != null) {
                              images.add(groundPic);
                            }
                            setState(() {});
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade300)),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImage(
                                      path: Assets.imagesAddimage,
                                      color: Colors.grey,
                                      height: 30,
                                      width: 30,
                                    ),
                                    SizedBox(height: 6),
                                    Text("Add Image")
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                // TextFormField(
                //   onTap: () {},
                //   enabled: false,
                //   decoration: CustomDecoration.inputDecoration(
                //     suffix: const Icon(color: Colors.red, Icons.disabled_by_default_outlined),
                //     icon: const Icon(Icons.image_outlined),
                //     floating: true,
                //     label: "Main Images",
                //     hint: "logo/image.png",
                //     hintStyle: const TextStyle(fontSize: 14),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<AuthController>(builder: (authController) {
        return Container(
          height: 80,
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
          child: CustomButton(
              isLoading: authController.isLoading,
              elevation: 0,
              radius: 50,
              color: const Color(0xFF263238),
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              onTap: () {
                if (_formKey.currentState!.validate() && images.isNotEmpty) {
                  authController
                      .storeGround(
                    pincode: pincodeController.text,
                    name: nameController.text,
                    address: addressController.text,
                    desc: descController.text,
                    location: locationController.text,
                    images: images,
                  )
                      .then((value) {
                    if (value.isSuccess) {
                      Navigator.pop(context);
                    }
                  });
                } else {
                  Fluttertoast.showToast(msg: "Above Field Empty", toastLength: Toast.LENGTH_LONG);
                }
              }),
        );
      }),
    );
  }
}

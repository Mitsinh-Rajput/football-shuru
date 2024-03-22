import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';

import '../../../services/route_helper.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {
      await Get.find<AuthController>().getgrounds().then((value) {
        filteredLocations = Get.find<AuthController>().grounds;
      });
    });
  }

  TextEditingController pincodeController = TextEditingController();
  List<Grounds> filteredLocations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<AuthController>().getgrounds();
        },
        child: GetBuilder<AuthController>(builder: (authController) {
          if (false || authController.isLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Get your place",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter the PIN code of the area in the field below and proceed further.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          decoration: BoxDecoration(color: const Color.fromRGBO(245, 245, 245, 1), borderRadius: BorderRadius.circular(50)),
                          child: TextField(
                            controller: pincodeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: textPrimary,
                                ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const CustomImage(
                                  height: 20,
                                  width: 20,
                                  path: Assets.imagesSearchNormal,
                                ),
                                hintText: "Search near pincode",
                                hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Image.asset(
                            Assets.imagesArrowRight,
                            color: Colors.white,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: filteredLocations.length, // Use filteredLocations length
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 244, 239, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: CustomImage(path: Assets.imagesGps),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "400080, Airoli",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 13,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      Text(
                                        "B-102, Sunshine Apartments, Veera Desai Road, Andheri West, Mumbai.",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  (false) ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
                                  size: 30,
                                  color: (false) ? Colors.green : Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Get your place",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter the PIN code of the area in the field below and proceed further.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w200,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          decoration: BoxDecoration(color: const Color.fromRGBO(245, 245, 245, 1), borderRadius: BorderRadius.circular(50)),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                // filteredLocations = locationlist.where((location) => location.title.toLowerCase().contains(value.toLowerCase())).toList();
                              });
                            },
                            controller: pincodeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: textPrimary,
                                ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const CustomImage(
                                  height: 20,
                                  width: 20,
                                  path: Assets.imagesSearchNormal,
                                ),
                                hintText: "Search near pincode",
                                hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: Image.asset(
                            Assets.imagesArrowRight,
                            color: Colors.white,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: filteredLocations.length, // Use filteredLocations length
                      itemBuilder: (context, index) {
                        final ground = filteredLocations[index];
                        return GestureDetector(
                          onTap: () {
                            authController.selectLocation(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 244, 239, 1),
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: CustomImage(path: Assets.imagesGps),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${ground.pincode ?? ""}, ${ground.title}",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 13,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      Text(
                                        ground.address ?? "",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  (ground.isSelected) ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
                                  size: 30,
                                  color: (ground.isSelected) ? Colors.green : Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        child: CustomButton(
            elevation: 0,
            radius: 10,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get Started",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const CustomImage(
                  color: Colors.white,
                  path: Assets.imagesArrowRight,
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                getCustomRoute(
                  child: const DashboardScreen(),
                ),
              );
            }),
      ),
    );
  }
}

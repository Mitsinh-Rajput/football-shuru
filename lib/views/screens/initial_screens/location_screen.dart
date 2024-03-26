import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:football_shuru/views/screens/dashboard/dashboard_screen.dart';
import 'package:football_shuru/views/screens/dashboard/ground_screen/add_ground.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/models/response/grounds_model.dart';
import '../../../services/route_helper.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController pincodeController = TextEditingController();
  List<Grounds> filteredGrounds = [];

  @override
  void initState() {
    super.initState();
    Timer.run(() async {
      await Get.find<AuthController>().getgrounds().then((value) {
        filteredGrounds = Get.find<AuthController>().grounds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        if (authController.isLoading) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter the PIN code of the area in the field below and proceed further.",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 10,
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
                          readOnly: true,
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
                    Container(
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: CustomShimmer(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 6, // Use filteredLocations length
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 16),
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
                                    Container(
                                      color: Colors.white,
                                      child: Text(
                                        "400703, Vashi Sports Complex",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 13,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Container(
                                      color: Colors.white,
                                      child: Text(
                                        "12A, Palm Residency, Sector 15, Vashi, Navi Mumbai.",
                                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.radio_button_unchecked_rounded,
                                  size: 24,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return RefreshIndicator(
            onRefresh: () async {
              await Get.find<AuthController>().getgrounds().then((value) {
                filteredGrounds = Get.find<AuthController>().grounds;
              });
            },
            child: Padding(
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
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Enter the PIN code of the area in the field below and proceed further.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 10,
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
                                filteredGrounds = authController.grounds.where((location) => location.pincode.toString().contains(value)).toList();
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
                      Container(
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
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: filteredGrounds.length, // Use filteredLocations length
                      itemBuilder: (context, index) {
                        final ground = filteredGrounds[index];
                        return GestureDetector(
                          onTap: () {
                            authController.selectLocation(ground.id);
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
                                  size: 24,
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
            ),
          );
        }
      }),
      extendBody: true,
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IgnorePointer(
            ignoring: true,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                  Colors.white.withOpacity(0.01),
                  Colors.white,
                  Colors.white,
                ]),
              ),
              height: size.height * 0.2,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  borderColor: Colors.black87,
                  type: ButtonType.secondary,
                  radius: 50,
                  onTap: () {
                    Navigator.push(context, getCustomRoute(child: AddGround()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black87,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add Ground",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.black87,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                IgnorePointer(
                  ignoring: false,
                  child: CustomButton(
                      elevation: 0,
                      radius: 50,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

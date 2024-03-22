<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
=======
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c
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
<<<<<<< HEAD
  TextEditingController pincodeController = TextEditingController();
  List<LocationList> locationlist = [
    LocationList(
      selected: false,
      title: "400001, CST Ground",
      subtitle: "25, Main Street, Fort, Mumbai. Close to CST Station, Fort",
    ),
    LocationList(
      selected: false,
      title: "400056, Veera Desai Playground",
      subtitle:
          "B-102, Sunshine Apartments, Veera Desai Road, Andheri West, Mumbai.",
    ),
    LocationList(
      selected: false,
      title: "400080, Airoli",
      subtitle:
          "B-102, Sunshine Apartments, Veera Desai Road, Andheri West, Mumbai.",
    ),
    LocationList(
      selected: false,
      title: "400703, Vashi Sports Complex",
      subtitle: "12A, Palm Residency, Sector 15, Vashi, Navi Mumbai.",
    ),
    LocationList(
      selected: false,
      title: "400614, Nerul Sports Arena",
      subtitle: "A-301, Sea Breeze Society, Sector 20, Nerul, Navi Mumbai.",
    ),
    LocationList(
      selected: false,
      title: "110001, Jawaharlal Nehru Stadium",
      subtitle: "Pragati Vihar, Lodhi Road, New Delhi, Delhi.",
    ),
    LocationList(
      selected: false,
      title: "560001, Sree Kanteerava Stadium",
      subtitle: "Kasturba Road, Sampangi Rama Nagar, Bengaluru, Karnataka.",
    ),
    LocationList(
      selected: false,
      title: "700001, Salt Lake Stadium",
      subtitle: "Salt Lake City, Bidhannagar, Kolkata, West Bengal.",
    ),
    LocationList(
      selected: false,
      title: "400001, Cooperage Football Stadium",
      subtitle: "Shahid Bhagat Singh Road, Colaba, Mumbai, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "682011, Jawaharlal Nehru Stadium",
      subtitle: "Palarivattom - Edappally Road, Palarivattom, Kochi, Kerala.",
    ),
    LocationList(
      selected: false,
      title: "500001, Gachibowli Athletic Stadium",
      subtitle:
          "Gate Number 9, Gate Number 10 Road, Gachibowli, Hyderabad, Telangana.",
    ),
    LocationList(
      selected: false,
      title: "751001, Kalinga Stadium",
      subtitle: "Bhubaneswar, Odisha.",
    ),
    LocationList(
      selected: false,
      title: "600018, SDAT Nehru Park",
      subtitle: "Ethiraj Salai, Kilpauk, Chennai, Tamil Nadu.",
    ),
    LocationList(
      selected: false,
      title: "600003, Jawaharlal Nehru Stadium",
      subtitle:
          "Sydenhams Road, Kannappar Thidal, Periyamet, Chennai, Tamil Nadu.",
    ),
    LocationList(
      selected: false,
      title: "700010, Mohammedan Sporting Ground",
      subtitle: "Colootola Street, Maidan, Kolkata, West Bengal.",
    ),
    LocationList(
      selected: false,
      title: "110025, Ambedkar Stadium",
      subtitle: "Bahadur Shah Zafar Marg, Delhi Gate, Delhi.",
    ),
    LocationList(
      selected: false,
      title: "682018, Rajiv Gandhi Indoor Stadium",
      subtitle: "Panampilly Nagar, Kochi, Kerala.",
    ),
    LocationList(
      selected: false,
      title: "411037, Shree Shiv Chhatrapati Sports Complex",
      subtitle: "Pirangut Road, Mhalunge Ingale, Pune, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "110008, Thyagaraj Sports Complex",
      subtitle: "Shri Ganganath Marg, INA Colony, New Delhi, Delhi.",
    ),
    LocationList(
      selected: false,
      title: "403001, Tilak Maidan Stadium",
      subtitle: "Vasco da Gama, South Goa, Goa.",
    ),
    LocationList(
      selected: false,
      title: "110001, Dr. Ambedkar Stadium",
      subtitle: "6, Delhi Gate, Asaf Ali Road, Delhi.",
    ),
    LocationList(
      selected: false,
      title: "560066, Bangalore Football Stadium",
      subtitle: "Shivajinagar, Bengaluru, Karnataka.",
    ),
    LocationList(
      selected: false,
      title: "682020, Chandrasekharan Nair Stadium",
      subtitle: "Cotton Hill, Vazhuthacaud, Thiruvananthapuram, Kerala.",
    ),
    LocationList(
      selected: false,
      title: "641018, Nehru Stadium",
      subtitle: "Race Course Road, Race Course, Coimbatore, Tamil Nadu.",
    ),
    LocationList(
      selected: false,
      title: "160022, Sector 17 Football Stadium",
      subtitle: "Sector 17, Chandigarh.",
    ),
    LocationList(
      selected: false,
      title: "400050, Police Ground",
      subtitle: "Aarey Milk Colony, Goregaon East, Mumbai, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "700075, Howrah Stadium",
      subtitle: "Howrah, West Bengal.",
    ),
    LocationList(
      selected: false,
      title: "500034, Lal Bahadur Shastri Stadium",
      subtitle: "Fateh Maidan Road, Basheer Bagh, Hyderabad, Telangana.",
    ),
    LocationList(
      selected: false,
      title: "560037, Bangalore Football Stadium",
      subtitle: "Shivajinagar, Bengaluru, Karnataka.",
    ),
    LocationList(
      selected: false,
      title: "500029, Gymkhana Ground",
      subtitle: "West Marredpally, Secunderabad, Telangana.",
    ),
    LocationList(
      selected: false,
      title: "700043, East Bengal Ground",
      subtitle:
          "Prince Gulam Mohammed Shah Road, Maidan, Kolkata, West Bengal.",
    ),
    LocationList(
      selected: false,
      title: "682020, Maharaja's College Ground",
      subtitle: "Park Avenue Road, Ernakulam North, Kochi, Kerala.",
    ),
    LocationList(
      selected: false,
      title: "400009, Azad Maidan",
      subtitle: "Shahid Bhagat Singh Road, Fort, Mumbai, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "110001, Ambedkar Stadium",
      subtitle: "Jawaharlal Nehru Marg, Delhi Gate, Delhi.",
    ),
    LocationList(
      selected: false,
      title: "400058, Andheri Sports Complex",
      subtitle: "Andheri West, Mumbai, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "411001, Balewadi Stadium",
      subtitle: "Balewadi High Street, Patil Nagar, Baner, Pune, Maharashtra.",
    ),
    LocationList(
      selected: false,
      title: "403001, Fatorda Stadium",
      subtitle: "Margao, South Goa, Goa.",
    ),
    LocationList(
      selected: false,
      title: "600001, Jawaharlal Nehru Stadium",
      subtitle: "Sydenhams Road, Periyamet, Chennai, Tamil Nadu.",
    ),
    LocationList(
      selected: false,
      title: "700029, Rabindra Sarobar Stadium",
      subtitle: "Southern Avenue, Deshapriya Park, Kolkata, West Bengal.",
    ),
  ];
  List<LocationList> filteredLocations = [];

=======
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c
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
<<<<<<< HEAD
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
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
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          filteredLocations = locationlist
                              .where((location) => location.title
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
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
=======
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
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c
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
<<<<<<< HEAD
                          hintText: "Search near pincode",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(fontWeight: FontWeight.w300)),
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
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
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
                itemCount:
                    filteredLocations.length, // Use filteredLocations length
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectLocation(index);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                                  filteredLocations[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 13,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                Text(
                                  filteredLocations[index].subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
=======
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
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c
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
<<<<<<< HEAD
                          const SizedBox(
                            width: 16,
                          ),
                          Icon(
                            (filteredLocations[index].selected)
                                ? Icons.check_circle_outline_rounded
                                : Icons.radio_button_unchecked_rounded,
                            size: 24,
                            color: (filteredLocations[index].selected)
                                ? Colors.green
                                : Colors.grey.shade200,
                          ),
                        ],
                      ),
=======
                        );
                      },
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c
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
      extendBody: true,
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IgnorePointer(
            ignoring: true,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.01),
                      Colors.white,
                      Colors.white,
                    ]),
              ),
              height: 200,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IgnorePointer(
                  ignoring: false,
                  child: CustomButton(
                      elevation: 0,
                      radius: 10,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get Started",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
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
<<<<<<< HEAD

class LocationList {
  String title;
  String subtitle;
  bool selected;

  LocationList(
      {required this.title, required this.subtitle, required this.selected});
}
=======
>>>>>>> 6b3e6e6bf56c3d7ac33d10e7b5e7dc97abe33e2c

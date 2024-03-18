import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/generated/assets.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<locationList> locationlist = [
    locationList(
      title: "400001, CST Ground",
      subtitle: "25, Main Street, Fort, Mumbai. Close to CST Station, Fort",
    ),
    locationList(
      title: "400056, Veera Desai Playground",
      subtitle:
          "B-102, Sunshine Apartments, Veera Desai Road, Andheri West, Mumbai.",
    ),
    locationList(
      title: "400080, Airoli",
      subtitle:
          "B-102, Sunshine Apartments, Veera Desai Road, Andheri West, Mumbai.",
    ),
    locationList(
      title: "400703, Vashi Sports Complex",
      subtitle: "12A, Palm Residency, Sector 15, Vashi, Navi Mumbai.",
    ),
    locationList(
      title: "400614, Nerul Sports Arena",
      subtitle: "A-301, Sea Breeze Society, Sector 20, Nerul, Navi Mumbai.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Get your place",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter the PIN code of the area in the field below and proceed further.",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(245, 245, 245, 1),
                            borderRadius: BorderRadius.circular(50)),
                        child: TextField(
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: textPrimary,
                                  ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const CustomImage(
                                height: 24,
                                width: 24,
                                path: Assets.imagesSearchNormal,
                              ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          Assets.imagesArrowRight,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: locationlist.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 244, 239, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CustomImage(path: Assets.imagesGps),
                            ),
                          ),
                          title: Text(locationlist[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700)),
                          subtitle: Text(locationlist[index].subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400)),
                          trailing: CustomImage(
                            path: Assets.imagesArrowRight,
                          ),
                        );
                      })),
                ),
              ],
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
                elevation: 0,
                radius: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to home",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomImage(
                        color: Colors.white, path: Assets.imagesArrowRight)
                  ],
                ),
                onTap: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     getCustomRoute(
                  //       child: const SignUpScreen(),
                  //     ),
                  //   );
                })
          ],
        ),
      ),
    );
  }
}

class locationList {
  String title;
  String subtitle;
  locationList({
    required this.title,
    required this.subtitle,
  });
}

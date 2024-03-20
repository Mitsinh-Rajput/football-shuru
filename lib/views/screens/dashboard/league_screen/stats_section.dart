
import 'package:flutter/material.dart';

import '../../../base/common_button.dart';
import '../../../base/custom_image.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List titles = [
    "Goals",
    "Assist",
    "Best Defenders",
    "Best Midfielders"
  ];
  int buttonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: titles.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomButton(
                      color: (buttonIndex==index)?const Color.fromRGBO(38, 50, 56, 1):Colors.white,
                      height: 30,
                      elevation: 0,
                      radius: 15,
                      type: (buttonIndex==index)?ButtonType.primary:ButtonType.secondary,
                      child: Text(
                        titles[index],
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12, color: (buttonIndex==index)?Colors.white:Colors.black),
                      ),
                      onTap: () {}),
                );
              }),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                return Container(
                  height: 90,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromRGBO(196, 196, 196, 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.2),
                                              offset: Offset(
                                                1.0,
                                                1.0,
                                              ),
                                              blurRadius: 1.0,
                                              spreadRadius: 1.0,
                                            )
                                          ],
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          )),
                                      child: const CustomImage(
                                          radius: 20,
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.fill,
                                          path:
                                          "https://s3-alpha-sig.figma.com/img/5209/3bd4/d799d9dcdef8bed39a1a5c13b8b1653c?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=awJSj4nF6CXJlSx9mV2rHmWG1jC1xpMvIkptuHN752P8Y68-qef73tshTt1JRxw30n5CeYD-gmXlZ3VVfxYcrCV3ZhInjcMQgWddzzC3LJLTZuPnpxwrvOQbDcmOF~fLaeGpJ1olJ0LXr9-6MlJpo7WHQKvEK7mOsHRnRX7Y242DgpvzdtGrev-tt~Q1s10PDnM0A3EByPRzRoh4ypN769S0zWq-ID0d3TDvlQ4xxmttGoqRNSoPL9oDrGBnDoN3gvSlEaZaWC18jsJO8FaYXRkmONNP1mhnMLkjSAviqb4oQeE2l7hxhmc9oOshK~avi3cI0Ab~qSyiEnwqHCJ1Cw__"),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      children: [
                                        Text(
                                          "Club Of Thane Center",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "Ralph Edwards",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                RichText(
                                  text:TextSpan(
                                      text: "Joined Date - ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "\n12 Feb 2024 / 10:12 AM",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                      ]
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

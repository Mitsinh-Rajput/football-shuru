
import 'package:flutter/material.dart';

import '../../../base/custom_image.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Participants Teams",style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(38, 50, 56, 1),
            ),),
            const SizedBox(
              height: 10,
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
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                  border: Border.all(
                                                    width: 2,
                                                    color: const Color.fromRGBO(
                                                        255, 145, 0, 1),
                                                  )),
                                              child: const CustomImage(
                                                  radius: 20,
                                                  height: 40,
                                                  width: 40,
                                                  fit: BoxFit.fill,
                                                  path:
                                                  "https://s3-alpha-sig.figma.com/img/4350/319e/ccd2879e061c826355e07a93a56087c5?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JISvq4ZHQLpf~~ponap2y~Uq-hqnAwnfl87oYIy4CuSDBH682Ey19MFaR9c9wLIz1DEnfGHfKE15ceYZstHTSh2be9KY2JuulOHADPPTRMLm5tCbfxqQrjyN5d2agIcu9PxufWHWhkxTXlJTQ-RaBmDjXCjt6f7Xyp6S8N9l5-e4Dhg7QMAgwlfzQdGS7FmVnfF3PcKnVEDK2s-fIDS-dOZ1UOzeJug5r9h84gOcILh2VOuMI6E0ScJ9NI7hDFLa47kc58-0mmNMQJ32bbKtiWGUCGUjrELZNO7Yr7HpAkVMF0S7ddAUcZo2k6q0mDKWw7W0pNWJ5RTt7hJC41HMoA__"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                height: 14,
                                                width: 14,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        255, 145, 0, 1),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20)),
                                                child: const Padding(
                                                  padding:
                                                  EdgeInsets.all(2.0),
                                                  child: CustomImage(
                                                      height: 8,
                                                      width: 8,
                                                      path:
                                                      "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OyeffN2kYlSmiVZpDr24eIsDH2uRwisZU2Ty-7ERVj0fK0zKEfA4Zi4JBGTiy8sSmX-lKKc~KBFmiIK8gg622QcH3NAQ5GJfdOv7LTVofihpMMN3y3ym0nDwMu4np37Bqx-baUFcPbRCKXbMFI-HJ0zV5vRJu1FqYISnPMh6u-QeN~62qj1TYHPm53iEVvPo1OA46COKzp9A9iCqhoL3A24FOmFqzbsK6H-8dXfExexPcglxwRbcPnEBVjpHjg12f8nBqJVphqQ~7p-5Z2yaecsSiYQzxZJZFEyVNYmHV8ztWc30XCSy1V3DHGWg5GjkYAtHjKrQE6Y0ph1sc5R0aA__"),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Text(
                                              "Team Ground king",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Club Of Thane \nCenter",
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

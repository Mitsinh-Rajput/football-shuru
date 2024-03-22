import 'package:flutter/material.dart';

import '../../../base/custom_image.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Participants Matches group’s",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(38, 50, 56, 1),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tournament: Group Match ${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              255, 145, 0, 1),
                                        ),
                                  ),
                                  Stack(
                                    children: [
                                      const CustomImage(
                                          height: 25,
                                          width: 65,
                                          path: Assets.imagesRectangle1292),
                                      Positioned(
                                          top: 4,
                                          left: 14,
                                          child: Text(
                                            "${index + 1}st Rank",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                  BorderRadius.circular(20)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
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
                                  Text(
                                    "V/s",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                              217, 217, 217, 1),
                                        ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "other Team",
                                        textAlign: TextAlign.end,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                      Text(
                                        "Club of madras \nKnights",
                                        textAlign: TextAlign.end,
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
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25),
                                            offset: Offset(
                                              1.0,
                                              1.0,
                                            ),
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        )),
                                    child: const CustomImage(
                                        radius: 20,
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.fill,
                                        path:
                                            "https://s3-alpha-sig.figma.com/img/6b01/624a/eb187485b81593c0df5c7f797f9f5679?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ac2Unx4RmUvMyPAafgQxLn24K~1zMtang9WFaxGdJQa79IPl7eJeCJhdwgcnDuM6BYc0LBrFmNhrIIWJi0~lES0zfNI1oNJe0FvCTpKrLvjwB6EZu~BqD3YC4L7bpCop9Q3fYBRKNFYTXBET2BnfHoY2ZvSM9tZ6bQDvzrCdtfOL5jrkDgx4ldZL87rRtdzm1rhO9XVFK0VEZFKypnMnEad6BEC8Th2sX~Fpbpt0ZgAwKNC3jzoCgNQO0lVBKzhicR38yhlHr1kA1EJL~wNbEzi1kbay6BhbOBz-No05OTI0EZ33MJsX2cVi-3DZ-~qz8sWNHNts2hZ7N7pVAwdBVg__"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 145, 0, 0.25),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Started date 10 feb 2024, 10 AM to 5 PM",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            const Color.fromRGBO(64, 66, 78, 1),
                                      ),
                                ),
                                Text(
                                  "Started at. 0:10:26",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            43, 63, 108, 1),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class KnockOutPage extends StatefulWidget {
  const KnockOutPage({super.key});

  @override
  State<KnockOutPage> createState() => _KnockOutPageState();
}

class _KnockOutPageState extends State<KnockOutPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomButton(
                    color: const Color.fromRGBO(38, 50, 56, 1),
                    height: 30,
                    elevation: 0,
                    radius: 15,
                    child: Text(
                      "Fixtures",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    onTap: () {}),
                const SizedBox(
                  width: 16,
                ),
                CustomButton(
                    height: 30,
                    elevation: 0,
                    radius: 15,
                    type: ButtonType.secondary,
                    child: Text(
                      "Result",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12,
                          ),
                    ),
                    onTap: () {})
              ],
            ),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                  title: Text(
                    "League round robin 1",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  children: [
                    SizedBox(
                      height: 510,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            3,
                        itemBuilder: (BuildContext context, int index) {

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
                                      Text(
                                        "Tournament: Group Match 1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(255, 145, 0, 1),
                                            ),
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
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.25),
                                                    offset: Offset(
                                                      1.0,
                                                      1.0,
                                                    ),
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                color:
                                                    const Color.fromRGBO(43, 63, 108, 1),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  "Semi-Final Match",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                children: [
                  SizedBox(
                    height: 350,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2, // Replace itemCount with your actual item count
                      itemBuilder: (BuildContext context, int index) {
                        // Replace this with your itemBuilder function
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
                                    Text(
                                      "Tournament: Group Match 1",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(255, 145, 0, 1),
                                          ),
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
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Started date 10 feb 2024, 10 AM to 5 PM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(64, 66, 78, 1),
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
                                              color: const Color.fromRGBO(43, 63, 108, 1),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  "Final Match",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: RDottedLineBorder.all(
                        color: const Color.fromRGBO(196, 196, 196, 1)
                      ),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const CustomImage(
                                    height: 46,
                                    width: 46,
                                    path:
                                        "https://s3-alpha-sig.figma.com/img/e71e/dd39/f0381e877f12d1bbe1f8e2dd60ad924a?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=DGc8vJkrvx56JBOhrtiDQLalObrufH5xu9wCpQi~WNHNK3WkFLsoxvjxh1gg4vXUHvAu2qGTqUTwtQ6hpO3KNpzMT3z3aU35ESe78daMj5iDslIWBCezzYkXYJyCVuj1brecpvVjBtktBQCJb4IRevGMJICF1w5Ut~fqCzTrNnVjJB-TRLwlVUk0CRYpokCc--VBvQ3OZj007mf1rEA8EUwrM6tmIodcPYle2o3rWl4hHx7JUJ5NOK2sp11k5ALdydgO8FX5EODnaIlZGUcxytutA7IflKuUaM-GvDklp4aYy~2jVyWG6sWqrImVtHl6KpSsFXDO-GCyFVtIm~-24g__",
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "TROPHY",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    const Color.fromRGBO(255, 200, 57, 1),
                                              ),
                                          children: [
                                        TextSpan(
                                          text: "\nfor leading the board",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        )
                                      ])),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Tournament winner team",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: primaryColor
                              ),),

                            ],
                          ),
                          Container(
                            width: 1,
                            decoration: BoxDecoration(
                              border: RDottedLineBorder(
                                  left: const BorderSide(
                                      color: Color.fromRGBO(196, 196, 196, 1)
                                  )),
                            ),
                          ),
                          Column(
                            children: [
                              const CustomImage(
                                  height: 40,
                                  width: 40,
                                  path: "https://s3-alpha-sig.figma.com/img/6af0/eace/c7c2c7e4383c4bd1ed042297ba2c7413?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GWktejRdgPCuYFkQJ8Jk-yOcgVcDeng4i4TZ9CdprZTFCDmjXGtSP~CobO0Zl02EUeFx3GXaMlhQl-YCz8wEkpiVnmhZMkNhz~mb3wGwK3A9Vf53hkNpuRsnm~1litm7cUkICq69KTdD7~cozULdvcreUQIFf7fJY-Z~W-QchTc8lMd2rzX4rdLgB1ksdIYl~yMDcOBA2uoytcyghR2NBizcgauYeA0gzPfexqpBnKXV5wAVpmwbz4WRaE9Tjrm-KJoi3cirfiS-pbWEJ6AkJiwybjtxjgB-iH5YvoYe1GSWcPtVAIh9Jt-bzAGpLbMgZVaWa0x4uWK756AkZUhb-A__"),
                            Text("Club of Thane \nCanter"
                              ,textAlign: TextAlign.center
                              ,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../services/theme.dart';

class NearGround extends StatefulWidget {
  const NearGround({super.key});

  @override
  State<NearGround> createState() => _NearGroundState();
}

class _NearGroundState extends State<NearGround> {
  bool isScroll = false;

  final ScrollController _scrollController = ScrollController();

  List carouselImages = [
    "https://s3-alpha-sig.figma.com/img/3b4f/4fed/548fb7ac6924256a535b3354183b482f?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nnL47N2PFLTT8liroPB55kWLTHd9hR5F4CCg68mq5galzkIvwso6aYhvDCrvx3-3-13yc3wEIkpZLZ1FmIAuDJfj01zdyluTEMbkS7jqPE7aGev1KtvdWaeJliTOJKYkPd1UtcfrYJtIZvW1FZ0M~eOoZX7V0wVaZwb-dGeP04ZvMiWLm7Ejn7UGKKeNm7vBu8-9bXFNrXJxvrYYMjN0JCSflYlx5z-SqrXB3e4dP7A3eW3BAobAq3ncl-V9tuCxOstLOkpFV3BF5mgt4ZPqWQuvx1PpjK8hR3~QxHdJayGVv2G3HRxGakMPs81~hY8fKlXHZt5~ireWzwhg8EJTNQ__",
    "https://s3-alpha-sig.figma.com/img/3b4f/4fed/548fb7ac6924256a535b3354183b482f?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nnL47N2PFLTT8liroPB55kWLTHd9hR5F4CCg68mq5galzkIvwso6aYhvDCrvx3-3-13yc3wEIkpZLZ1FmIAuDJfj01zdyluTEMbkS7jqPE7aGev1KtvdWaeJliTOJKYkPd1UtcfrYJtIZvW1FZ0M~eOoZX7V0wVaZwb-dGeP04ZvMiWLm7Ejn7UGKKeNm7vBu8-9bXFNrXJxvrYYMjN0JCSflYlx5z-SqrXB3e4dP7A3eW3BAobAq3ncl-V9tuCxOstLOkpFV3BF5mgt4ZPqWQuvx1PpjK8hR3~QxHdJayGVv2G3HRxGakMPs81~hY8fKlXHZt5~ireWzwhg8EJTNQ__",
    "https://s3-alpha-sig.figma.com/img/3b4f/4fed/548fb7ac6924256a535b3354183b482f?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nnL47N2PFLTT8liroPB55kWLTHd9hR5F4CCg68mq5galzkIvwso6aYhvDCrvx3-3-13yc3wEIkpZLZ1FmIAuDJfj01zdyluTEMbkS7jqPE7aGev1KtvdWaeJliTOJKYkPd1UtcfrYJtIZvW1FZ0M~eOoZX7V0wVaZwb-dGeP04ZvMiWLm7Ejn7UGKKeNm7vBu8-9bXFNrXJxvrYYMjN0JCSflYlx5z-SqrXB3e4dP7A3eW3BAobAq3ncl-V9tuCxOstLOkpFV3BF5mgt4ZPqWQuvx1PpjK8hR3~QxHdJayGVv2G3HRxGakMPs81~hY8fKlXHZt5~ireWzwhg8EJTNQ__"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.run(() async {});
    _scrollController.addListener(() {
      if (_scrollController.offset > 20 && !isScroll) {
        setState(() {
          isScroll = true;
        });
      } else if (_scrollController.offset <= 20 && isScroll) {
        setState(() {
          isScroll = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isScroll ? Colors.white : Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
              color: isScroll ? Colors.black : Colors.white,
              Assets.imagesArrowLeft,
              height: 24,
              width: 24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CustomImage(color: isScroll ? Colors.black : Colors.white, height: 24, width: 24, path: Assets.imagesShareapp),
          )
        ],
        title: Text(
          "Near Ground",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isScroll ? Colors.black : Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
              ),
              items: carouselImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CustomImage(
                      fit: BoxFit.fitHeight,
                      path: i,
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Football Prime Cup 2024",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "400614, Nerul Sports Arena, A-301, Sea Breeze Society, Sector 20, Nerul, Navi Mumbai.",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "45K Members",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, color: const Color.fromRGBO(255, 145, 0, 1), fontWeight: FontWeight.w400),
                      ),
                      CustomButton(
                          height: 35,
                          elevation: 0,
                          radius: 0,
                          child: Text(
                            "Join Now",
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                          onTap: () {})
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Ground King",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color.fromRGBO(196, 196, 196, 1)),
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
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w600,
                                                color: const Color.fromRGBO(255, 200, 57, 1),
                                              ),
                                          children: [
                                        TextSpan(
                                          text: "\nfor leading the board",
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
                              Text(
                                "Tournament winner team",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: primaryColor),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            decoration: BoxDecoration(
                              border: RDottedLineBorder(left: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1))),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all(color: const Color.fromRGBO(255, 200, 57, 1), width: 2), borderRadius: BorderRadius.circular(20)),
                                child: const CustomImage(
                                    radius: 20,
                                    height: 35,
                                    width: 35,
                                    path:
                                        "https://s3-alpha-sig.figma.com/img/6b01/624a/eb187485b81593c0df5c7f797f9f5679?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ac2Unx4RmUvMyPAafgQxLn24K~1zMtang9WFaxGdJQa79IPl7eJeCJhdwgcnDuM6BYc0LBrFmNhrIIWJi0~lES0zfNI1oNJe0FvCTpKrLvjwB6EZu~BqD3YC4L7bpCop9Q3fYBRKNFYTXBET2BnfHoY2ZvSM9tZ6bQDvzrCdtfOL5jrkDgx4ldZL87rRtdzm1rhO9XVFK0VEZFKypnMnEad6BEC8Th2sX~Fpbpt0ZgAwKNC3jzoCgNQO0lVBKzhicR38yhlHr1kA1EJL~wNbEzi1kbay6BhbOBz-No05OTI0EZ33MJsX2cVi-3DZ-~qz8sWNHNts2hZ7N7pVAwdBVg__"),
                              ),
                              Text(
                                "Club of Madras \nKnights",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              size: 22,
              color: Color.fromRGBO(2, 191, 77, 1),
            ),
            Text(
              "Join a group",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

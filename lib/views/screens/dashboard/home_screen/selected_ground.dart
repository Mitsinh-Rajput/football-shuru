import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/tournament_chat_screen/tournament_chat_screen.dart';
import 'package:get/get.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../services/theme.dart';

class SelectedNearGround extends StatefulWidget {
  final Grounds selectedGround;

  const SelectedNearGround({super.key, required this.selectedGround});

  @override
  State<SelectedNearGround> createState() => _SelectedNearGroundState();
}

class _SelectedNearGroundState extends State<SelectedNearGround> {
  bool isScroll = false;

  final ScrollController _scrollController = ScrollController();

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

  int _currentPage = 0;

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
        // title: Text(
        //   "${widget.selectedGround.title ?? ""}",
        //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
        //         fontSize: 20,
        //         fontWeight: FontWeight.w700,
        //         color: isScroll ? Colors.black : Colors.white,
        //       ),
        // ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  onPageChanged: (int index, reason) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  height: 400.0,
                  viewportFraction: 1.0,
                  scrollPhysics: widget.selectedGround.images.length == 1 ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics()),
              items: widget.selectedGround.images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CustomImage(
                      fit: BoxFit.fill,
                      path: i,
                    );
                  },
                );
              }).toList(),
            ),
            if (widget.selectedGround.images.length.isGreaterThan(1))
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < widget.selectedGround.images.length; i++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          height: _currentPage == i ? 12 : 8,
                          width: _currentPage == i ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == i ? Colors.grey.shade800 : Colors.grey.shade200,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.selectedGround.title ?? "",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.selectedGround.address ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.selectedGround?.userCount ?? "1"} Members",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, color: const Color.fromRGBO(255, 145, 0, 1), fontWeight: FontWeight.w400),
                      ),
                      if (widget.selectedGround.hasUser == null)
                        GetBuilder<HomePageController>(builder: (homePageController) {
                          return CustomButton(
                              isLoading: homePageController.isLoading,
                              height: 35,
                              elevation: 0,
                              radius: 0,
                              child: Text(
                                "Join Now",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              onTap: () {
                                homePageController.joinGround(groundId: widget.selectedGround.id!).then((value) {
                                  if (value.isSuccess) {
                                    Navigator.pushReplacement(
                                        context,
                                        getCustomRoute(
                                            child: SelectGroundChatScreen(
                                          groundId: widget.selectedGround.id!,
                                        )));
                                  } else {
                                    Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
                                  }
                                });
                              });
                        })
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
                    widget.selectedGround.description ?? "",
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
                                  CustomImage(
                                    height: 46,
                                    width: 46,
                                    path: Assets.imagesAward1,
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
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomePageController>(builder: (homePageController) {
        if (widget.selectedGround.hasUser == null) {
          return const SizedBox.shrink();
          // return Container(
          //   height: 80,
          //   padding: EdgeInsets.all(15),
          //   child: CustomButton(
          //     isLoading: homePageController.isLoading,
          //     onTap: () {
          //       homePageController.joinGround(groundId: widget.selectedGround.id!).then((value) {
          //         if (value.isSuccess) {
          //         } else {
          //           Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
          //         }
          //       });
          //     },
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         const Icon(
          //           Icons.add,
          //           size: 22,
          //           color: Colors.white,
          //         ),
          //         const SizedBox(width: 15),
          //         Text(
          //           "Join a group",
          //           style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          //         )
          //       ],
          //     ),
          //   ),
          // );
        } else {
          return Container(
            height: 80,
            padding: const EdgeInsets.all(15),
            child: CustomButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    getCustomRoute(
                        child: SelectGroundChatScreen(
                      selectedGround: widget.selectedGround,
                      groundId: widget.selectedGround.id!,
                    )));
              },
              title: "View Group",
            ),
          );
        }
      }),
    );
  }
}

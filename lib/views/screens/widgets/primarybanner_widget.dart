import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/theme.dart';
import '../../../controllers/homepage_controller.dart';
import '../../base/custom_image.dart';
import '../../base/shimmer.dart';

class PrimaryBannerWidget extends StatefulWidget {
  const PrimaryBannerWidget({super.key});

  @override
  State<PrimaryBannerWidget> createState() => _PrimaryBannerWidgetState();
}

class _PrimaryBannerWidgetState extends State<PrimaryBannerWidget> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomePageController>(builder: (homePageController) {
      if (homePageController.isLoading && homePageController.slider.isEmpty) {
        return CustomShimmer(
          child: Container(
            height: 160,
            color: primaryColor,
          ),
        );
      } else if (homePageController.isLoading && homePageController.slider.isEmpty) {
        return Container(
          color: primaryColor,
          height: 90,
        );
      }
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                height: 160,
                viewportFraction: 1.0,
                onPageChanged: (int index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: homePageController.slider.map((path) {
                return Stack(
                  children: [
                    CustomImage(
                      radius: 10,
                      path: path.image ?? "",
                      fit: BoxFit.fill,
                      height: 160,
                      width: size.width,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          if (homePageController.slider.length.isGreaterThan(1))
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < homePageController.slider.length; i++)
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
            )
        ],
      );
    });
  }
}

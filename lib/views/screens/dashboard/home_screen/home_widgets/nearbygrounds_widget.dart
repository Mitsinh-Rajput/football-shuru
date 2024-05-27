import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/views/base/shimmer.dart';
import 'package:football_shuru/views/screens/initial_screens/location_screen.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../services/route_helper.dart';
import '../../../../base/custom_image.dart';
import '../selected_ground.dart';

class NearbyGrounds extends StatefulWidget {
  const NearbyGrounds({super.key});

  @override
  State<NearbyGrounds> createState() => _NearbyGroundsState();
}

class _NearbyGroundsState extends State<NearbyGrounds> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      if (authController.isLoading && authController.grounds.isEmpty) {
        return CustomShimmer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Nearby ground’s",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Add Ground",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 11 / 0.1,
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Color(0xffD6F5E3),
                                shape: BoxShape.circle),
                            child: const CustomImage(
                              height: 50,
                              width: 50,
                              radius: 50,
                              path:
                                  "https://5.imimg.com/data5/SELLER/Default/2021/3/TU/VP/FT/125148535/cricket-ground-development-500x500.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Sector 23, plot 1",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      } else if (!authController.isLoading && authController.grounds.isEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Nearby ground’s",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                      ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      getCustomRoute(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 600),
                        child: const LocationScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Add Ground",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  Assets.imagesArrowRight,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 11 / 0.1,
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: authController.grounds.length,
              itemBuilder: (context, index) {
                final ground = authController.grounds[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      getCustomRoute(
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 600),
                        child: SelectedNearGround(
                          selectedGround: ground,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Color(0xffD6F5E3), shape: BoxShape.circle),
                          child: CustomImage(
                            height: 60,
                            width: 60,
                            radius: 50,
                            path: ground.images.isNotEmpty
                                ? ground.images[0]
                                : "https://5.imimg.com/data5/SELLER/Default/2021/3/TU/VP/FT/125148535/cricket-ground-development-500x500.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${ground.pincode ?? ""}, ${ground.title ?? ""}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
    });
  }
}

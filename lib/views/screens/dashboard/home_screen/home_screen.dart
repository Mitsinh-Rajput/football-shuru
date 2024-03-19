import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/community_near_me.dart';
import 'package:football_shuru/views/screens/dashboard/home_screen/league_and_tour_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            Assets.imagesMenu,
            height: 24,
            width: 24,
          ),
        ),
        title: RichText(
          text: TextSpan(
              text: "Football ",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: textPrimary,
                  ),
              children: [
                TextSpan(
                  text: "Shuru",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: textPrimary,
                      ),
                ),
              ]),
        ),
        actions: [
          Image.asset(
            Assets.imagesSearch,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 26,
          ),
          Image.asset(
            Assets.imagesNotification,
            height: 22,
            width: 22,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(size.width, 30),
            child: Container(
              height: 30,
              color: const Color(0xffFFF4EF),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Maharashtra, Thane, 414304",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: const Color(0xffFF9A6C),
                          ),
                    ),
                  ),
                  Text(
                    "Change Now",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ],
              ),
            )),
        //
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            // banner
            SizedBox(
              height: 160,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomImage(
                      radius: 10,
                      path:
                          "https://www.shutterstock.com/shutterstock/photos/1035807373/display_1500/stock-vector--world-championship-football-cup-flag-and-stadium-background-soccer-scoreboard-match-vs-1035807373.jpg",
                      width: size.width,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i == 0 ? Colors.grey.shade800 : Colors.grey.shade200,
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //! Community ground --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Ground community near me",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                          ),
                    ),
                  ),
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
            SizedBox(
              height: 150,
              width: size.width,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                    child: const CommunityNearMe(),
                  );
                },
              ),
            ),
            //
            const SizedBox(
              height: 30,
            ),
            //! Nearby ground --
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
                  Container(
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
                  mainAxisExtent: 10 / 0.1,
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Color(0xffD6F5E3), shape: BoxShape.circle),
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
            //! Nearby ground --
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "League’s / Tournament",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
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
                          "Add League",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const LeagueAndTourTile();
                },
              ),
            ),
            // bottom
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/services/route_helper.dart';
import 'package:football_shuru/views/screens/dashboard/teams_screen/join_team.dart';
import 'package:page_transition/page_transition.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../generated/assets.dart';
import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class MyTeamsScreen extends StatefulWidget {
  const MyTeamsScreen({super.key});

  @override
  State<MyTeamsScreen> createState() => _MyTeamsScreenState();
}

class _MyTeamsScreenState extends State<MyTeamsScreen> {
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
        centerTitle: true,
        title: Text(
          "My Teams",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: textPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 1),
          child: Container(
            color: Colors.grey.shade200,
            height: 1,
            width: size.width,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: RDottedLineBorder.all(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Create new team",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          getCustomRoute(
                            type: PageTransitionType.topToBottom,
                            child: const JoinTeamScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: RDottedLineBorder.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.green[700],
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Join Team",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.green[700],
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "My List of Teams",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(
                width: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        const CustomImage(
                          radius: 50,
                          path:
                              "https://content.jdmagicbox.com/comp/mumbai/p8/022pxx22.xx22.220811180605.h5p8/catalogue/enc-sports-turf-jk-gram-thane-west-mumbai-yhq2pyqds4.jpg?clr=145229",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Team Ground king 1".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Club Of Thane Center",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: textPrimary,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "Joined Date -\n",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: textPrimary,
                                              fontWeight: FontWeight.w900,
                                            ),
                                        children: [
                                          TextSpan(
                                            text: "12Feb2024/10:12AM",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color: textPrimary,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

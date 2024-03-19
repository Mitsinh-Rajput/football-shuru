import 'package:flutter/material.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../services/theme.dart';
import '../../../base/common_button.dart';

class SearchAndJoinedDialogue {
  dialogue(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      builder: (context) {
        return const SearchAndJoinTeam();
      },
    );
  }
}

class SearchAndJoinTeam extends StatefulWidget {
  const SearchAndJoinTeam({super.key});

  @override
  State<SearchAndJoinTeam> createState() => _SearchAndJoinTeamState();
}

class _SearchAndJoinTeamState extends State<SearchAndJoinTeam> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.cancel_outlined,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                "Join Team",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, top: 16),
            color: Colors.grey.shade200,
            height: 1,
            width: size.width,
          ),
          TextFormField(
            decoration: CustomDecoration.inputDecoration(
              floating: true,
              label: "Join team code",
              hint: "search Winn will",
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade300,
                  ),
              icon: const Icon(
                Icons.group_outlined,
                size: 24,
                color: Colors.black87,
              ),
              suffix: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  Assets.imagesSearch,
                  height: 22,
                  width: 22,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Search result",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: RDottedLineBorder.all(
                color: Colors.grey.shade300,
                width: 1,
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
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
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
          ),
          const SizedBox(
            height: 24,
          ),
          CustomButton(
            // title: "Sign Up Now",
            color: textPrimary,
            fontSize: 14,
            elevation: 0,
            radius: 10,
            height: 50,
            onTap: () {
              // Navigator.pushReplacement(
              //   context,
              //   getCustomRoute(
              //     child: const LocationScreen(),
              //   ),
              // );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Join Team",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  Assets.imagesArrowRight,
                  height: 24,
                  width: 24,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class MyGroundTile extends StatefulWidget {
  const MyGroundTile({super.key});

  @override
  State<MyGroundTile> createState() => _MyGroundTileState();
}

class _MyGroundTileState extends State<MyGroundTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomImage(
            radius: 6,
            path:
                "https://www.playall.in/images/gallery/faridabad_futsal_3.png",
            height: 100,
            width: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Cooperage Football Ground",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 14,
                              color: textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Football Ground • Poin king  club for",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.green[600],
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temaliqua.",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people_outline_rounded,
                      size: 24,
                      color: textPrimary,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "5,00 member",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

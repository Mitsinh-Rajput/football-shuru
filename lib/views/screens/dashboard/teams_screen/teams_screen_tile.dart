import 'package:flutter/material.dart';

import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class TeamsScreenTile extends StatefulWidget {
  const TeamsScreenTile({super.key});

  @override
  State<TeamsScreenTile> createState() => _TeamsScreenTileState();
}

class _TeamsScreenTileState extends State<TeamsScreenTile> {
  @override
  Widget build(BuildContext context) {
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
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: textPrimary,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Joined Date -\n",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
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
  }
}

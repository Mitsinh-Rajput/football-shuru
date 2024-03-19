import 'package:flutter/material.dart';

import '../../../../services/theme.dart';
import '../../../base/custom_image.dart';

class MyChatTile extends StatefulWidget {
  const MyChatTile({super.key});

  @override
  State<MyChatTile> createState() => _MyChatTileState();
}

class _MyChatTileState extends State<MyChatTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 6,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cooperage Football Ground",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temaliqua.",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: textPrimary,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "12 Team •  48k members".toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: const Color(0xffFF9100),
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "12:21 PM",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "6",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

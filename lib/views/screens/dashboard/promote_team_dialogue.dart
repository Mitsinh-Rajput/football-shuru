import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/data/models/response/joinedteam_model.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../services/theme.dart';
import '../../base/common_button.dart';

class PromoteTeamDialogue {
  dialogue(context, JoinedTeam selectedTeam) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      context: context,
      builder: (context) {
        return PromoteTeam(
          selectedTeam: selectedTeam,
        );
      },
    );
  }
}

class PromoteTeam extends StatefulWidget {
  final JoinedTeam selectedTeam;
  const PromoteTeam({super.key, required this.selectedTeam});

  @override
  State<PromoteTeam> createState() => _PromoteTeamState();
}

class _PromoteTeamState extends State<PromoteTeam> {
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
                "Share Team",
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
          Text(
            "Select team",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color.fromRGBO(196, 196, 196, 1))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 2,
                                          color: const Color.fromRGBO(255, 145, 0, 1),
                                        )),
                                    child: CustomImage(radius: 20, height: 40, width: 40, fit: BoxFit.fill, path: widget.selectedTeam?.team?.logo ?? ""),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(color: const Color.fromRGBO(255, 145, 0, 1), borderRadius: BorderRadius.circular(20)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: CustomImage(
                                            height: 8,
                                            width: 8,
                                            path:
                                                "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OyeffN2kYlSmiVZpDr24eIsDH2uRwisZU2Ty-7ERVj0fK0zKEfA4Zi4JBGTiy8sSmX-lKKc~KBFmiIK8gg622QcH3NAQ5GJfdOv7LTVofihpMMN3y3ym0nDwMu4np37Bqx-baUFcPbRCKXbMFI-HJ0zV5vRJu1FqYISnPMh6u-QeN~62qj1TYHPm53iEVvPo1OA46COKzp9A9iCqhoL3A24FOmFqzbsK6H-8dXfExexPcglxwRbcPnEBVjpHjg12f8nBqJVphqQ~7p-5Z2yaecsSiYQzxZJZFEyVNYmHV8ztWc30XCSy1V3DHGWg5GjkYAtHjKrQE6Y0ph1sc5R0aA__"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  // Text(
                                  //   "Team Ground king",
                                  //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  //         fontSize: 8,
                                  //         fontWeight: FontWeight.w400,
                                  //       ),
                                  // ),
                                  Text(
                                    widget.selectedTeam?.team?.name ?? "",
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(text: "Created At - ", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w600), children: [
                              TextSpan(
                                text: "\n${widget.selectedTeam?.createdAt!.dateTime}",
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                              ),
                            ]),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Team join code",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomImage(height: 24, width: 24, path: Assets.imagesBarcode),
                Text(
                  "${widget.selectedTeam?.team?.code ?? ""}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 26, fontWeight: FontWeight.w700, letterSpacing: 3, color: const Color(0xFF40424E).withOpacity(0.8)),
                ),
                GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                        text: '${widget.selectedTeam?.team?.code ?? ""}',
                      )).then((value) {
                        Fluttertoast.showToast(msg: "Text Copied");
                      });
                    },
                    child: CustomImage(height: 24, width: 24, path: Assets.imagesCopy)),
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
              Share.share("${widget.selectedTeam.team?.code ?? ""}");
            },
            child: Text(
              "Share Team",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
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

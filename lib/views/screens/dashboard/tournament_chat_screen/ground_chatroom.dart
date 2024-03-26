import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:iconly/iconly.dart';

import '../../../../services/theme.dart';

class GroundChatroom extends StatefulWidget {
  const GroundChatroom({super.key});

  @override
  State<GroundChatroom> createState() => _GroundChatroomState();
}

class _GroundChatroomState extends State<GroundChatroom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Text(
            "February 28",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 80,
                          width: 260,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFF4EF),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CustomImage(
                                            radius: 50,
                                            height: 20,
                                            width: 20,
                                            path:
                                                "https://s3-alpha-sig.figma.com/img/22aa/3b45/6260f5c114826d26f0063851b8322353?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E2YwVBx0h8d6gL-rVVwFAvh8wqP1lSAzWtpn2W-ud-IHnBWdn4DMUJMqXKy3tZW6uhumvNWCPlQPp9S-iUMdEMSj-xjtG170bSUwg96m6EhsIvZZ9A5ESl5a7BpgKhH9~v6ii1nH-R19mnNy3Oi7NUKmyi1UQNLLTopJhPglYI4MaMvu77z2P9mmf1cupb8cJZW1mAnGra1NAcGhwjFTvXP0piO~ziaqFkm5Re9O2qs6f9oSudITOdL75sJ8NDtDiBoiUJmP5kEcjx~F5igcTkBcf-YuJUVLJVWPn4qfAYcp0w6yeQcEeB6Evpa8jqg40LRlrFXwPheRJaRuICEvxw__"),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Guy Hawkins",
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10:12 AM",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Text(
                                  "Kal hum sab log milke team meet kar lete hai or best player select kar lete hai",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 80,
                          width: 260,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CustomImage(
                                            radius: 50,
                                            height: 20,
                                            width: 20,
                                            path:
                                                "https://s3-alpha-sig.figma.com/img/22aa/3b45/6260f5c114826d26f0063851b8322353?Expires=1711929600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E2YwVBx0h8d6gL-rVVwFAvh8wqP1lSAzWtpn2W-ud-IHnBWdn4DMUJMqXKy3tZW6uhumvNWCPlQPp9S-iUMdEMSj-xjtG170bSUwg96m6EhsIvZZ9A5ESl5a7BpgKhH9~v6ii1nH-R19mnNy3Oi7NUKmyi1UQNLLTopJhPglYI4MaMvu77z2P9mmf1cupb8cJZW1mAnGra1NAcGhwjFTvXP0piO~ziaqFkm5Re9O2qs6f9oSudITOdL75sJ8NDtDiBoiUJmP5kEcjx~F5igcTkBcf-YuJUVLJVWPn4qfAYcp0w6yeQcEeB6Evpa8jqg40LRlrFXwPheRJaRuICEvxw__"),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Guy Hawkins",
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "10:12 AM",
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                Text(
                                  "Kal hum sab log milke team meet kar lete hai or best player select kar lete hai",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(50)),
                  child: TextField(
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          letterSpacing: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textPrimary,
                        ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(IconlyLight.chat),
                        hintText: "Type message....",
                        hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
                child: const CustomImage(
                  path: Assets.imagesArrowRight,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

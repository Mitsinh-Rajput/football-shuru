import 'package:flutter/material.dart';
import 'package:football_shuru/views/base/custom_image.dart';

class CommunityNearMe extends StatefulWidget {
  const CommunityNearMe({
    super.key,
  });

  @override
  State<CommunityNearMe> createState() => _CommunityNearMeState();
}

class _CommunityNearMeState extends State<CommunityNearMe> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(12),
      height: 140,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade200,
          )),
      child: Column(
        children: [
          Row(
            children: [
              const CustomImage(
                radius: 40,
                path: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/football-design-template-bfb989731fb80ee4ce47f503a041888e_screen.jpg?ts=1650102760",
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Club of Madras Knights",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: RichText(
              maxLines: 3,
              text: TextSpan(
                  text: "Address & more : ",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                  children: [
                    TextSpan(
                      text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ]),
            ),
          ),
          //
          const Spacer(),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Follow • 5.6 K",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              //
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "23K Members",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

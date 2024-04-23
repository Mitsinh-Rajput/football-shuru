
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../controllers/firebase_controller.dart';
import '../../../../services/theme.dart';

class SetWinnerScreen extends StatefulWidget {
  const SetWinnerScreen({super.key});

  @override
  State<SetWinnerScreen> createState() => _SetWinnerScreenState();
}

class _SetWinnerScreenState extends State<SetWinnerScreen> {
  TextEditingController teamAGoalCount = TextEditingController(text: "0");
  TextEditingController teamBGoalCount = TextEditingController(text: "0");
  bool isSelected = false;

  List<RadioModel> RadioList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RadioList.add(RadioModel(false, "Club Of Thane Center", "https://www.figma.com/file/hDnAHWbUCiICgjBcJxlret/image/4350319eccd2879e061c826355e07a93a56087c5", "Team A"));
    RadioList.add(RadioModel(
        false,
        "Aldenaire Football Club",
        "https://s3-alpha-sig.figma.com/img/a7be/b21b/092514b75eb660c46621ca591b852b78?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=I48LGPPkFeWrOOL30WC2P4MCWngksrFtNNd4SM~gCg0uYgJ~3VLXLuI7Lv4DB3qg11DqhY4gqBmQNMLqFp9Sj7DztsA95DDoiauqXvF2oYBseG1xJDfPo8wtEdNKa0LnrpfU~a9yKyyehzybdAh-v6TXtUCnulUep9VydZY7CZ4acw25ZU6iWmdT8NwYEQ~oySU1~y2N5ttaQaRmDvkjrZo1TWc1H5VJ27kuCZJIl8UyAQEpifz3yH0zAkHIgtXzhO2mYt9QsbNsL97BiJfs3vQCmnkUgKrxK4s9LwqEN6C2NTB5q-7RjOgpQ~aELM7MeeTxuUD6VyuUmEixbO7~fg__",
        "Team B"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(
                    path: Assets.imagesDribbble,
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Champions League",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF40424E)),
                  ),
                ],
              ),
              Center(
                child: Text(
                  "Thursday, 5 April • Ground king champion first leg",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Who is the winner?",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF40424E)),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: RadioList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      setState(() {
                        RadioList.forEach((element) => element.isSelected = false);
                        RadioList[index].isSelected = true;
                      });
                    },
                    child: RadioItem(item: RadioList[index]),
                  );
                },
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const SizedBox(
              //   height: 50,
              // ),
              // Container(
              //   height: 80,
              //   padding: const EdgeInsets.all(14),
              //   decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE0E0E0)), borderRadius: BorderRadius.circular(6)),
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 10,
              //         width: 10,
              //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFE0E0E0)),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Stack(
              //         children: [
              //           Container(
              //             height: 40,
              //             width: 40,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 border: Border.all(
              //                   color: const Color(0xFFE0E0E0),
              //                   width: 2,
              //                 )),
              //             child: const CustomImage(
              //               path: "https://www.figma.com/file/hDnAHWbUCiICgjBcJxlret/image/4350319eccd2879e061c826355e07a93a56087c5",
              //               radius: 20,
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Team A",
              //             textAlign: TextAlign.start,
              //             style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
              //           ),
              //           Text(
              //             "Club Of Thane Center",
              //             style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: const Color(0xFF40424E)),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ClipPath(
              //     // clipper: WinnerClipper(),
              //     child: Container(
              //       height: 20,
              //       width: 100,
              //       decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
              //       child: Center(
              //         child: Text(
              //           "Winner Team",
              //           style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white, fontSize: 10),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Please enter the score of match",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 40,
                        child: TextField(
                          controller: teamAGoalCount,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                // letterSpacing: 2,
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: textPrimary,
                              ),
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Text(
                        "Club Of Thane \nCenter",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Text(
                    "-",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 80, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 40,
                        child: TextField(
                          controller: teamBGoalCount,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                // letterSpacing: 2,
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: textPrimary,
                              ),
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      Text(
                        "Aldenaire Football \nClub",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: const CustomImage(
                          radius: 20,
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                          path:
                              'https://s3-alpha-sig.figma.com/img/4350/319e/ccd2879e061c826355e07a93a56087c5?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hx0hUVFMhdpDqB2t3YKqldWhgGhr0sFUaGnqy0zkGok-n-FNr87S8gCVVyUvbGXE5v7vao-m1e5PmxHnfHo9ThdBwUKoUtn2nDsm8DU2chsbWgNIgDIRiMrS0kbQ0NSJaDEfkpGTsong66aLKNtyiIA10c~IYWFexoPtvNa2c1WCmnK34tA1UwZvq-cG74Ed5xMOKV8uEWVRIPlgbUYMN0JVJuipzhK94kY04I3bI0--EAMagOr-Kps-oeDDrUFCRv2p5dFi9WiB6am2Bzc4wlZfxeCPU6yLt0Fqgtb~E6tsjT2QR-1M0JiQ0vUtR0~AkUvCvcRA9oC4h~zPFENU5g__'),
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
                                  "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KtgSPjADbFef0XclcRL4-HfqDdzt0Peoi~9I2iBlSq-deQeJtZb6RcisiIdvgKaOnTNXKo5x8wMEzgUWFAe4YTh2omCmwJH6x1HqTsCaouEZbEP1VWSb1d14gjiz1zMpVlmdFqCXvKodrACJAffKBKmUumRbXItn5W2jTw4dX-6tBk6b4-CskgkBKl-dZImpgJ0B1MnUgYYp8X0H7kTJeE9Gmrx9ofHkLHarlbeApCnvwVa-QqKK2JajNJlrsJLBN1zZEUwC2t70GmqpD-Mbb3MnPtL4tugqrCCrMELmOGjVp2phbwhNZ6YB7YHOsbWpjoQ8FPIowv64esDaKaUGJQ__"),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Team A",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 8,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Text(
                      "Club Of Thane \nCenter",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                Text(
                  "Vs",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                ),
                Column(
                  children: [
                    Text(
                      "Team B",
                      // textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8, fontWeight: FontWeight.w400, color: const Color(0xFFA5A5A5)),
                    ),
                    Text(
                      "Aldenaire \nFootball Club",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w700, color: const Color(0xFFA5A5A5)),
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      )),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        )),
                    child: const CustomImage(
                        radius: 20,
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                        path:
                            'https://s3-alpha-sig.figma.com/img/4350/319e/ccd2879e061c826355e07a93a56087c5?Expires=1714953600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hx0hUVFMhdpDqB2t3YKqldWhgGhr0sFUaGnqy0zkGok-n-FNr87S8gCVVyUvbGXE5v7vao-m1e5PmxHnfHo9ThdBwUKoUtn2nDsm8DU2chsbWgNIgDIRiMrS0kbQ0NSJaDEfkpGTsong66aLKNtyiIA10c~IYWFexoPtvNa2c1WCmnK34tA1UwZvq-cG74Ed5xMOKV8uEWVRIPlgbUYMN0JVJuipzhK94kY04I3bI0--EAMagOr-Kps-oeDDrUFCRv2p5dFi9WiB6am2Bzc4wlZfxeCPU6yLt0Fqgtb~E6tsjT2QR-1M0JiQ0vUtR0~AkUvCvcRA9oC4h~zPFENU5g__'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: () {},
              radius: 10,
              height: 50,
              child: Text(
                "Submit & Next",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class WinnerClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(size.width * 2 / 3, 0.0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(WinnerClipper oldClipper) => false;
// }

class RadioItem extends StatefulWidget {
  final RadioModel item;
  const RadioItem({super.key, required this.item});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              border: Border.all(color: widget.item.isSelected ? const Color(0xFF0EA84C) : const Color(0xFFE0E0E0)),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.item.isSelected ? const Color(0xFF0EA84C) : const Color(0xFFE0E0E0)),
              ),
              const SizedBox(
                width: 10,
              ),
              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFF9100),
                          width: 2,
                        )),
                    child: CustomImage(
                      path: widget.item.logo,
                      radius: 20,
                    ),
                  ),
                  widget.item.isSelected
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(color: const Color(0xFFFF9100), borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CustomImage(
                                  height: 8,
                                  width: 8,
                                  path:
                                      "https://s3-alpha-sig.figma.com/img/c204/f10b/24cfa8d945c30d47cf12a3615b909ff1?Expires=1714348800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KtgSPjADbFef0XclcRL4-HfqDdzt0Peoi~9I2iBlSq-deQeJtZb6RcisiIdvgKaOnTNXKo5x8wMEzgUWFAe4YTh2omCmwJH6x1HqTsCaouEZbEP1VWSb1d14gjiz1zMpVlmdFqCXvKodrACJAffKBKmUumRbXItn5W2jTw4dX-6tBk6b4-CskgkBKl-dZImpgJ0B1MnUgYYp8X0H7kTJeE9Gmrx9ofHkLHarlbeApCnvwVa-QqKK2JajNJlrsJLBN1zZEUwC2t70GmqpD-Mbb3MnPtL4tugqrCCrMELmOGjVp2phbwhNZ6YB7YHOsbWpjoQ8FPIowv64esDaKaUGJQ__"),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.team,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.item.teamName,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: const Color(0xFF40424E)),
                  ),
                ],
              )
            ],
          ),
        ),
        if (widget.item.isSelected)
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              // clipper: WinnerClipper(),
              child: Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                child: Center(
                  child: Text(
                    "Winner Team",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class RadioModel {
  bool isSelected;
  final String logo;
  final String teamName;
  final String team;

  RadioModel(this.isSelected, this.teamName, this.logo, this.team);
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/chat_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../../../services/theme.dart';

class GroundChatroom extends StatefulWidget {
  final int groundId;

  const GroundChatroom({super.key, required this.groundId});

  @override
  State<GroundChatroom> createState() => _GroundChatroomState();
}

class _GroundChatroomState extends State<GroundChatroom> {
  TextEditingController messageController = TextEditingController();

  String getDateIndicator(DateTime date) {
    final DateTime now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(builder: (chatController) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: chatController.allChats.length,
                  itemBuilder: (context, index) {
                    final chat = chatController.allChats[index];
                    final previousMessage = index < (chatController.allChats.length - 1) ? chatController.allChats[index + 1] : null;
                    final bool showDateIndicator = previousMessage == null ? true : !isSameDate(chat.createdAt!, previousMessage.createdAt!);
                    return Column(
                      children: [
                        if (showDateIndicator)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, top: 15),
                            child: Center(
                              child: Text(
                                getDateIndicator(chat.createdAt!),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: chat.userId == Get.find<AuthController>().profile?.id ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            width: 260,
                            decoration: chat.userId == Get.find<AuthController>().profile?.id
                                ? const BoxDecoration(
                                    color: Color(0xFFFFF4EF),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)))
                                : BoxDecoration(
                                    border: Border.all(width: 1, color: const Color(0xFFE0E0E0)),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    chat.userId == Get.find<AuthController>().profile?.id
                                        ? const Spacer()
                                        : Row(
                                            children: [
                                              Text(
                                                chat.user?.name ?? "",
                                                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                    Text(
                                      DateFormat.jm().format(chat.createdAt!),
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  chat.message ?? "",
                                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                                )
                              ],
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
                    child: TextFormField(
                      controller: messageController,
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
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (messageController.text.isValid) {
                      if (chatController.isLoading) {
                      } else {
                        chatController.sendMessage(groundId: widget.groundId, message: messageController.text).then((value) {
                          if (value.isSuccess) {
                            messageController.clear();
                          }
                        });
                      }
                    } else {
                      Fluttertoast.showToast(msg: "Enter Message", toastLength: Toast.LENGTH_LONG);
                    }

                    // Navigator.pushReplacement(
                    //   context,
                    //   getCustomRoute(
                    //     child: const SignUpScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: chatController.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(14),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                        : const CustomImage(
                            path: Assets.imagesArrowRight,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

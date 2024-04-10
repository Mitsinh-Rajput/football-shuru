import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/data/models/response/joinedteam_model.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/snack_bar.dart';
import 'package:football_shuru/views/screens/dashboard/promote_team_dialogue.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PlayerListScreen extends StatefulWidget {
  final JoinedTeam selectedTeam;
  const PlayerListScreen({super.key, required this.selectedTeam});

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(color: Colors.black, Icons.arrow_back)),
        title: Text(
          "List of players",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<TeamControllor>().leaveTeam(teamId: widget.selectedTeam.team!.id!).then((value) {
                  if (value.isSuccess) {
                    Navigator.pop(context);
                    Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
                  } else {
                    showSnackBar(context, content: value.message);
                  }
                });
              },
              icon: const Icon(
                IconlyLight.logout,
                color: Colors.black,
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              itemCount: widget.selectedTeam.team!.users!.length,
              itemBuilder: (context, index) {
                final member = widget.selectedTeam.team!.users![index];
                return Column(
                  children: [
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      leading: Container(
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.white), boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 4,
                        //     offset: const Offset(0, 4),
                        //     color: Colors.black.withOpacity(0.25),
                        //   ),
                        // ]),
                        child: const CustomImage(
                          radius: 50,
                          path: Assets.imagesTeamlistplayer,
                        ),
                      ),
                      title: Text(
                        "Ground Member",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8, fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text(
                        "${member.user?.name ?? ''}",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        "Soccer",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFF9100),
                            ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                  ],
                );
              }),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          PromoteTeamDialogue().dialogue(context, widget.selectedTeam);
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(color: primaryColor, Icons.add),
                  Text(
                    "Promote your team",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

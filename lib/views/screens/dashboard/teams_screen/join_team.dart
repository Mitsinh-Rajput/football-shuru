import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/main.dart';
import 'package:football_shuru/services/date_formatters_and_converters.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../../../services/route_helper.dart';
import '../../../../services/theme.dart';
import '../../../base/common_button.dart';
import '../../../base/snack_bar.dart';
import 'add_team.dart';

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
  TextEditingController teamSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<TeamControllor>(builder: (teamControllor) {
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
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              controller: teamSearchController,
              textCapitalization: TextCapitalization.characters,
              validator: (value) {
                if (value.isNotValid) {
                  return "Enter team Code";
                } else if (value?.length != 6) {
                  return "Enter valid 6 digit code";
                }
                return null;
              },
              onChanged: (value) {
                if (value.length == 6) {
                  teamControllor.joinTeam(code: teamSearchController.text.toUpperCase());
                }
              },
              maxLength: 6,
              decoration: CustomDecoration.inputDecoration(
                floating: true,
                label: "Join team code",
                hint: "Ex. XA66YYD",
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
            if (teamControllor.joinTeamInfo != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        CustomImage(
                          radius: 50,
                          path: teamControllor.joinTeamInfo?.teamData?.logo ?? "",
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
                                "Team".toUpperCase(),
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
                                      teamControllor.joinTeamInfo?.teamData?.name?.capitalizeFirstOfEach ?? "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                            color: textPrimary,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (teamControllor.joinTeamInfo?.alreadyJoined != null)
                          RichText(
                            text: TextSpan(
                                text: "Joined Date -\n",
                                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                      color: textPrimary,
                                      fontWeight: FontWeight.w900,
                                    ),
                                children: [
                                  TextSpan(
                                    text: "${DateFormatters().dateTime.format(teamControllor.joinTeamInfo!.alreadyJoined!.createdAt!)}",
                                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                          color: textPrimary,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ]),
                          )
                        else
                          CustomButton(
                            isLoading: teamControllor.isLoading,
                            color: textPrimary,
                            fontSize: 14,
                            elevation: 0,
                            radius: 10,
                            height: 40,
                            onTap: () {
                              teamControllor.joinTeam(teamId: teamControllor.joinTeamInfo?.teamData?.id).then((value) {
                                if (value.isSuccess) {
                                  teamControllor.getJoinedTeam();
                                  Navigator.pop(context);

                                  Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
                                } else {
                                  showSnackBar(navigatorKey.currentContext!,
                                      content: value.message,
                                      snackBarAction: SnackBarAction(
                                        label: 'Close',
                                        onPressed: () {
                                          ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
                                        },
                                      ));
                                }
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Join Team".toUpperCase(),
                                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              )
            else
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "No Team Available",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          getCustomRoute(
                            type: PageTransitionType.topToBottom,
                            child: const AddTeamScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: RDottedLineBorder.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Create new team",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    });
  }
}

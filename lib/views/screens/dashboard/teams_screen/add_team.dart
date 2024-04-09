import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../../services/theme.dart';
import '../../../base/common_button.dart';
import '../../../base/image_picker_sheet.dart';
import '../../../base/snack_bar.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({super.key});

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  TextEditingController team_name = TextEditingController();
  TextEditingController logo_of_team = TextEditingController();
  File? logo;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
        automaticallyImplyLeading: true,
        leading: const BackButton(
          color: Colors.black87,
        ),
        centerTitle: true,
        title: Text(
          "Add Teams",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: textPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(size.width, 1),
          child: Container(
            color: Colors.grey.shade200,
            height: 1,
            width: size.width,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text("Note: Upload your new ground team name and related logo"),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value.isNotValid) {
                    return "Enter name of team";
                  }
                  return null;
                },
                controller: team_name,
                decoration: CustomDecoration.inputDecoration(
                  floating: true,
                  label: "Team name",
                  hint: "Ex. Avenger",
                  hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.grey.shade300,
                      ),
                  icon: const Icon(
                    Icons.group_outlined,
                    size: 24,
                    color: Colors.black87,
                  ),
                  suffix: Icon(
                    Icons.check_circle,
                    size: 24,
                    color: Colors.green[700],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onTap: () async {
                  logo = await getImageBottomSheet(context);
                  if (logo != null) {
                    logo_of_team.text = logo!.path.fileName;
                  }
                  setState(() {});
                },
                readOnly: true,
                validator: (value) {
                  if (value.isNotValid) {
                    return "Enter logo of team";
                  }
                  return null;
                },
                controller: logo_of_team,
                decoration: CustomDecoration.inputDecoration(
                  floating: true,
                  label: "Logo of team",
                  hint: "Click upload File",
                  hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.grey.shade300,
                      ),
                  icon: const Icon(
                    Icons.group_outlined,
                    size: 24,
                    color: Colors.black87,
                  ),
                  suffix: logo_of_team.text.isEmpty
                      ? Icon(
                          Icons.add,
                          size: 24,
                          color: Colors.green[600],
                        )
                      : Icon(
                          Icons.cancel_outlined,
                          size: 24,
                          color: Colors.red[800],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<TeamControllor>(builder: (teamController) {
              return CustomButton(
                isLoading: teamController.isLoading,
                color: textPrimary,
                fontSize: 14,
                elevation: 0,
                radius: 10,
                height: 50,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print(logo);
                    teamController.createTeam(name: team_name.text.trim(), image: logo!).then((value) {
                      if (value.isSuccess) {
                        Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
                        Navigator.pop(context);
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
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Create Team",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

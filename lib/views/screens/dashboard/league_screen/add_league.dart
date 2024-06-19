import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/input_decoration.dart';
import 'package:football_shuru/views/base/common_button.dart';
import 'package:football_shuru/views/base/custom_image.dart';
import 'package:football_shuru/views/base/snack_bar.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../controllers/tournament_league_controller.dart';
import '../../../base/image_picker_sheet.dart';

class AddLeague extends StatefulWidget {
  const AddLeague({super.key});

  @override
  State<AddLeague> createState() => _AddLeagueState();
}

class _AddLeagueState extends State<AddLeague> {
  TextEditingController pincodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController numberOfParticipantsController =
      TextEditingController();
  TextEditingController minimumTeamSizeController =
      TextEditingController();

  final List<int> participants = [4, 8, 16, 32];
  final List<String> type = ["league","knockout"];
  int? selectedParticipant;
  String? selectedType;
  List<File> images = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              color: Colors.black,
              Assets.imagesArrowLeft,
              height: 24,
              width: 24,
            ),
          ),
        ),
        title: Text(
          "Add League",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF40424E)),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: pincodeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Pincode';
                    } else if (value?.length != 6) {
                      return "Enter 6 Digit Pincode";
                    }
                    return null;
                  },
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(
                          height: 24, width: 24, path: Assets.imagesPincode),
                    ),
                    floating: true,
                    label: "Enter pincode",
                    hint: "Ex. 4143905",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Name Of Ground';
                    }
                    return null; // Return null if the value is valid
                  },
                  controller: nameController,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(
                          height: 24,
                          width: 24,
                          path: Assets.imagesNameofground),
                    ),
                    floating: true,
                    label: "Name of league",
                    hint: "Ex. Thane Premier League",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter League Description';
                    }
                    return null; // Return null if the value is valid
                  },
                  controller: descController,
                  maxLines: 3,
                  decoration: CustomDecoration.inputDecoration(
                    floating: true,
                    label: "League Description",
                    hintStyle: const TextStyle(fontSize: 14),
                    hint:
                        "Ex. Located in Navi Mumbai, Father Agnel Sports Complex is a distinguished sports club. Situated in Vashi Sector 9a, this establishment brings years of expertise to the realm of health, fitness, and sports, establishing itself as a trusted destination for individuals seeking a holistic approach to wellness.",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isNotValid) {
                      return 'Enter Minimum Team Size';
                    }
                    return null; // Return null if the value is valid
                  },
                  controller: minimumTeamSizeController,
                  keyboardType: TextInputType.number,
                  decoration: CustomDecoration.inputDecoration(
                    floating: true,
                    label: "Minimum Team Size",
                    hintStyle: const TextStyle(fontSize: 14),
                    hint:
                    "Ex. 2",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<int>(
                  dropdownColor: Colors.white,
                  value: selectedParticipant,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(
                          height: 24, width: 24, path: Assets.imagesTeams),
                    ),
                    floating: true,
                    label: "Number of participants",
                    hint: "Select number of participants",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                  items: participants.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedParticipant = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select number of participants';
                    }
                    return null; // Return null if the value is valid
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  value: selectedType,
                  decoration: CustomDecoration.inputDecoration(
                    icon: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: CustomImage(
                          height: 24, width: 24, path: Assets.imagesTeams),
                    ),
                    floating: true,
                    label: "Type of Tournament",
                    hint: "Select type of tournament",
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                  items: type.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedType = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Select type of tournament';
                    }
                    return null; // Return null if the value is valid
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ground Images",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        if (images.isNotEmpty)
                          ...List.generate(images.length, (index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 0, right: 10, bottom: 25),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      images[index],
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: -15,
                                      right: 2,
                                      left: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          images.removeAt(index);
                                          setState(() {});
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                IconlyLight.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                        if (!images.isNotEmpty)
                        GestureDetector(
                          onTap: () async {
                            File? groundPic =
                                await getImageBottomSheet(context);
                            if (groundPic != null) {
                              images.add(groundPic);
                            }
                            setState(() {});
                          },
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomImage(
                                      path: Assets.imagesAddimage,
                                      color: Colors.grey,
                                      height: 30,
                                      width: 30,
                                    ),
                                    SizedBox(height: 6),
                                    Text("Add Image")
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<TournamentLeagueController>(
          builder: (tournamentLeagueController) {
        return Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, -2),
                spreadRadius: 0,
              )
            ],
          ),
          child: CustomButton(
              isLoading: tournamentLeagueController.isLoading,
              elevation: 0,
              radius: 50,
              color: const Color(0xFF263238),
              child: Text(
                "Submit",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  if (images.isNotEmpty) {
                    tournamentLeagueController
                        .createLeague(
                      pincode: pincodeController.text,
                      name: nameController.text,
                      desc: descController.text,
                      images: images,
                      numberOfParticipants: selectedParticipant.toString(), type: selectedType ?? "",
                      minimumTeamSize: int.parse(minimumTeamSizeController.text)
                    )
                        .then((value) {
                      if (value.isSuccess) {
                        Navigator.pop(context);
                      }
                    });
                  } else {
                    showSnackBar(context,
                        content: "Please add at least one image");
                  }
                } else {
                  showSnackBar(context,
                      content: "Please fill in all required fields");
                }
              }),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/controllers/gameslot_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/base/snack_bar.dart';
import 'package:get/get.dart';

import '../../../../services/date_formatters_and_converters.dart';
import '../../../../services/input_decoration.dart';
import '../../../base/common_button.dart';
import '../../../base/date_picker_widget.dart';

class NewGameSlotDialogue {
  dialogue(context, int groundId) {
    return showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return PopScope(
            canPop: false,
            child: NewGameSlotScreen(
              groundId: groundId,
            ),
          );
        }));
  }
}

class NewGameSlotScreen extends StatefulWidget {
  final int groundId;
  const NewGameSlotScreen({
    super.key,
    required this.groundId,
  });

  @override
  State<NewGameSlotScreen> createState() => _NewGameSlotScreenState();
}

class _NewGameSlotScreenState extends State<NewGameSlotScreen> {
  TextEditingController scheduleDateController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Create a new game slot",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value.isNotValid) {
                  return "Enter Title";
                }
                return null;
              },
              maxLines: null,
              expands: false,
              keyboardType: TextInputType.multiline,
              decoration: CustomDecoration.inputDecoration(
                hint: "Ex. lets play",
                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFE0E0E0)),
                label: "Title",
              ),
            ),
            const SizedBox(height: 15),
            CustomDatePicker(
              onChanged: (DateTime? dateTime) {
                scheduleDateController.text = DateFormatters().dateTime.format(dateTime!);
                setState(() {});
              },
              today: true,
              getTime: true,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.isNotValid) {
                    return "Schedule Start Date & Time";
                  }
                  return null;
                },
                controller: scheduleDateController,
                enabled: false,
                readOnly: true,
                decoration: CustomDecoration.inputDecoration(label: "Schedule Date & Time", suffix: Icon(Icons.calendar_month)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(height: 30),
            GetBuilder<GameSlotController>(builder: (gameSlotController) {
              return CustomButton(
                isLoading: gameSlotController.isLoading,
                color: primaryColor,
                elevation: 0,
                radius: 10,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    gameSlotController
                        .createGameSlot(
                            datetime: DateFormatters().dateTime.parse(scheduleDateController.text!).toString(), title: titleController.text.trim(), groundId: widget.groundId)
                        .then((value) {
                      if (value.isSuccess) {
                        Navigator.pop(context);
                        gameSlotController.getGameSlotDetails(groundId: widget.groundId);
                        Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
                      } else {
                        showSnackBar(context, content: value.message);
                      }
                    });
                  }
                },
                child: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

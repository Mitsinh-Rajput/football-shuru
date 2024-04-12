import 'dart:developer';

import 'package:flutter/material.dart';

import '../common_button.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({super.key});

  @override
  ExitDialogState createState() => ExitDialogState();
}

class ExitDialogState extends State<ExitDialog> {
  @override
  void initState() {
    super.initState();
    log("dialogue run");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false; // Return false if showDialog() returned null
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 5), blurRadius: 5),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Exit App?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF263238),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'If you wish to close the application, please confirm by clicking on the Exit button below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF46454A),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      type: ButtonType.secondary,
                      color: null,
                      elevation: 0,
                      radius: 6,
                      onTap: () => Navigator.of(context).pop(false),
                      title: "Cancel",
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      elevation: 0,
                      radius: 6,
                      onTap: () => Navigator.of(context).pop(true),
                      title: "Exit",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

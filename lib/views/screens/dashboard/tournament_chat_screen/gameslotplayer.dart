import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../../../data/models/response/gameslotmodel.dart';

class GameSlotPlayerListScreen extends StatefulWidget {
  final GameSlot selectedGameSlot;
  const GameSlotPlayerListScreen({super.key, required this.selectedGameSlot});

  @override
  State<GameSlotPlayerListScreen> createState() => _GameSlotPlayerListScreenState();
}

class _GameSlotPlayerListScreenState extends State<GameSlotPlayerListScreen> {
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
        titleSpacing: 0.0,
        title: Text(
          "Players Shown Interest",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shrinkWrap: true,
              itemCount: widget.selectedGameSlot.gameSlotAttendances!.length,
              itemBuilder: (context, index) {
                final member = widget.selectedGameSlot.gameSlotAttendances![index];
                return Column(
                  children: [
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      // leading: CircleAvatar(
                      //   radius: 16,
                      //   child: Text(
                      //     '${index + 1}',
                      //     style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                      //   ),
                      // ),
                      title: Text(
                        "Ground Member",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 8, fontWeight: FontWeight.w400),
                      ),
                      subtitle: Text(
                        member.user?.name ?? '',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                      ),
                      trailing: Text(
                        (member.status ?? false) ? "IN" : "OUT",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18,
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
    );
  }
}

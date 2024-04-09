import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../main.dart';
import '../../services/route_helper.dart';
import '../../views/screens/initial_screens/splash_screen.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      log('here 401');
      Get.find<AuthController>().clearSharedData();
      navigatorKey.currentState!.pushAndRemoveUntil(getCustomRoute(child: const SplashScreen()), (route) => false);
    } else if (response.statusText!.contains('Too many connections')) {
      Fluttertoast.showToast(msg: 'Too many connections');
    } else if (response.statusText!.contains('Too Many Attempts')) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(msg: '''Security Checkpoint: Too Many Attempts Detected. Please patiently wait and try again. Thank you for your understanding.''');
    } else {
      // Fluttertoast.showToast(msg: '${response.statusText} ');
    }
  }
}

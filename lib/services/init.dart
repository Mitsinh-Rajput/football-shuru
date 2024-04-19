import 'dart:convert';
import 'dart:developer';

import 'package:football_shuru/controllers/chat_controller.dart';
import 'package:football_shuru/controllers/gameslot_controller.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:football_shuru/controllers/team_controller.dart';
import 'package:football_shuru/data/repositories/gameslot_repo.dart';
import 'package:football_shuru/data/repositories/home_repo.dart';
import 'package:football_shuru/data/repositories/kingchallenge_repo.dart';
import 'package:football_shuru/data/repositories/team_repo.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/firebase_controller.dart';
import '../controllers/permission_controller.dart';
import '../data/api/api_calls.dart';
import '../data/api/api_client.dart';
import '../data/repositories/auth_repo.dart';
import 'constants.dart';

class Init {
  getBaseUrl() async {
    ApiCalls calls = ApiCalls();
    await calls.apiCallWithResponseGet('https://fishcary.com/fishcary/api/link2.php?for=true').then((value) {
      log(value.toString());
      AppConstants().setBaseUrl = jsonDecode(value)['link'];
      log(AppConstants().getBaseUrl, name: 'BASE');
    });
  }

  initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);

    try {
      Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
      Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
      Get.lazyPut(() => HomeRepo(apiClient: Get.find()));
      Get.lazyPut(() => TeamRepo(apiClient: Get.find()));
      Get.lazyPut(() => GameSlotRepo(apiClient: Get.find()));
      Get.lazyPut(() => KingChallengeRepo(apiClient: Get.find()));
      // Get.lazyPut(() => LeadsRepo(apiClient: Get.find()));
      // Get.lazyPut(() => AdminRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
      // Get.lazyPut(() => CartRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
      // Get.lazyPut(() => SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

      Get.lazyPut(() => PermissionController());
      Get.lazyPut(() => ChatController(authRepo: Get.find()));
      Get.lazyPut(() => AuthController(authRepo: Get.find()));
      Get.lazyPut(() => HomePageController(homeRepo: Get.find()));
      Get.lazyPut(() => TeamControllor(teamRepo: Get.find()));
      Get.lazyPut(() => GameSlotController(gameSlotRepo: Get.find()));
      Get.lazyPut(() => FirebaseController());
      Get.lazyPut(() => KingChallengeController(kingChallengeRepo: Get.find()));
      // Get.lazyPut(() => LeadsController(leadsRepo: Get.find()));
      // Get.lazyPut(() => AdminController(adminRepo: Get.find()));
      // Get.lazyPut(() => ChatAgoraController(agoraChatRepo: Get.find()));
      // Get.lazyPut(() => AgoraChatRepo(apiClient: Get.find()));
      // Get.lazyPut(() => CartController(cartRepo: Get.find()));
      // Get.lazyPut(() => SplashController(splashRepo: Get.find()));
    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }
}

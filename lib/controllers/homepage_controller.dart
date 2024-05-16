import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/kingchallenge_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/data/models/response/slider_model.dart';
import 'package:football_shuru/data/repositories/home_repo.dart';
import 'package:football_shuru/main.dart';
import 'package:get/get.dart';

import '../data/models/response/response_model.dart';
import '../services/constants.dart';
import '../views/base/snack_bar.dart';

class HomePageController extends GetxController implements GetxService {
  final HomeRepo homeRepo;

  HomePageController({required this.homeRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<SliderModel> slider = [];

  Future<ResponseModel> getSlider() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.slider}",
        name: "getSlider");
    try {
      Response response = await homeRepo.slider();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getSlider");
      if (response.statusCode == 200) {
        slider = sliderFromJson(jsonEncode(response.body['data']));
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        showSnackBar(navigatorKey.currentContext!,
            content: "Something went wrong, Please try again",
            snackBarAction: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                getSlider();
                log("Geklfskl");
                ScaffoldMessenger.of(navigatorKey.currentContext!)
                    .hideCurrentSnackBar();
              },
            ));
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getSlider()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Grounds? groundsDetail;

  Future<ResponseModel> getgroundsDetail({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.groundDetail}",
        name: "getgroundsDetail");
    try {
      Response response = await homeRepo.groundDetail(groundId: groundId);
      log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "getgroundsDetail");
      if (response.statusCode == 200) {
        groundsDetail = groundsFromJson(jsonEncode(response.body['data']));
        if (groundsDetail?.groundKingChallenge != null) {
          Get.find<KingChallengeController>().teamId =
              groundsDetail?.groundKingChallenge?.teamId;
        }
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getgroundsDetail()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> setWinner({
    required int challengeId,
    int? teamGoals,
    int? opponentTeamGoals,
    int? winnerTeamId,
    int? isDraw,
    String? isCancelled,
  }) async {
    ResponseModel responseModel;

    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.setWinner}",
        name: "setWinner");
    try {
      Response response = await homeRepo.setWinner(
          challengeId: challengeId,
          teamGoals: teamGoals,
          opponentTeamGoals: opponentTeamGoals,
          winnerTeamId: winnerTeamId,
          isCancelled: isCancelled,
          isDraw: isDraw);
      log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "setWinner");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT setWinner()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> joinGround({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinGround}",
        name: "joinGround");
    try {
      Response response = await homeRepo.joinGround(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "joinGround");
      if (response.statusCode == 200) {
        Get.find<AuthController>().getgrounds();
        getJoinedGrounds();
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        showSnackBar(
          navigatorKey.currentContext!,
          content: "Something went wrong, Please try again",
          snackBarAction: SnackBarAction(
            label: 'Retry',
            onPressed: () {
              joinGround(groundId: groundId);
              log("Geklfskl");
              ScaffoldMessenger.of(navigatorKey.currentContext!)
                  .hideCurrentSnackBar();
            },
          ),
        );
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT joinGround()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  List<Grounds> joinedGrounds = [];

  Future<ResponseModel> getJoinedGrounds() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinedGrounds}",
        name: "gedGrounds");
    try {
      Response response = await homeRepo.joinedGround();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getJoinedGrounds");
      if (response.statusCode == 200) {
        joinedGrounds.clear();
        for (var e in response.body['data']) {
          joinedGrounds.add(Grounds.fromJson(e['ground']));
        }
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getJoinedGrounds()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  bool logoutloading = false;
  Future<ResponseModel> leaveGround({required int groundId}) async {
    ResponseModel responseModel;
    logoutloading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leaveGround}",
        name: "leaveGround");
    try {
      Response response = await homeRepo.leaveGround(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "joinGround");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT leaveGround()");
    }
    logoutloading = false;
    update();
    return responseModel;
  }
}

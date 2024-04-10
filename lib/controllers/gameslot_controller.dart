import 'dart:convert';
import 'dart:developer';

import 'package:football_shuru/data/models/response/gameslotmodel.dart';
import 'package:football_shuru/data/repositories/gameslot_repo.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../data/models/response/response_model.dart';
import '../services/constants.dart';

class GameSlotController extends GetxController implements GetxService {
  final GameSlotRepo gameSlotRepo;

  GameSlotController({required this.gameSlotRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  List<GameSlot> gameSlotDetail = [];
  Future<ResponseModel> getGameSlotDetails({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.gameSlot}", name: "getGameSlotDetails");
    try {
      Response response = await gameSlotRepo.gameSlot(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getGameSlotDetails");
      if (response.statusCode == 200) {
        gameSlotDetail = gameSlotFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getGameSlotDetails()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> createGameSlot({required String datetime, required String title, required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createGameSlot}", name: "createGameSlot");
    try {
      Response response = await gameSlotRepo.createGameSlot(datetime: datetime, title: title, groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "createGameSlot");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT createGameSlot()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void updateGameSlotUserResponse(GameSlot gameSlot) {
    gameSlot.loggedInUserResponse?.status = !(gameSlot.loggedInUserResponse?.status ?? false);
    update();
  }

  // void updateGameSlotDetails(List<GameSlot> gameSlot) {
  //   log(gameSlot.toString(), name: 'HJBDHJD');
  //   gameSlotDetail = gameSlot;
  //
  //   update();
  // }

  Future<ResponseModel> gameSlotAttendance({required int gameSlotId, required String status}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.gameSlotAttenance}", name: "gameSlotAttendance");
    try {
      Response response = await gameSlotRepo.gameSlotAttendance(gameSlotId: gameSlotId, status: status);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "gameSlotAttendance");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT gameSlotAttendance()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

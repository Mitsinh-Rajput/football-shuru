import 'dart:convert';
import 'dart:developer';

import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/data/models/response/groundteam_model.dart';
import 'package:football_shuru/data/repositories/kingchallenge_repo.dart';
import 'package:get/get.dart';

import '../data/models/response/response_model.dart';
import '../services/constants.dart';

class KingChallengeController extends GetxController implements GetxService {
  final KingChallengeRepo kingChallengeRepo;

  KingChallengeController({required this.kingChallengeRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<GroundTeam> groundTeamList = [];

  GroundKingChallenge? groundKingChallenge;

  int? teamId;

  int? opponentTeamId;

  Future<ResponseModel> getGroundTeamList({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.getMyTeam}", name: "getTeamList Details");
    try {
      Response response = await kingChallengeRepo.getMyTeam(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getTeamList");
      if (response.statusCode == 200) {
        groundTeamList = groundTeamFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getTeamList()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> createChallenge({required int groundId, required int teamId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createChallenge}", name: "createChallenge Details");
    try {
      Response response = await kingChallengeRepo.createChallenge(groundId: groundId, teamId: teamId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "createChallenge");
      if (response.statusCode == 200) {
        this.teamId = teamId;
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT createChallenge()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> setOpponent({required int groundId, required int teamId, required int opponentTeamId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createChallenge}", name: "createChallenge Details");
    try {
      Response response = await kingChallengeRepo.setOpponent(
        groundId: groundId,
        teamId: teamId,
        opponentId: opponentTeamId,
      );
      log(response.statusCode.toString());
      log(response.body.toString(), name: "createChallenge");
      if (response.statusCode == 200) {
        this.teamId = teamId;
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT createChallenge()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> scheduleTime({required int groundId, required int scheduledBy, required String scheduledTime}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createChallenge}", name: "scheduleTime Details");
    try {
      Response response = await kingChallengeRepo.scheduleTime(
        groundChallengeId: groundId,
        teamId: scheduledBy,
        scheduledTime: scheduledTime,
      );
      log(response.statusCode.toString());
      log(response.body.toString(), name: "scheduleTime");
      if (response.statusCode == 200) {
        this.teamId = teamId;
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT scheduleTime()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> approveSchedule({required int groundChallengeId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createChallenge}", name: "scheduleTime Details");
    try {
      Response response = await kingChallengeRepo.approveSchedule(
        groundChallengeId: groundChallengeId,
      );
      log(response.statusCode.toString());
      log(response.body.toString(), name: "scheduleTime");
      if (response.statusCode == 200) {
        this.teamId = teamId;
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT scheduleTime()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

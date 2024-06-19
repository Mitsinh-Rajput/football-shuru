import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/services/extensions.dart';
import 'package:get/get.dart';

import '../data/models/response/league_model.dart';
import '../data/models/response/league_table_model.dart';
import '../data/models/response/response_model.dart';
import '../data/models/response/statistic_model.dart';
import '../data/repositories/tournament_league_repo.dart';
import '../services/constants.dart';

class TournamentLeagueController extends GetxController implements GetxService {
  final TournamentLeagueRepo tournamentLeagueRepo;

  TournamentLeagueController({required this.tournamentLeagueRepo});
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> createLeague(
      {required String pincode,
      required String name,
      String? desc,
      required String numberOfParticipants,
        required String type,
        required int minimumTeamSize,
      List<File>? images}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createLeague}",
        name: "createLeague");
    try {
      Map<String, dynamic> data = {};
      data.addAll({
        "pincode": pincode,
      });
      data.addAll({
        "name": name,
      });
      data.addAll({
        "number_of_participants": numberOfParticipants,
      });
      data.addAll({
        "description": desc,
      });
      data.addAll({
        "type": type,
      });
      data.addAll({
        "minimum_team_size": minimumTeamSize,
      });
      log(images.toString(), name: "Images");
      if ((images ?? []).isNotEmpty) {
        // for (int i = 0; i < (images ?? []).length; i++) {
          data.addAll({
            'image':
                MultipartFile(images?.first, filename: images!.first.path.fileName),
          });
        // }
      }
      log(data.toString(), name: "Data");
      Response response = await tournamentLeagueRepo.createLeague(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "createLeague");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT createLeague()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  List<LeagueModel> league = [];

  Future<ResponseModel> getLeague() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.getLeagueList}",
        name: "getLeague");
    try {
      Response response = await tournamentLeagueRepo.getLeagueList();
      log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "getLeague");
      if (response.statusCode == 200) {
        league.clear();
        league = leagueModelFromJson(jsonEncode(response.body['data']));
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getLeague()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  LeagueModel? leagueDetails;

  List<LeagueTableModel> leagueTableList = [];

  void sortByUserId(){
    List<LeagueMatchSchedule> temp = [];
    for(var i=0;i<(leagueDetails?.leagueMatchSchedules ?? []).length;i++){
      if(leagueDetails?.leagueMatchSchedules?[i].team?.captain == Get.find<AuthController>().profile?.id ||
          leagueDetails?.leagueMatchSchedules?[i].opponentTeam?.captain == Get.find<AuthController>().profile?.id){
        temp.add(leagueDetails?.leagueMatchSchedules?[i] ?? LeagueMatchSchedule());
      }
    }
    temp.sort((a, b) {
      if ((a.scheduledTimeStatus == "rejected" && a.scheduledBy!=null) && (b.scheduledTimeStatus != "rejected" && a.scheduledBy!=null)) {
        return 1;
      }else {
        return 0;
      }
    });

    for(var i=0;i<(leagueDetails?.leagueMatchSchedules ?? []).length;i++){
      if(leagueDetails?.leagueMatchSchedules?[i].team?.captain != Get.find<AuthController>().profile?.id &&
          leagueDetails?.leagueMatchSchedules?[i].opponentTeam?.captain != Get.find<AuthController>().profile?.id){
        temp.add(leagueDetails?.leagueMatchSchedules?[i] ?? LeagueMatchSchedule());
      }
    }
    leagueDetails?.leagueMatchSchedules = temp;
  }

  Future<ResponseModel> getLeagueDetail({required int leagueId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.getLeagueList}",
        name: "getLeagueDetail");
    try {
      Response response =
          await tournamentLeagueRepo.getLeague(leagueId: leagueId);
      // log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "getLeagueDetail");
      if (response.statusCode == 200) {
        leagueDetails = LeagueModel.fromJson(
            json.decode(jsonEncode(response.body['data'])));
        leagueTableList =
            leagueTableModelFromJson(jsonEncode(response.body['tables']));
        leagueTableList.sort(
            (a, b) => b.totalMatchesPlayed!.compareTo(a.totalMatchesPlayed!));
        sortByUserId();
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getLeagueDetail()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  List<StatisticModel> leagueGoals = [];
  List<StatisticModel> leagueAssists = [];
  List<StatisticModel> leagueBestDefenders = [];
  List<StatisticModel> leagueBestMidfielders = [];

  Future<ResponseModel> getStatisticData(
      {required int leagueId, required String type}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leagueStatistic}",
        name: "getStatisticData");
    try {
      Response response = await tournamentLeagueRepo.leagueStatistic(
          leagueId: leagueId, type: type);
      // log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "getStatisticData");
      if (response.statusCode == 200) {
        if (type == "goal") {
          leagueGoals =
              statisticModelFromJson(jsonEncode(response.body["data"]));
        } else if (type == "assist") {
          leagueAssists =
              statisticModelFromJson(jsonEncode(response.body["data"]));
        } else if (type == "best_defender") {
          leagueBestDefenders =
              statisticModelFromJson(jsonEncode(response.body["data"]));
        } else {
          leagueBestMidfielders =
              statisticModelFromJson(jsonEncode(response.body["data"]));
        }
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getLeagueDetail()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> assignLeague(
      {required String teamId, required String leagueId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.assignTeamToLeague}",
        name: "assignLeague");
    try {
      Map<String, dynamic> data = {};
      data.addAll({
        "team_id": teamId,
      });
      data.addAll({
        "league_id": leagueId,
      });
      log(data.toString(), name: "Data");
      Response response = await tournamentLeagueRepo.assignLeague(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "assignLeague");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT assignLeague()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> scheduleTime(
      {required int leagueMatchScheduleId,
      required int scheduledBy,
      required String scheduledTime}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leagueMatchScheduleTime}",
        name: "scheduleTime Details");
    try {
      Response response = await tournamentLeagueRepo.scheduleTime(
        leagueMatchScheduleId: leagueMatchScheduleId,
        scheduledBy: scheduledBy,
        scheduledTime: scheduledTime,
      );
      log(response.statusCode.toString());
      log(response.body.toString(), name: "scheduleTime");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT scheduleTime()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> approveSchedule(
      {required int leagueMatchScheduleId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leagueMatchApproveSchedule}",
        name: "approveSchedule Details");
    try {
      Response response = await tournamentLeagueRepo.approveSchedule(
        leagueMatchScheduleId: leagueMatchScheduleId,
      );
      log(response.statusCode.toString());
      log(response.body.toString(), name: "approveSchedule");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT approveSchedule()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> setWinner({
    required int leagueMatchId,
    int? teamGoals,
    int? opponentTeamGoals,
    int? winnerTeamId,
    String? isDraw,
    String? isCancelled,
  }) async {
    ResponseModel responseModel;

    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leagueMatchSetWinner}",
        name: "setWinner");
    try {
      Response response = await tournamentLeagueRepo.setWinner(
          teamGoals: teamGoals,
          opponentTeamGoals: opponentTeamGoals,
          winnerTeamId: winnerTeamId,
          isCancelled: isCancelled,
          isDraw: isDraw,
          leagueMatchId: leagueMatchId);
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

  Future<ResponseModel> scorecard(Map<String, dynamic> data) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.scorecard}",
        name: "scorecard Details");
    try {
      Response response = await tournamentLeagueRepo.scorecard(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "scorecard");
      if (response.statusCode == 200) {
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
        update();
      } else {
        responseModel =
            ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT scorecard()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football_shuru/services/extensions.dart';
import 'package:get/get.dart';

import '../data/models/response/league_model.dart';
import '../data/models/response/response_model.dart';
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
      log(images.toString(), name: "Images");
      if ((images ?? []).isNotEmpty) {
        for (int i = 0; i < (images ?? []).length; i++) {
          data.addAll({
            'image[$i]':
                MultipartFile(images?[i], filename: images![i].path.fileName),
          });
        }
      }
      print(data);
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
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.getLeague}",
        name: "getLeague");
    try {
      Response response = await tournamentLeagueRepo.getLeague();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getLeague");
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
}

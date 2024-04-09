import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:football_shuru/data/models/response/joinedteam_model.dart';
import 'package:football_shuru/data/repositories/team_repo.dart';
import 'package:get/get.dart';

import '../data/models/response/response_model.dart';
import '../data/models/response/team_model.dart';
import '../services/constants.dart';

class TeamControllor extends GetxController implements GetxService {
  final TeamRepo teamRepo;

  TeamControllor({required this.teamRepo});
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> createTeam({required String name, required File image}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.createTeam}", name: "createTeam");
    try {
      Map<String, dynamic> data = {};
      data.addAll({
        "name": name,
      });
      data.addAll({
        "logo": MultipartFile(image, filename: image.path.split("/").last),
      });
      print(data);
      Response response = await teamRepo.createTeam(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "createTeam");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT createTeam()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Team? joinTeamInfo;
  Future<ResponseModel> joinTeam({String? code, int? teamId}) async {
    joinTeamInfo = null;
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinTeam}", name: "joinTeam");
    try {
      Map<String, dynamic> data = {};
      if (code != null) {
        data.addAll({
          "code": code,
        });
      }
      if (teamId != Null) {
        data.addAll({
          "team_id": teamId,
        });
      }
      print(data);
      Response response = await teamRepo.joinTeam(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "joinTeam");
      if (response.statusCode == 200) {
        if (code != null) {
          joinTeamInfo = teamFromJson(jsonEncode(response.body));
        }
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT joinTeam()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  List<JoinedTeam> joinedTeam = [];
  Future<ResponseModel> getJoinedTeam() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinedTeam}", name: "getJoinedTeam");
    try {
      Response response = await teamRepo.joinedTeam();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getJoinedTeam");
      if (response.statusCode == 200) {
        joinedTeam = joinedTeamFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getJoinedTeam()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:football_shuru/data/models/response/slider_model.dart';
import 'package:football_shuru/data/repositories/home_repo.dart';
import 'package:get/get.dart';

import '../data/models/response/response_model.dart';
import '../services/constants.dart';

class HomePageController extends GetxController implements GetxService {
  final HomeRepo homeRepo;

  HomePageController({required this.homeRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Slider> slider = [];

  Future<ResponseModel> getSlider() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.slider}", name: "getSlider");
    try {
      Response response = await homeRepo.slider();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getSlider");
      if (response.statusCode == 200) {
        slider = sliderFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getSlider()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> joinGround({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinGround}", name: "joinGround");
    try {
      Response response = await homeRepo.joinGround(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "joinGround");
      if (response.statusCode == 200) {
        Get.find<AuthController>().getgrounds();
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
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
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.joinedGrounds}", name: "getJoinedGrounds");
    try {
      Response response = await homeRepo.joinedGround();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getJoinedGrounds");
      if (response.statusCode == 200) {
        joinedGrounds.clear();
        for (var e in response.body['data']) {
          joinedGrounds.add(Grounds.fromJson(e['ground']));
        }
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getJoinedGrounds()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> leaveGround({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.leaveGround}", name: "leaveGround");
    try {
      Response response = await homeRepo.leaveGround(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "joinGround");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT leaveGround()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

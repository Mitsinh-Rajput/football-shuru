import 'dart:convert';
import 'dart:developer';

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
}
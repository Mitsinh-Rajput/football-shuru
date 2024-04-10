import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:football_shuru/data/models/response/grounds_model.dart';
import 'package:get/get.dart';

import '../data/models/contact_number.dart';
import '../data/models/response/profile_model.dart';
import '../data/models/response/response_model.dart';
import '../data/models/response/user_model.dart';
import '../data/repositories/auth_repo.dart';
import '../services/constants.dart';
import '../services/extensions.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool _acceptTerms = true;

  late final number = ContactNumber(number: '', countryCode: '+91');
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  UserModel? _userModel;

  UserModel? get userModel => _userModel;
  bool drawercheck = false;

  bool get isLoading => _isLoading;

  bool get acceptTerms => _acceptTerms;

  Future<ResponseModel> login({required String token}) async {
    ResponseModel responseModel;
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.loginUri}", name: "login");
    try {
      Response response = await authRepo.login(token: token);
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());

        if (response.body.containsKey('errors')) {
          _isLoading = false;
          update();
          return ResponseModel(false, response.statusText!, response.body['errors']);
        }
        if (response.body.containsKey('token')) {
          authRepo.saveUserToken(response.body['token'].toString());
        }
        responseModel = ResponseModel(true, '${response.body['msg']}', response.body);
      } else {
        responseModel = ResponseModel(false, response.statusText!);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++++++++++++++++++++++++++++++++++++++++++ ${e.toString()} +++++++++++++++++++++++++++++++++++++++++++++', name: "ERROR AT login()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> register({
    required String name,
    required String pincode,
    required String gender,
    required String email,
    required String dob,
    required String about,
  }) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.register}", name: "register");
    try {
      Response response = await authRepo.register(pincode: pincode, name: name, gender: gender, email: email, dob: dob, about: about);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "register");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT register()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updateProfile({
    required String name,
    required String pincode,
    required String gender,
    required String email,
    required String dob,
    required String about,
  }) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.updateProfile}", name: "updateProfile");
    try {
      Response response = await authRepo.updateProfile(pincode: pincode, name: name, gender: gender, email: email, dob: dob, about: about);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "register");
      if (response.statusCode == 200) {
        getProfile();
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT updateProfile()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> updatePincode({required String pincode}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.updatePincode}", name: "updatePincode");
    try {
      Response response = await authRepo.updatePincode(pincode: pincode);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "updatePincode");
      if (response.statusCode == 200) {
        getProfile();

        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT updatePincode()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Profile? profile;

  Future<ResponseModel> getProfile() async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.getProfile}", name: "myPackageBookings");
    try {
      Response response = await authRepo.profile();
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getProfile");
      if (response.statusCode == 200) {
        profile = profileFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getProfile()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  List<Grounds> grounds = [];

  Future<ResponseModel> getgrounds({String? pincode}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.ground}", name: "getgrounds");
    try {
      Response response = await authRepo.groundPincode(pincode: pincode);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "getgrounds");
      if (response.statusCode == 200) {
        grounds = groundsListFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT getgrounds()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> storeGround(
      {required String pincode, required String name, required String address, required String desc, required String location, required List<File> images}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.ground}", name: "storeGround");
    try {
      Map<String, dynamic> data = {};
      data.addAll({
        "pincode": pincode,
      });
      data.addAll({
        "title": name,
      });
      data.addAll({
        "address": address,
      });
      data.addAll({
        "map_location": location,
      });
      data.addAll({
        "description": desc,
      });
      log(images.toString(), name: "Images");
      if (images.isNotEmpty) {
        for (int i = 0; i < images.length; i++) {
          data.addAll({
            'images[$i]': MultipartFile(images[i], filename: images[i].path.fileName),
          });
        }
      }
      print(data);
      log(data.toString(), name: "Data");
      Response response = await authRepo.storeGround(data);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "storeGround");
      if (response.statusCode == 200) {
        getgrounds();
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT storeGround()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  // void selectLocation(int? id) {
  //   for (var element in grounds) {
  //     if (element.id == id) {
  //       element.isSelected = true;
  //     } else {
  //       element.isSelected = false;
  //     }
  //   }
  //
  //   update();
  // }

  void toggleTerms() {
    _acceptTerms = !_acceptTerms;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  void setUserToken(String id) {
    authRepo.saveUserToken(id);
  }

  bool checkUserData() {
    try {
      if (_userModel!.user.name.isValid &&
          _userModel!.user.phone.isValid &&
          _userModel!.user.company.isValid &&
          _userModel!.user.dob.isNotNull &&
          _userModel!.user.gender.isValid) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  bool isAdmin() {
    if (_userModel?.user.isAdmin == '1') {
      return true;
    }
    return false;
  }
}

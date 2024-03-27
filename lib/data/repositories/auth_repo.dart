import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  AuthRepo({required this.sharedPreferences, required this.apiClient});

  /// Methods to deal with Remote Data ///

  Future<Response> login({required String token}) async => await apiClient.postData(AppConstants.loginUri, {
        "token": token,
        "device_id": getDeviceId(),
      });

  Future<Response> updatePincode({required String pincode}) async => await apiClient.postData(AppConstants.updatePincode, {
        "pincode": pincode,
      });

  Future<Response> profile() async => await apiClient.getData(AppConstants.getProfile);

  Future<Response> register({
    required String name,
    required String pincode,
    required String gender,
    required String email,
    required String dob,
    required String about,
  }) async =>
      await apiClient.postData(AppConstants.register, {
        "name": name,
        "gender": gender,
        "email": email,
        'pincode': pincode,
        "dob": dob,
        "about": about,
      });

  Future<Response> updateProfile({
    required String name,
    required String pincode,
    required String gender,
    required String email,
    required String dob,
    required String about,
  }) async =>
      await apiClient.postData(AppConstants.updateProfile, {
        "name": name,
        "gender": gender,
        "email": email,
        'pincode': pincode,
        "dob": dob,
        "about": about,
      });

  Future<Response> groundPincode() async => await apiClient.getData(AppConstants.ground);

  Future<Response> loadChats({required int groundId}) async => await apiClient.getData("${AppConstants.loadChats}?ground_id=$groundId");

  Future<Response> sendMessage({required int groundId, required String message}) async =>
      await apiClient.postData(AppConstants.sendMessage, {"ground_id": groundId, "message": message});

  Future<Response> storeGround(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.ground, FormData(data));

  /// Methods to deal with Local Data ///
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    apiClient.token = null;
    apiClient.updateHeader(null);
    return true;
  }

  String? getDeviceId() {
    var deviceSate = OneSignal.User.pushSubscription.id;
    log(deviceSate.toString(), name: "Device ID");
    return deviceSate;
  }

  /// Methods to deal with Local Data ///
}

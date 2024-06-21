import 'dart:developer';

import 'package:football_shuru/services/extensions.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  AuthRepo({required this.sharedPreferences, required this.apiClient});

  /// Methods to deal with Remote Data ///

  Future<Response> login({required String token}) async =>
      await apiClient.postData(AppConstants.loginUri, {
        "token": token,
        "device_id": await getDeviceId(),
      });

  Future<Response> updatePincode({required String pincode}) async =>
      await apiClient.postData(AppConstants.updatePincode, {
        "pincode": pincode,
      });

  Future<Response> profile() async =>
      await apiClient.getData(AppConstants.getProfile);

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

  Future<Response> groundPincode({String? pincode}) async =>
      await apiClient.getData(
          "${AppConstants.ground}${pincode != null ? "?pincode=$pincode" : ""}");

  Future<Response> loadChats({required int groundId}) async =>
      await apiClient.getData("${AppConstants.loadChats}?ground_id=$groundId");

  Future<Response> sendMessage(
          {required int groundId, required String message}) async =>
      await apiClient.postData(AppConstants.sendMessage,
          {"ground_id": groundId, "message": message});


  Future<Response> loadTeamChats({required int teamId}) async =>
      await apiClient.getData("${AppConstants.chatTeam}?team_id=$teamId");


  Future<Response> sendTeamMessage(
      {required int teamId, required String message}) async =>
      await apiClient.postData(AppConstants.sendTeamMessage,
          {"team_id": teamId, "message": message});

  Future<Response> storeGround(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.ground, FormData(data));

  Future<Response> updateLastSeen({required int groundId}) async =>
      await apiClient
          .postData(AppConstants.updateLastSeen, {"ground_id": groundId});

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

  Future<String> getDeviceId() async {
    // OneSignal.initialize('5f0b072e-529f-4df9-af7b-86a35a0259cb');
    log('${OneSignal.User.pushSubscription.optedIn}',
        name: "OneSignal.User.pushSubscription.optedIn");
    log('${OneSignal.User.pushSubscription.token}',
        name: "OneSignal.User.pushSubscription.token");

    return OneSignal.User.pushSubscription.id.isValid
        ? OneSignal.User.pushSubscription.id!
        : 'null';
  }

  /// Methods to deal with Local Data ///
}

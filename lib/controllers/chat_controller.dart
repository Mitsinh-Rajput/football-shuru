import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/data/models/response/chat_model.dart';
import 'package:football_shuru/data/models/response/profile_model.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../data/models/response/response_model.dart';
import '../data/repositories/auth_repo.dart';
import '../services/constants.dart';

class ChatController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  ChatController({required this.authRepo});

  List<ChatModel> _allChats = [];

  List<ChatModel> get allChats {
    return _allChats;
  }

  void resetAllChats() {
    _allChats.clear();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  var scrollController = ScrollController();

  Future<void> initilizePusher({required int userID}) async {
    log('initilizePusher called');
    log(userID.toString(), name: 'userID');

    try {
      await pusher.init(
        apiKey: '7542721cba859d2901e3',
        cluster: 'ap2',
        onEvent: (event) => messageHandler(event),
      );
      await pusher.connect();
      await pusher.subscribe(channelName: "message-sent-to-user-$userID");
    } catch (e) {
      log('$e', name: 'ERROR AT initilizePusher000');
    }
  }

  void messageHandler(PusherEvent event) {
    log('messageHandler called - ${event.channelName}');
    log('messageHandler UserId- ${event.userId}');
    log('messageHandler eventData - ${event.data}');
    log(event.eventName, name: 'event name');

    if (event.eventName == 'chatting-event') {
      final requiredData = json.decode(event.data);
      log(requiredData.toString());
      try {
        _allChats.insert(
          0,
          ChatModel(
            id: requiredData['userId'],
            message: requiredData['message'],
            user: Profile.fromJson((requiredData['userData'])),
            userId: requiredData['userData']['id'],
            createdAt: DateTime.now(),
          ),
        );
        log(_allChats.toString(), name: "ALL Chats");
        update();
      } catch (e) {
        log(e.toString(), name: "Error");
      }
    }
  }

  Future<ResponseModel> loadChats({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.loadChats}", name: "loadChats");
    try {
      Response response = await authRepo.loadChats(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "loadChats");
      if (response.statusCode == 200) {
        _allChats = chatModelFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT loadChats()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> sendMessage({required int groundId, required String message}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.sendMessage}", name: "sendMessage");
    try {
      Response response = await authRepo.sendMessage(groundId: groundId, message: message);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "sendMessage");
      if (response.statusCode == 200) {
        final requiredData = response.body['data'];
        log(Get.find<AuthController>().profile!.id.toString());
        _allChats.insert(
          0,
          ChatModel(
            id: requiredData['id'],
            userId: Get.find<AuthController>().profile?.id,
            message: requiredData['message'],
            createdAt: DateTime.now(),
          ),
        );
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT sendMessage()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

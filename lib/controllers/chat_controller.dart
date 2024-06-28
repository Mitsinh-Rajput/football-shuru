import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football_shuru/controllers/auth_controller.dart';
import 'package:football_shuru/controllers/homepage_controller.dart';
import 'package:football_shuru/data/models/response/chat_model.dart';
import 'package:football_shuru/data/models/response/profile_model.dart';
import 'package:football_shuru/data/models/response/team_chat_model.dart' as teamModel;
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../data/models/response/LeagueChatModel.dart';
import '../data/models/response/response_model.dart';
import '../data/repositories/auth_repo.dart';
import '../services/constants.dart';
import 'gameslot_controller.dart';

class ChatController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  ChatController({required this.authRepo});

  List<ChatModel> _allChats = [];
  List<teamModel.TeamChatModel> teamChat = [];
  List<LeagueChatModel> leagueChat = [];

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
    Get.find<HomePageController>().getJoinedGrounds();
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
        update();
      } catch (e) {
        log(e.toString(), name: "Error");
      }
    } else if (event.eventName == 'game-slot') {
      final requiredData = json.decode(event.data);

      log(event.data.toString(), name: "Game Slo jdsndbsdjt");
      Get.find<GameSlotController>().getGameSlotDetails(groundId: requiredData["groundId"]);
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


  Future<ResponseModel> loadTeamChats({required int teamId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.chatTeam}", name: "loadTeamChats");
    try {
      Response response = await authRepo.loadTeamChats(teamId: teamId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "loadTeamChats");
      if (response.statusCode == 200) {
        teamChat = teamModel.teamChatModelFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT loadTeamChats()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> sendTeamMessage({required int teamId, required String message}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.sendTeamMessage}", name: "sendTeamMessage");
    try {
      Response response = await authRepo.sendTeamMessage(teamId: teamId, message: message);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "sendMessage");
      if (response.statusCode == 200) {
        final requiredData = response.body['data'];
        log(Get.find<AuthController>().profile!.id.toString());
        teamChat.insert(
          0,
          teamModel.TeamChatModel(
            id: requiredData['id'],
            user: teamModel.User(
              id: Get.find<AuthController>().profile?.id,
              name: Get.find<AuthController>().profile?.name,
            ),
            message: requiredData['message'],
            createdAt: DateTime.now()
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

  Future<ResponseModel> loadLeagueChats({required int leagueId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.chatLeague}", name: "loadLeagueChats");
    try {
      Response response = await authRepo.loadLeagueChats( leagueId: leagueId);
      log(response.statusCode.toString());
      log(jsonEncode(response.body), name: "loadLeagueChats");
      if (response.statusCode == 200) {
        leagueChat = leagueChatModelFromJson(jsonEncode(response.body['data']));
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT loadLeagueChats()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> sendLeagueMessage({required int leagueId, required String message}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.sendTeamMessage}", name: "sendLeagueMessage");
    try {
      Response response = await authRepo.sendLeagueMessage(leagueId: leagueId, message: message);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "sendLeagueMessage");
      if (response.statusCode == 200) {
        final requiredData = response.body['data'];
        log(Get.find<AuthController>().profile!.id.toString());
        leagueChat.insert(
          0,
          LeagueChatModel(
              id: requiredData['id'],
              user: User(
                id: Get.find<AuthController>().profile?.id,
                name: Get.find<AuthController>().profile?.name,
              ),
              message: requiredData['message'],
              createdAt: DateTime.now()
          ),
        );
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT sendLeagueMessage()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> lastSeenUpdate({required int groundId}) async {
    ResponseModel responseModel;
    _isLoading = true;
    update();
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.updateLastSeen}", name: "lastSeenUpdate");
    try {
      Response response = await authRepo.updateLastSeen(groundId: groundId);
      log(response.statusCode.toString());
      log(response.body.toString(), name: "lastSeenUpdate");
      if (response.statusCode == 200) {
        responseModel = ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(false, '${response.body['message']}', response.body);
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++ ${e.toString()} +++++++', name: "ERROR AT lastSeenUpdate()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}

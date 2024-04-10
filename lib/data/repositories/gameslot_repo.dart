import 'package:get/get_connect/http/src/response/response.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class GameSlotRepo {
  final ApiClient apiClient;
  GameSlotRepo({required this.apiClient});
  Future<Response> gameSlot({required int groundId}) async => await apiClient.getData("${AppConstants.gameSlot}?ground_id=$groundId");
  Future<Response> gameSlotAttendance({required int gameSlotId, required String status}) async =>
      await apiClient.postData(AppConstants.gameSlotAttenance, {"game_slot_id": gameSlotId, "status": status});
  Future<Response> createGameSlot({required String datetime, required String title, required int groundId}) async =>
      await apiClient.postData(AppConstants.createGameSlot, {"date_time": datetime, "ground_id": groundId, "title": title});
}

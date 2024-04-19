import 'package:get/get_connect/http/src/response/response.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class KingChallengeRepo {
  final ApiClient apiClient;
  KingChallengeRepo({required this.apiClient});

  Future<Response> getMyTeam({required int groundId}) async => await apiClient.getData("${AppConstants.getMyTeam}?ground_id=$groundId");

  Future<Response> createChallenge({required int groundId, required int teamId}) async =>
      await apiClient.postData(AppConstants.createChallenge, {"ground_id": groundId, "team_id": teamId});
  Future<Response> setOpponent({required int groundId, required int teamId, required int opponentId}) async => await apiClient.postData(AppConstants.setOpponent, {
        "ground_id": groundId,
        "team_id": teamId,
    "opponent_team_id":opponentId
      });
}

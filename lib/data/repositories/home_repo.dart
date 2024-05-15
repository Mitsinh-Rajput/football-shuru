import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class HomeRepo {
  final ApiClient apiClient;

  HomeRepo({required this.apiClient});

  Future<Response> slider() async =>
      await apiClient.getData(AppConstants.slider);
  Future<Response> joinedGround() async =>
      await apiClient.getData(AppConstants.joinedGrounds);
  Future<Response> groundDetail({required int groundId}) async =>
      await apiClient
          .getData("${AppConstants.groundDetail}?ground_id=$groundId");
  Future<Response> setWinner(
          {required int challengeId,
          required int teamGoals,
          required int opponentTeamGoals,
          required int winnerTeamId}) async =>
      await apiClient.postData(AppConstants.setWinner, {
        "challenge_id": challengeId,
        "team_goals": teamGoals,
        "opponent_team_goals": opponentTeamGoals,
        "winner_team_id": winnerTeamId
      });

  Future<Response> joinGround({required int groundId}) async => await apiClient
      .postData(AppConstants.joinGround, {"ground_id": groundId});

  Future<Response> leaveGround({required int groundId}) async => await apiClient
      .postData(AppConstants.leaveGround, {"ground_id": groundId});
}

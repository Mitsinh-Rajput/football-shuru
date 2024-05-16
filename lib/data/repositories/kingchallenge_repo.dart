import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class KingChallengeRepo {
  final ApiClient apiClient;
  KingChallengeRepo({required this.apiClient});

  Future<Response> getMyTeam({required int groundId}) async =>
      await apiClient.getData("${AppConstants.getMyTeam}?ground_id=$groundId");

  Future<Response> createChallenge(
          {required int groundId, required int teamId}) async =>
      await apiClient.postData(AppConstants.createChallenge,
          {"ground_id": groundId, "team_id": teamId});
  Future<Response> setOpponent(
          {required int groundId,
          required int teamId,
          required int opponentId}) async =>
      await apiClient.postData(AppConstants.setOpponent, {
        "ground_id": groundId,
        "team_id": teamId,
        "opponent_team_id": opponentId
      });

  Future<Response> scheduleTime(
          {required int groundChallengeId,
          required int teamId,
          required String scheduledTime}) async =>
      await apiClient.postData(AppConstants.scheduleTime, {
        "ground_king_challenge_id": groundChallengeId,
        "scheduled_by": teamId,
        "scheduled_time": scheduledTime
      });

  Future<Response> approveSchedule({required int groundChallengeId}) async =>
      await apiClient.postData(AppConstants.approveSchedule,
          {"ground_king_challenge_id": groundChallengeId});

  Future<Response> scorecard(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.scorecard, {
        "team_id": data["team_id"],
        "ground_id": data["ground_id"],
        "ground_king_challenge_id": data["ground_king_challenge_id"],
        "scores": data["scores"]
      });

  Future<Response> getPendingMatchResult() async =>
      await apiClient.getData(AppConstants.pendingList);
}

import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class TournamentLeagueRepo {
  final ApiClient apiClient;
  TournamentLeagueRepo({required this.apiClient});
  Future<Response> createLeague(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.createLeague, FormData(data));
  Future<Response> getLeagueList() async =>
      await apiClient.getData(AppConstants.getLeagueList);
  Future<Response> getLeague({required int leagueId}) async =>
      await apiClient.getData("${AppConstants.getLeague}/$leagueId");
  Future<Response> assignLeague(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.assignTeamToLeague, FormData(data));

  Future<Response> scheduleTime(
          {required int leagueMatchScheduleId,
          required int scheduledBy,
          required String scheduledTime}) async =>
      await apiClient.postData(AppConstants.leagueMatchScheduleTime, {
        "league_match_schedule_id": leagueMatchScheduleId,
        "scheduled_by": scheduledBy,
        "scheduled_time": scheduledTime
      });

  Future<Response> leagueStatistic(
          {required int leagueId, required String type}) async =>
      await apiClient.postData(AppConstants.leagueStatistic, {
        "league_id": leagueId,
        "type": type,
      });

  Future<Response> approveSchedule(
          {required int leagueMatchScheduleId}) async =>
      await apiClient.postData(AppConstants.leagueMatchApproveSchedule,
          {"league_match_schedule_id": leagueMatchScheduleId});

  Future<Response> setWinner(
          {required int leagueMatchId,
          int? teamGoals,
          int? opponentTeamGoals,
          int? winnerTeamId,
          String? isCancelled,
          String? isDraw}) async =>
      await apiClient.postData(AppConstants.leagueMatchSetWinner, {
        "league_match_schedule_id": leagueMatchId,
        "team_goals": teamGoals,
        "opponent_team_goals": opponentTeamGoals,
        "winner_team_id": winnerTeamId,
        "is_cancelled": isCancelled,
        "is_draw": isDraw
      });

  Future<Response> scorecard(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.leagueScorecard, {
        "league_match_schedule_id": data["league_match_schedule_id"],
        "team_id": data["team_id"],
        "league_id": data["league_id"],
        "ground_king_challenge_id": data["ground_king_challenge_id"],
        "scores": data["scores"]
      });
}

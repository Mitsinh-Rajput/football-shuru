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

  Future<Response> approveSchedule(
          {required int leagueMatchScheduleId}) async =>
      await apiClient.postData(AppConstants.leagueMatchApproveSchedule,
          {"league_match_schedule_id": leagueMatchScheduleId});
}

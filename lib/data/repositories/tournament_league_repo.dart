import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class TournamentLeagueRepo {
  final ApiClient apiClient;
  TournamentLeagueRepo({required this.apiClient});
  Future<Response> createLeague(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.createLeague, FormData(data));
  Future<Response> getLeague() async =>
      await apiClient.getData(AppConstants.getLeague);
  Future<Response> assignLeague(Map<String, dynamic> data) async =>
      await apiClient.postData(AppConstants.assignTeamToLeague, FormData(data));
}

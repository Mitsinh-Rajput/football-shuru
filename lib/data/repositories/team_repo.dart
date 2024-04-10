import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class TeamRepo {
  final ApiClient apiClient;
  TeamRepo({required this.apiClient});
  Future<Response> createTeam(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.createTeam, FormData(data));
  Future<Response> joinTeam(Map<String, dynamic> data) async => await apiClient.postData(AppConstants.joinTeam, FormData(data));
  Future<Response> joinedTeam() async => await apiClient.getData(AppConstants.joinedTeam);
  Future<Response> leaveTeam({required int teamId}) async => await apiClient.postData(AppConstants.leaveTeam, {"team_id": teamId});
}

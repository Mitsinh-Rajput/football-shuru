import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class HomeRepo {
  final ApiClient apiClient;

  HomeRepo({required this.apiClient});

  Future<Response> slider() async => await apiClient.getData(AppConstants.slider);

  Future<Response> joinGround({required int groundId}) async => await apiClient.postData(AppConstants.joinGround, {"ground_id": groundId});

  Future<Response> leaveGround({required int groundId}) async => await apiClient.postData(AppConstants.leaveGround, {"ground_id": groundId});
}

import 'package:get/get.dart';

import '../../services/constants.dart';
import '../api/api_client.dart';

class HomeRepo {
  final ApiClient apiClient;
  HomeRepo({required this.apiClient});

  Future<Response> slider() async => await apiClient.getData(AppConstants.slider);
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PriceConverter {
  static convert(price) {
    return '₹ ${double.parse('$price').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    return '₹ ${double.parse('$price').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}

void showCustomToast(msg, {color}) {
  Fluttertoast.showToast(
    msg: "$msg",
    backgroundColor: color,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    webPosition: "center",
    webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
  );
}

String getStringFromList(List<dynamic>? data) {
  String str = data.toString();
  return data.toString().substring(1, str.length - 1);
}

class AppConstants {
  String get getBaseUrl => baseUrl;

  set setBaseUrl(String url) => baseUrl = url;

  //TODO: Change Base Url
  // static String baseUrl = 'https://www.base-url.in/';
  static String baseUrl = 'http://192.168.1.25:8000/';

  ///USE FOR LOCAL
  //TODO: Change Base Url
  static String appNamePart1 = 'FOOTBALL';
  static String appNamePart2 = 'SHURU';

  static const String agoraAppId = 'c87b710048c049f59570bd1895b7e561';

  static const String loginUri = 'api/v1/user/login';
  static const String register = 'api/v1/user/register';
  static const String getProfile = 'api/v1/user/profile/get';
  static const String updateProfile = 'api/v1/user/profile/update';
  static const String updatePincode = 'api/v1/user/profile/update/pincode';
  static const String ground = 'api/v1/ground';
  static const String joinGround = 'api/v1/ground/chat/join';
  static const String leaveGround = 'api/v1/ground/chat/leave';
  static const String joinedGrounds = 'api/v1/ground/chat/joined';
  static const String loadChats = 'api/v1/ground/chat/messages/load';
  static const String sendMessage = 'api/v1/ground/chat/messages/send';

  /// Home
  static const String slider = 'api/v1/basic/slider';

  // Shared Key
  static const String token = 'user_app_token';
}

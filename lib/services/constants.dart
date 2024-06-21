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
  // static String baseUrl = 'https://footballshuru.heenahealth.in/';
  static String baseUrl = 'http://192.168.1.13:8001/';

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
  static const String groundDetail = 'api/v1/ground/detail';

  static const String leaveGround = 'api/v1/ground/chat/leave';
  static const String joinedGrounds = 'api/v1/ground/chat/joined';
  static const String loadChats = 'api/v1/ground/chat/messages/load';
  static const String sendMessage = 'api/v1/ground/chat/messages/send';
  static const String updateLastSeen =
      'api/v1/ground/chat/messages/update-last-seen';
  static const String gameSlot = 'api/v1/ground/game-slot';
  static const String createGameSlot = 'api/v1/ground/game-slot/create';
  static const String gameSlotAttenance = 'api/v1/ground/game-slot/attendance';
  static const String groundStatistic = "api/v1/ground/statistics";

  /// Ground King Challenge

  static const String getMyTeam = 'api/v1/team/my-teams';
  static const String createChallenge = 'api/v1/ground/king-challenge/create';
  static const String setOpponent = 'api/v1/ground/king-challenge/set-opponent';
  static const String scheduleTime =
      'api/v1/ground/king-challenge/schedule-time';
  static const String approveSchedule =
      'api/v1/ground/king-challenge/approve-schedule';
  static const String setWinner = 'api/v1/ground/king-challenge/set-winner';
  static const String scorecard = 'api/v1/ground/scorecard/store';
  static const String pendingList = 'api/v1/ground/king-challenge/pending-list';


  /// Team
  static const String createTeam = 'api/v1/team';
  static const String joinTeam = 'api/v1/team/chat/join';
  static const String joinedTeam = 'api/v1/team/chat/joined';
  static const String leaveTeam = 'api/v1/team/chat/leave';
  static const String chatTeam = 'api/v1/team/chat/messages/load';
  static const String sendTeamMessage = 'api/v1/team/chat/messages/send';


  ///League
  static const String createLeague = 'api/v1/league/';
  static const String getLeagueList = 'api/v1/league';
  static const String getLeague = 'api/v1/league';
  static const String assignTeamToLeague = 'api/v1/league/assign-team';
  static const String leagueMatchScheduleTime =
      'api/v1/league/match/schedule-time';
  static const String leagueMatchApproveSchedule =
      'api/v1/league/match/approve-schedule';
  static const String leagueMatchSetWinner = 'api/v1/league/match/set-winner';
  static const String leagueScorecard = 'api/v1/league/scorecard';
  static const String leagueStatistic = 'api/v1/league/statistics';

  /// Home
  static const String slider = 'api/v1/basic/slider';

  /// Shared Key
  static const String token = 'user_app_token';
}

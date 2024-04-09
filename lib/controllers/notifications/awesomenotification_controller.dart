import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//ignore_for_file: avoid_print

class AwesomeNotificationsController {
  static Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  static ReceivedAction? initialCallAction;

  // ***************************************************************
  //    INITIALIZATIONS
  // ***************************************************************
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
    await initializeIsolateReceivePort();
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              locked: true,
              criticalAlerts: true,
              vibrationPattern: highVibrationPattern,
              importance: NotificationImportance.Max,
              defaultRingtoneType: DefaultRingtoneType.Ringtone,
              playSound: true,
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Colors.red,
              ledColor: Colors.red)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [NotificationChannelGroup(channelGroupKey: 'basic_channel_group', channelGroupName: 'Basic group')],
        debug: true);
  }

  static Future<void> initializeNotificationsEventListeners() async {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: AwesomeNotificationsController.onActionReceivedMethod,
        onNotificationCreatedMethod: AwesomeNotificationsController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod: AwesomeNotificationsController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod: AwesomeNotificationsController.onDismissActionReceivedMethod);
  }

  // ***************************************************************
  //    ON ACTION EVENT REDIRECTION TO MAIN ISOLATE
  // ***************************************************************

  static ReceivePort? receivePort;

  static Future<void> initializeIsolateReceivePort() async {
    receivePort = ReceivePort('Notification action port in main isolate');
    receivePort!.listen((serializedData) {
      final receivedAction = ReceivedAction().fromMap(serializedData);
      onActionReceivedMethodImpl(receivedAction);
    });

    // This initialization only happens on main isolate
    IsolateNameServer.registerPortWithName(receivePort!.sendPort, 'notification_action_port');
  }

  // ***************************************************************
  //    NOTIFICATIONS EVENT LISTENERS
  // ***************************************************************

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    print("Notification Data on $receivedNotification");
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    var message1 = 'Notification displayed on ${receivedNotification.displayedLifeCycle?.name}';
    var message2 = 'Notification displayed at ${receivedNotification.displayedDate}';

    print(message1);
    print(message2);
    // Fluttertoast.showToast(msg: message1, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.blue, gravity: ToastGravity.BOTTOM);
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    var message = 'Notification dismissed on ${receivedAction.dismissedLifeCycle?.name}';
    // Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.orange, gravity: ToastGravity.BOTTOM);
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivePort != null) {
      await onActionReceivedMethodImpl(receivedAction);
    } else {
      print('onActionReceivedMethod was called inside a parallel dart isolate, where receivePort was never initialized.');
      SendPort? sendPort = IsolateNameServer.lookupPortByName('notification_action_port');

      if (sendPort != null) {
        print('Redirecting the execution to main isolate process in listening...');
        dynamic serializedData = receivedAction.toMap();
        sendPort.send(serializedData);
      }
    }
  }

  static Future<void> onActionReceivedMethodImpl(ReceivedAction receivedAction) async {
    var message = 'Action ${receivedAction.actionType?.name} received on ${receivedAction.actionLifeCycle?.name}';
    print(message);
    // Fluttertoast.showToast(msg: receivedAction.buttonKeyPressed, toastLength: Toast.LENGTH_LONG);

    // Always ensure that all plugins was initialized
    WidgetsFlutterBinding.ensureInitialized();

    bool isSilentAction = receivedAction.actionType == ActionType.SilentAction || receivedAction.actionType == ActionType.SilentBackgroundAction;

    // SilentBackgroundAction runs on background thread and cannot show
    // UI/visual elements
    if (receivedAction.actionType != ActionType.SilentBackgroundAction) {
      // Fluttertoast.showToast(
      //     msg: '${isSilentAction ? 'Silent action' : 'Action'}'
      //         ' received on ${receivedAction.actionLifeCycle?.name}',
      //     toastLength: Toast.LENGTH_SHORT,
      //     backgroundColor: isSilentAction ? Colors.blueAccent : primaryColor,
      //     gravity: ToastGravity.BOTTOM);
    }

    if (isSilentAction) {
      debugPrint(receivedAction.toString());
      debugPrint("start");
      await Future.delayed(const Duration(seconds: 4));
      final url = Uri.parse("http://google.com");
      final re = await http.get(url);
      debugPrint(re.body);
      debugPrint("long task done");
    }
    if (!AwesomeStringUtils.isNullOrEmpty(receivedAction.buttonKeyInput)) {
      receiveButtonInputText(receivedAction);
    } else {
      receiveStandardNotificationAction(receivedAction);
    }
  }

  // ***************************************************************
  //    NOTIFICATIONS HANDLING METHODS
  // ***************************************************************

  static Future<void> receiveButtonInputText(ReceivedAction receivedAction) async {
    debugPrint('receiveButtonInputText Button Message: "${receivedAction.buttonKeyInput}"');
    log(receivedAction.buttonKeyInput, name: "receivedAction.buttonKeyInput");
    // Fluttertoast.showToast(
    //     msg: 'Msg: ${receivedAction.buttonKeyInput}',
    //     backgroundColor: App.mainColor,
    //     textColor: Colors.white);
  }

  static Future<void> receiveStandardNotificationAction(ReceivedAction receivedAction) async {
    debugPrint('receiveStandardNotificationAction Button Message: "${receivedAction.buttonKeyPressed}"');
    debugPrint('receiveStandardNotificationAction Button Message: "${receivedAction.payload}"');
    // if (receivedAction.buttonKeyPressed == 'REDIRECT') {
    //   if (receivedAction.payload != null) {
    //     String? bookingIdString = receivedAction.payload?['booking_id'];
    //     print(bookingIdString);
    //     Navigator.pushAndRemoveUntil(
    //         navigatorKey.currentContext!,
    //         getCustomRoute(
    //             child: WorkStartedScreen(
    //           bookingId: int.parse(receivedAction.payload!['booking_id']!),
    //         )),
    //         (route) => false);
    //   } else {
    //     Navigator.pushAndRemoveUntil(
    //         navigatorKey.currentContext!,
    //         getCustomRoute(
    //           child: const DashboardScreen(),
    //         ),
    //         (route) => false);
    //   }
    // } // loadSingletonPage(App.navigatorKey.currentState,
    //     targetPage: PAGE_NOTIFICATION_DETAILS, receivedAction: receivedAction);
  }
}

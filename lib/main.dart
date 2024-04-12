import 'dart:async';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:football_shuru/data/repositories/auth_repo.dart';
import 'package:football_shuru/services/init.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/screens/initial_screens/splash_screen.dart';
import 'package:football_shuru/views/screens/widgets/no_internet.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'controllers/notifications/awesomenotification_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotificationsController.initializeLocalNotifications();
  await Permission.notification.request();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Init().initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background messageId: ${message.messageId}");
  print("Handling a background Data: ${message.data}");
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //
  initPlatForm() async {
    log("${await Permission.notification.status}", name: "OneSignal Notification Status");

    OneSignal.initialize("a61ed62c-595d-4652-9459-6de427215bc6");
    await Future.delayed(const Duration(seconds: 10), () async {
      await Get.find<AuthRepo>().getDeviceId();
    });

    // OneSignal.Notifications.addForegroundWillDisplayListener((OSNotificationWillDisplayEvent event) {
    //   /// preventDefault to not display the notification
    //   event.preventDefault();
    //
    //   /// Do async work
    //   /// notification.display() to display after preventing default
    //   event.notification.display();
    // });

    // OneSignal.Notifications.addClickListener((OSNotificationClickEvent result) {
    //   ///TODO:
    // });
  }

  late StreamSubscription<ConnectivityResult> subscription;
  bool isConnected = true;
  bool isUpdateVisible = false;
  String? fcmToken;

  checkConnection() async {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        log("InterNet is here!"); //? ---------------++- InterNet is hare!
        isConnected = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        log("Wifi is here!!"); //? ------------------++- Wifi is hare!
        isConnected = true;
      } else {
        log("InterNet are lost!"); //? --------------++- InterNet are lost!
        isConnected = false;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    subscription.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    log('Current state = $state');
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AwesomeNotificationsController.initializeNotificationsEventListeners();
    getFCMToken();
    _initializeFirebaseMessaging();

    Timer.run(() async {
      await initPlatForm();
      await checkConnection();
    });
  }

  void _initializeFirebaseMessaging() {
    // Request permission for receiving notifications if not granted already
    FirebaseMessaging.instance.requestPermission();

    // Listen to incoming messages while the app is in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message received: ${message.data.toString()}");
      AwesomeNotifications().createNotificationFromJsonData(message.data);

      // Handle the message as needed
      // You can display a notification, update UI, etc.
    });
  }

  Future<void> getFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      fcmToken = token;
    });
    print('FCM Token: $fcmToken');
  }

  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Football Shuru',
        themeMode: ThemeMode.light,
        theme: CustomTheme.light,
        home: const SplashScreen(),
        builder: (context, child) {
          var data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Stack(
              children: [
                child!,
                //? check internet connection ----:)
                if (!isConnected) const NoInternet(),
              ],
            ),
          );
        },
      ),
    );
  }
}

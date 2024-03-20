import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:football_shuru/services/init.dart';
import 'package:football_shuru/services/theme.dart';
import 'package:football_shuru/views/screens/auth_screens/signup_screen.dart';
import 'package:football_shuru/views/screens/initial_screens/location_screen.dart';
import 'package:football_shuru/views/screens/initial_screens/splash_screen.dart';
import 'package:football_shuru/views/screens/widgets/no_internet.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Init().initialize();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //
  initPlatForm() {
    OneSignal.initialize("a61ed62c-595d-4652-9459-6de427215bc6"); //---------------------ADD ONESIGNAL APPID
    // OneSignal.Notifications.requestPermission(true);
    Permission.notification.request();
  }

  late StreamSubscription<ConnectivityResult> subscription;
  bool isConnected = true;
  bool isUpdateVisible = false;

  //
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

    Timer.run(() async {
      await initPlatForm();
      await checkConnection();
    });
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

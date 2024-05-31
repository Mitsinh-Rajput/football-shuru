import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:football_shuru/views/screens/auth_screens/signup_screen.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../services/custom_snackbar.dart';
import '../services/route_helper.dart';
import '../views/base/dialogs/failed_dialog.dart';
import '../views/screens/dashboard/dashboard_screen.dart';
import '../views/screens/initial_screens/pending_match_screen.dart';
import 'auth_controller.dart';
import 'kingchallenge_controller.dart';

class FirebaseController extends GetxController implements GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign - in

  bool _isLoading = false;
  final bool _isGoogleLoading = false;
  String _message = '';
  String _verificationId = '';

  bool get isLoading => _isLoading;

  bool get isGoogleLoading => _isGoogleLoading;

  TextEditingController phone = TextEditingController();
  TextEditingController otpController = TextEditingController();

  loadingOff() {
    _isLoading = false;
    update();
  }

  int resentOTPTimeLeft = 30;
  Timer? localTimer;

  void startTimer() {
    if (localTimer != null && localTimer!.isActive) {
      localTimer!.cancel();
    }

    resentOTPTimeLeft = 30;
    update();

    localTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resentOTPTimeLeft == 0) {
        localTimer!.cancel();
      } else {
        resentOTPTimeLeft--;
        update();
      }
    });
  }

  void cancelTimer() {
    if (localTimer != null) {
      localTimer!.cancel();
    }
  }

  Future<void> verifyPhoneNumber({required BuildContext context}) async {
    _isLoading = true;
    String number = "+91${phone.text}";
    update();

    log(number, name: "Number");

    //
    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      try {
        await _firebaseAuth
            .signInWithCredential(phoneAuthCredential)
            .then((value) async {
          if (value.user != null) {
            isNavigate(context); // Navigator
            String? token = await value.user!.getIdToken();
            log("$phoneAuthCredential", name: "phoneAuthCredential");
            _isLoading = false;
            update();
            // Todo: Login Api hit then Redirect to home page --
          }
        });
        // ScaffoldSnackBar.of(context).show('Phone number automatically verified and user signed in.');
      } catch (e) {
        _isLoading = false;
        update();
        log('++++++++++++++++++ ${e.toString()} ++++++++++++++++',
            name: "ERROR AT verificationCompleted()");
      }
    }

    //
    verificationFailed(FirebaseAuthException authException) {
      try {
        _message =
            'Phone number verification failed. Code: ${authException.code}. '
            'Message: ${authException.message}';
        log(_message, name: "verificationFailed");
        startTimer();
        _isLoading = false;
        Fluttertoast.showToast(msg: _message, toastLength: Toast.LENGTH_LONG);
        update();
      } catch (e) {
        _isLoading = false;
        update();

        log('+++++++++++++ ${e.toString()} +++++++++++++++',
            name: "ERROR AT verificationFailed()");
      }
    }

    //
    codeSent(String verificationId, [int? forceResendingToken]) async {
      try {
        startTimer();
        // ScaffoldSnackBar.of(context).show('Please check your phone for the verification code.');
        _verificationId = verificationId;
        Fluttertoast.showToast(msg: "OTP has been sent to $number");
        log("$verificationId   \n\n $_verificationId", name: 'codeSent');
        _isLoading = false;
        update();

        log(_verificationId);
      } catch (e) {
        _isLoading = false;
        update();
        log('++++++++++++++++++ ${e.toString()} ++++++++++++++++++++',
            name: "ERROR AT codeSent()");
      }
    }

    //
    codeAutoRetrievalTimeout(String verificationId) {
      try {
        _verificationId = verificationId;
        log("$verificationId   \n\n $_verificationId",
            name: 'codeAutoRetrievalTimeout');
        _isLoading = false;
        update();
      } catch (e) {
        _isLoading = false;
        update();
        log('++++++++++++++++++++++++++++++++++++++++++++ ${e.toString()} +++++++++++++++++++++++++++++++++++++++++++++',
            name: "ERROR AT codeAutoRetrievalTimeout()");
      }
    }

    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: number,
          timeout: const Duration(seconds: 10),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      _isLoading = false;
      update();
      if (context.mounted) {
        ScaffoldSnackBar.of(context).show('Failed to Verify Phone Number: $e');
      }
    }
  }

  Future<void> signInWithPhoneNumber(context) async {
    _isLoading = true;
    update();
    try {
      log("Verification : $_verificationId", name: "_verificationId");
      log("Otp : ${otpController.text}", name: "otpController");
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otpController.text,
      );
      final User user =
          (await _firebaseAuth.signInWithCredential(credential)).user!;
      // Todo: Login Api hit then Redirect to home page --
      isNavigate(context);
    } catch (e) {
      log(e.toString(), name: "ERROR AT signInWithPhoneNumber");
      Fluttertoast.showToast(msg: 'Invalid code');

      ScaffoldSnackBar.of(context).show('Failed to sign in');
      _isLoading = false;
      update();
    }
  }

//

  // Todo: when done firebase operation
  String? token;

  isNavigate(context) async {
    token = await FirebaseAuth.instance.currentUser!.getIdToken();
    update();
    log("bearer token: $token", name: "Token");
    await Future.delayed(const Duration(milliseconds: 1000));

    Get.find<AuthController>().login(token: token!).then((value) {
      if (value.isSuccess) {
        otpController.clear();

        log(value.data['type'].toString(), name: "User type: ");
        if (value.data["type"] == "old") {
          _isLoading = false;
          update();
          Get.find<KingChallengeController>().getPendingList().then((value) {
            if (Get.find<KingChallengeController>()
                    .pendingMatchResultList
                    .isEmpty &&
                Get.find<KingChallengeController>()
                    .pendingLeagueMatchList
                    .isEmpty) {
              Navigator.pushReplacement(
                context,
                getCustomRoute(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 600),
                  child: const DashboardScreen(),
                ),
              );
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  getCustomRoute(child: const PendingMatchScreen()),
                  (route) => false);
            }
          });
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     getCustomRoute(child: const DashboardScreen()),
          //     (route) => false); //old user
        } else {
          _isLoading = false;
          update();
          Navigator.pushAndRemoveUntil(
              context,
              getCustomRoute(child: const SignUpScreen()),
              (route) => false); //old user
        }
      } else {
        _isLoading = false;
        update();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedAlertDialog(message: value.message);
          },
        );
      }
    });
  }
}

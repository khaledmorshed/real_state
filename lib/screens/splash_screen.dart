import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_state/screens/reset_password_screen.dart';
import 'package:real_state/screens/sign_in_screen.dart';
import 'package:real_state/screens/update_password_screen.dart';
import '../conts/color_manager.dart';
import 'otp_screen.dart';
import 'sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() {
    Timer(const Duration(seconds: 2), () async {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => SignInScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => OtpScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => UpdatePasswordScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashBackground,
      body: Stack(
        children: [

          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.topRight,
          //     child: Image.asset("assets/vectors/status-bar.png"),
          //   ),
          // ),
          Image.asset("assets/vectors/splash screen/big.png"),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("assets/vectors/splash screen/splash_logo.png"),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Image.asset("assets/vectors/splash screen/home indicator.png", color: Colors.black,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

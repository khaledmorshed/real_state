import 'dart:async';
import 'package:flutter/material.dart';
import '../conts/color_manager.dart';
import 'sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() {
    Timer(const Duration(seconds: 1), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                child: Image.asset("assets/vectors/splash screen/home indicator.png"),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:real_state/utills/global/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utills/conts/color_manager.dart';
import 'sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? _access;

  startTimer() {
    Timer(const Duration(seconds: 2), () async {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignUpScreen()));

      // if(_access != null){
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // }
      // else{
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => SignInScreen()));
      // }

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => OtpScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => UpdatePasswordScreen()));

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));

    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startTimer();
  // }

  loadShPref()async{
    sPref = await SharedPreferences.getInstance();
    _access = sPref!.getString("access");
    print("splass...............token=$_access");

  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    await loadShPref();
    startTimer();
    super.didChangeDependencies();
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

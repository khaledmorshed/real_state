import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/registration_provider.dart';
import 'package:real_state/screens/home_screen.dart';
import 'package:real_state/screens/reset_password_screen.dart';
import 'package:real_state/screens/sign_in_screen.dart';
import 'package:real_state/screens/sign_up_screen.dart';
import 'package:real_state/screens/splash_screen.dart';
import 'package:real_state/screens/update_password_screen.dart';

import 'providers/sign_in_provider.dart';


void main() {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => RegistrationProvider()),
          ChangeNotifierProvider(create: (context) => SignInProvider()),
        ],
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.route: (context)=> HomeScreen(),
        SplashScreen.route: (context)=> SplashScreen(),
        SignUpScreen.route: (context)=> SignUpScreen(),
        SignInScreen.route: (context)=>SignInScreen(),
        ResetPasswordScreen.route: (context)=> ResetPasswordScreen(),
        UpdatePasswordScreen.route: (context)=> UpdatePasswordScreen(),
      },
    );
  }
}


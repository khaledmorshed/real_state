import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/sign_up_provider.dart';
import 'package:real_state/view/screens/home_screen.dart';
import 'package:real_state/view/screens/reset_password_screen.dart';
import 'package:real_state/view/screens/sign_in_screen.dart';
import 'package:real_state/view/screens/sign_up_screen.dart';
import 'package:real_state/view/screens/splash_screen.dart';
import 'package:real_state/view/screens/update_password_screen.dart';
import 'injection_container.dart' as injection;
import 'providers/sign_in_provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context) => injection.sl<SignUpProvider>()),
          ChangeNotifierProvider(create: (context) => injection.sl<SignInProvider>()),
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


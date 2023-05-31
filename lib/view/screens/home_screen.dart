import 'package:flutter/material.dart';
import 'package:real_state/utills/global/global.dart';
import 'package:real_state/view/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utills/conts/color_manager.dart';


class HomeScreen extends StatefulWidget {
  static const String route = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  loadShPref()async{
    sPref = await SharedPreferences.getInstance();
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    await loadShPref();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("home"),
        ),
        drawer: Drawer(
          backgroundColor: ColorManager.amber1,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: TextButton(
                  onPressed: (){

                    sPref!.remove("access");
                    Navigator.pushReplacementNamed(context, SignInScreen.route);
                  },
                  child: Text("Log out"),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          height: 200,
          width: 500,
          color: Colors.green,
          child: Text("welcome"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:real_state/view/screens/TestScreen.dart';
import 'package:real_state/view/screens/home_screen.dart';

import '../../../utills/conts/color_manager.dart';
import '../../../utills/global/global.dart';
import '../../screens/auth_screens/sign_in_screen.dart';
import '../../screens/property_screen.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.amber1,

      //backgroundColor: ColorManager.homeBg,
      child: ListView(
        children: [


          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: TextButton(
              onPressed: (){

                 sPref!.remove("access");
                 Navigator.pushReplacementNamed(context, SignInScreen.route);
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text("Log out"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: TextButton(
              onPressed: (){

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PropertyScreen()));
              },
              child: Text("Log out"),
            ),
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: TextButton(
              onPressed: (){

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TestScreen()));
              },
              child: Text("Log out"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/a_specific_widget_provider.dart';
import 'package:real_state/view/screens/TestScreen.dart';
import 'package:real_state/view/screens/home_screen.dart';
import 'package:real_state/view/screens/property_screen.dart';

import '../../../utills/global/size_box.dart';
import '../../../utills/global/text.dart';
import '../../screens/fovorite_list_screen.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ASpecificWidgetProvider>(
      builder: (context, _provider, _) {
        return BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                  _provider.setButtonSelectionValueForNavBar("home");
                },
                child: Container(
                  //color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        color: Colors.red,
                          onPressed:null,
                          icon: Image.asset("assets/vectors/home_screen/home_icon.png", color: _provider.selectedHomeForBottomNavBar == true ? Colors.blue : null ,),),
                      txt10("Home", textColor: _provider.selectedHomeForBottomNavBar == true ? Colors.blue : Colors.black ,)
                    ],
                  ),
                ),
              ),
              szW20(),
              GestureDetector(

                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PropertyScreen()));
                  _provider.setButtonSelectionValueForNavBar("property");
                },
                child: Container(
                  //color: Colors.green,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                       // color: Colors.red,
                          //style: ButtonStyle(c),
                          onPressed: null,
                          icon: Image.asset("assets/vectors/home_screen/property.png",color: _provider.selectedPropertyForBottomNavBar == true ? Colors.blue : null ,),),
                      txt10("Property", textColor: _provider.selectedPropertyForBottomNavBar == true ? Colors.blue : Colors.black ,)
                    ],
                  ),
                ),
              ),
              szW20(),
              GestureDetector(
                onTap: (){
                  _provider.setButtonSelectionValueForNavBar("add_property");
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(null),
                      ),
                      txt10("Add Property", textColor: _provider.selectedAddPropertyForBottomNavBar == true ? Colors.blue : Colors.black ,)
                    ],
                  ),
                ),
              ),
              szW20(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, FavoriteListScreen.route);
                  _provider.setButtonSelectionValueForNavBar("favorite");
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Image.asset("assets/vectors/home_screen/favorite_non_color.png", color: _provider.selectedFavoriteForBottomNavBar == true ? Colors.blue : null),),
                      txt10("Favorite", textColor: _provider.selectedFavoriteForBottomNavBar == true ? Colors.blue : Colors.black ,)
                    ],
                  ),
                ),
              ),
              szW20(),
              GestureDetector(
                onTap: (){
                  _provider.setButtonSelectionValueForNavBar("settings");
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => TestScreen()));
                },
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: null,
                          icon: Image.asset("assets/vectors/home_screen/settings.png", color: _provider.selectedSettingsForBottomNavBar == true ? Colors.blue : null),),
                      txt10("Settings", textColor: _provider.selectedSettingsForBottomNavBar == true ? Colors.blue : Colors.black ,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

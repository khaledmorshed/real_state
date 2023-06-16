import 'package:flutter/material.dart';

import '../../../utills/global/size_box.dart';
import '../../../utills/global/text.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/vectors/home_screen/home_icon.png"),),
              txt10("Home")
            ],
          ),
          szW20(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/vectors/home_screen/property.png"),),
              txt10("Property")
            ],
          ),
          szW20(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(null),
              ),
              txt10("Add Property")
            ],
          ),
          szW20(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/vectors/home_screen/favorite_non_color.png"),),
              txt10("Favorite")
            ],
          ),
          szW20(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/vectors/home_screen/settings.png"),),
              txt10("Settings")
            ],
          ),
        ],
      ),
    );
  }
}

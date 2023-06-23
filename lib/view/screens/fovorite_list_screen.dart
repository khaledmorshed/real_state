import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/view/widgets/appbar/bottom_nav_bar_widget.dart';
import 'package:real_state/view/widgets/drawer/left_drawer.dart';

import '../../providers/a_specific_widget_provider.dart';
import '../../utills/conts/color_manager.dart';
import '../../utills/global/size_box.dart';
import '../../utills/global/text.dart';
import '../../utills/sdp.dart';
import '../widgets/custom_button.dart';
import '../widgets/favorite_list_widget.dart';

class FavoriteListScreen extends StatefulWidget {
  static const String route = "/FavoriteListScreen";
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel",];

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: ColorManager.homeBg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.homeBg,
        iconTheme: IconThemeData(color: Colors.black),
        title: txt18("Favorite List"),
      ),
      drawer: LeftDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<ASpecificWidgetProvider>(
                builder: (BuildContext context, provider, _){
                  return Column(
                    children: [
                      _allCategoriesButton(provider),
                      szH30(),
                      Column(
                        children: _buttonList.map((e){
                          return FavoriteListWidget();
                        }).toList(),
                      ),
                    ],
                  );
                },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.floatingButton,
        onPressed: (){},
        child: Image.asset("assets/vectors/home_screen/home_2.png"),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _allCategoriesButton(ASpecificWidgetProvider provider){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        txt18("Categories", fontWeight: FontWeight.w500),
        szH15(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: _buttonList.map((e){
              int index = _buttonList.indexOf(e);
              return  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      e,
                      // isSelected: index == _selectedButtonIndex,
                      isSelected: index == provider.selectedButtonIndex,
                      onTap: (){
                        print("index...............${index}");
                        provider.setButtonSelectionValue(index);
                      },
                    ),
                  ),
                  szW10(),
                ],
              );
            }).toList(),
          ),
        ),

      ],
    );
  }
}

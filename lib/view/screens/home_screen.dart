import 'package:flutter/material.dart';
import 'package:real_state/utills/global/global.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/view/screens/auth_screens/sign_in_screen.dart';
import 'package:real_state/view/widgets/custon_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utills/conts/color_manager.dart';
import '../../utills/sdp.dart';
import '../widgets/custom_button.dart';
import '../widgets/drawer/left_drawer.dart';
import '../widgets/home_page/categories_widget.dart';


class HomeScreen extends StatefulWidget {
  static const String route = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _searchController = TextEditingController();

  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel", "House", "Apartment", "Flat",];

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
    SDP.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.homeBg,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: ColorManager.homeBg,

         // title: Text("fdfdf"),

          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: (){},
                child: SizedBox(
                  child: Image.asset("assets/vectors/home_screen/location.png"),
                ),
              ),
              //szW5(),
              txt12("place name", fontWeight: FontWeight.w400)

            ],
          ),
        ),
        drawer: LeftDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              introductionText(),
              szH20(),
              searchAndFilter(),
              szH20(),
              _categoriesMethod(),

            ],
          ),
        )
      ),
    );
  }

  introductionText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt30("Find YourDream Home", fontWeight: FontWeight.w600),
        txt14("We are recognized for exceeding client expectations and delivering great results", textColor: ColorManager.homeWe)
      ],
    );
  }

  searchAndFilter(){
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: CustomTextFormField(
            controller: _searchController,
            hintText: "Search Property",
            prefixIconString: "assets/vectors/home_screen/Search.png",
          ),
        ),
        szW20(),
        Expanded(
          flex: 1,
            child: Image.asset("assets/vectors/home_screen/filter.png"),
        ),

      ],
    );
  }

  bool isSelectedValue = true;

  _categoriesMethod(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt18("Categories", fontWeight: FontWeight.w500),
        szH15(),
         Wrap(
        //   children: [
        //
        //     CustomButton(
        //       "All",
        //       onTap: (){
        //          isSelectedValue = true;
        //         print("all...............");
        //       },
        //       isSelected: isSelectedValue,
        //     ),
        //     szW15(),
        //     CustomButton(
        //       "House",
        //       onTap: (){
        //         print("House...............");
        //       },
        //     ),
        //     szW15(),
        //     CustomButton(
        //       "Apartment",
        //       onTap: (){
        //         print("Apartment...............");
        //       },
        //     ),
        //     szW15(),
        //     CustomButton(
        //       "Flat",
        //       onTap: (){
        //         print("Flat...............");
        //       },
        //     ),
        //     szW15(),
        //     CustomButton(
        //       "Hotel",
        //       onTap: (){
        //         print("Hotel...............");
        //       },
        //     ),
        //
        //
        //   ],



          children: _buttonList.map((e){
            return  Padding(
              padding: const EdgeInsets.all( 8.0),
              child: CustomButton(
                e,
                onTap: (){
                  print("Hotel...............");
                  setState(() {

                  });
                  //bgColor: isSelectedValue ? ColorManager.selectButtonColor : null,
                },
                //bgColor: ColorManager.selectButtonColor,
              ),
            );
          }).toList(),
        ),

        // DefaultTabController(
        //   length: 4,
        //   child: TabBar(
        //         tabs: [
        //           Tab(icon: Icon(Icons.directions_car)),
        //           Tab(child: CustomButton(
        //             "All",
        //             onTap: (){
        //               setState(() {
        //                 isSelectedValue = true;
        //               });
        //               print("all...............");
        //             },
        //             isSelected: isSelectedValue,
        //             bgColor: isSelectedValue ? ColorManager.selectButtonColor : null,
        //           ),),
        //           Tab(child: CustomButton(
        //             "All",
        //             onTap: (){
        //               setState(() {
        //                 isSelectedValue = true;
        //               });
        //               print("all...............");
        //             },
        //             isSelected: isSelectedValue,
        //             bgColor: isSelectedValue ? ColorManager.selectButtonColor : null,
        //           ),),
        //           Tab(child: CustomButton(
        //             "All",
        //             onTap: (){
        //               setState(() {
        //                 isSelectedValue = true;
        //               });
        //               print("all...............");
        //             },
        //             isSelected: isSelectedValue,
        //             bgColor: isSelectedValue ? ColorManager.selectButtonColor : null,
        //           ),)
        //         ],
        //       ),
        // ),


      ],
    );
  }
}

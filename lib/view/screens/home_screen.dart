import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/a_specific_widget_provider.dart';
import 'package:real_state/utills/global/global.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/view/screens/auth_screens/sign_in_screen.dart';
import 'package:real_state/view/widgets/custon_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/home_screen_provider.dart';
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

  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel", "Apartment2", "Flat2",];


  loadShPref()async{
    sPref = await SharedPreferences.getInstance();
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    await loadShPref();
    super.didChangeDependencies();
  }
  // int _selectedButtonIndex = -1;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Column(
              children: [
                introductionText(),
                szH20(),
                searchAndFilter(),
                szH20(),

                Consumer<ASpecificWidgetProvider>(
                    builder: (BuildContext context, provider, _){
                  return _categoriesMethod(provider);
                }),

                szH30(),

                Consumer<HomeScreenProvider>(
                    builder: (BuildContext context, _provider, _){
                    return  _allCategory(_provider);
                },),
                //_allCaterogry(),
              ],
            ),
          ),
        )
      ),
    );
  }

  introductionText(){
    print("introductionText...........................");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt30("Find YourDream Home", fontWeight: FontWeight.w600),
        txt14("We are recognized for exceeding client expectations and delivering great results", textColor: ColorManager.homeWe)
      ],
    );
  }

  searchAndFilter(){
    print("searchAndFilter...........................");
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


  _categoriesMethod(ASpecificWidgetProvider provider){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt18("Categories", fontWeight: FontWeight.w500),
        szH15(),
         Wrap(
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

      ],
    );
  }

  _allCategory(HomeScreenProvider _provider){
    return Container(
      height: 200,
     // color: Colors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //txt30("Explore "),
              txt18("Explore Your Dream Place"),
              CustomButton("Click here", onTap: (){},),
            ],
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, index){
                 // print("inde................$index");
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Stack(
                      children: [
                        if(index == 3)ClipRRect(
                         // borderRadius: BorderRadius.circular(10),
                          child: Container(

                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    //color: Colors.red,
                                    color: Colors.black.withOpacity(0.6), // Shadow color
                                    spreadRadius: 100,
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.normal
                                  ),
                                ],
                              ),
                              child: Image.asset("assets/vectors/home_screen/category/${index}.png"),
                            ),
                        )
                        else Container(
                          height: 100,
                          child: Image.asset("assets/vectors/home_screen/category/${index}.png"),
                        ),
                       // Text("data"),
                        if(index == 3) Positioned.fill(
                          // bottom: 10,
                          //top: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("All"),
                          ),
                        )
                        else Positioned.fill(
                          // bottom: 10,
                           top: 50,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${_provider.categoryList[index]}"),
                                Text("data"),
                              ],
                            ),
                          ),
                        )

                      ]
                    ),
                  );
                },),
            ),
          ),
        ],
      ),
    );
  }
}

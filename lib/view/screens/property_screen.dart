import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/property_provider.dart';
import 'package:real_state/utills/conts/color_manager.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/view/widgets/custom_button.dart';

import '../../providers/a_specific_widget_provider.dart';
import '../../utills/sdp.dart';
import '../widgets/appbar/bottom_nav_bar_widget.dart';
import '../widgets/drawer/left_drawer.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {

  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel",];

  @override
  void dispose() {
    print('Screen exited!.....................property');
  //  SchedulerBinding.instance.addPostFrameCallback((_) {
      print('Screen exited!.....................property_2');
      //Provider.of<ASpecificWidgetProvider>(context, listen: false).setButtonSelectionValueForNavBar("home");
    //build(context);
   // });
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: ColorManager.homeBg,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: ColorManager.homeBg,
        title: txt18("Property", fontWeight: FontWeight.w500),
      ),
      drawer: LeftDrawer(),
      body:   Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: CustomScrollView(
          slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset("assets/vectors/property_screen/Buy_Icon.png"),
                          szH5(),
                          txt16("Buy", fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Image.asset("assets/vectors/property_screen/Sell_icon.png"),
                          szH5(),
                          txt16("Sell", fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Image.asset("assets/vectors/property_screen/Rent_Icon.png"),
                          szH5(),
                          txt16("Rent", fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: szH30(),
              ),
            SliverToBoxAdapter(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: _buttonList.map((e){
                  int index = _buttonList.indexOf(e);
                  return  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Consumer<PropertyProvider>(
                          builder: (context, _provider, _) {
                            return CustomButton(
                              e,
                              // isSelected: index == _selectedButtonIndex,
                              isSelected: index == _provider.selectedButtonIndex,
                              onTap: (){
                                print("index...............${index}");
                                _provider.setButtonSelectionValue(index);
                              },
                            );
                          }
                        ),
                      ),
                      szW10(),
                    ],
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: szH30(),
            ),
            SliverPadding(
              padding: EdgeInsets.all(0),
              sliver: Consumer<PropertyProvider>(
                  builder: (context, _provider, _) {
                  return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: _provider.dummyImage.length,
                              (BuildContext context, int index){
                            return _imagesList(_provider, index);
                        },

                        ),

                    );
                }
              ),
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

  _imagesList(PropertyProvider _provider, int index){
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: SDP.sdp(180),
              //color: Colors.red,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("${_provider.dummyImage[index]}", fit: BoxFit.cover,),
              ),
            ),
            Positioned.fill(
              //  bottom: SDP.sdp(10),
              //  top: SDP.sdp(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 15, left: 20),
                          child: txt10("Sale", textColor: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15, right: 20),
                          child: Image.asset("assets/vectors/home_screen/favorite_icon.png"),
                        )
                      ],
                    ),
                  ),

                  Spacer(),

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          txt10("Villa On Washington Ave", textColor: Colors.white),

                          Row(
                            children: [
                              Image.asset("assets/vectors/home_screen/location.png", color: Colors.white,),
                              txt10("adresss", textColor: Colors.white)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        szH12(),
        Container(
          child: Row(
            children: [
              Image.asset("assets/vectors/home_screen/Beds_Icon.png"),
              szW5(),
              txt12("5"),
              szW10(),
              Image.asset("assets/vectors/home_screen/Line 2.png"),
              szW10(),
              Image.asset("assets/vectors/home_screen/Bath icon.png"),
              szW5(),
              txt12("3"),
              szW10(),
              Image.asset("assets/vectors/home_screen/Ft icon.png"),
              szW5(),
              txt12("1700"),
              szW2(),
              txt12("ft2"),
              szW20(),
              Row(
                children: [
                  txt16("tk1000/", textColor: ColorManager.dollarColor),
                  txt16("Day"),
                ],
              ),
            ],
          ),
        ),
        szH30(),
      ],
    );
  }
}

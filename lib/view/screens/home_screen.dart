import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/a_specific_widget_provider.dart';
import 'package:real_state/utills/global/global.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/view/screens/auth_screens/sign_in_screen.dart';
import 'package:real_state/view/screens/category_screen.dart';
import 'package:real_state/view/screens/filter_screen.dart';
import 'package:real_state/view/widgets/custon_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/home_screen_provider.dart';
import '../../utills/conts/color_manager.dart';
import '../../utills/sdp.dart';
import '../widgets/appbar/bottom_nav_bar_widget.dart';
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

  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel",];


  loadShPref()async{
    sPref = await SharedPreferences.getInstance();
  }

  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    print("did...........................10");
    await loadShPref();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    print("init...........................10");
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("init...........................10");
     Provider.of<ASpecificWidgetProvider>(context, listen: false).setButtonSelectionValueForNavBar("home");
    });
    super.initState();
  }

  @override
  void didPopNext() {
    print("didpop......................");
    // User exited the current screen
    // Perform any necessary actions here
  }

  @override
  void dispose() {
    print('Screen exited!.....................');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
        opacity: 0,
      child: IconButton(
        icon: Icon(Icons.no_cell),
        onPressed: (){},
      ),
    );

    SDP.init(context);
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _introductionText(),
              szH20(),
              _searchAndFilter(),
              szH20(),
              Consumer<ASpecificWidgetProvider>(
                  builder: (BuildContext context, provider, _){
                return _allCategoriesButton(provider);
              }),
              szH30(),
              Consumer<HomeScreenProvider>(
                  builder: (BuildContext context, _provider, _){
                  return  Column(
                    children: [
                      _allCategories(_provider),
                      szH50(),
                      _latestProperties(_provider),
                      szH50(),
                      _recommendedFor(_provider),
                      szH50(),
                      _clientMethod(_provider),
                      szH50(),
                      _realEstateBlog(),
                      szH50(),
                    ],
                  );
              },),
              //_allCaterogry(),
            ],
          ),
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


  _introductionText(){
    print("introductionText...........................");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt30("Find YourDream Home", fontWeight: FontWeight.w600),
        txt14("We are recognized for exceeding client expectations and delivering great results", textColor: ColorManager.homeWe)
      ],
    );
  }

  _searchAndFilter(){
    print("searchAndFilter...........................");
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
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
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FilterScreen()));
                },
                  child: Image.asset("assets/vectors/home_screen/filter.png"),
              ),
          ),

        ],
      ),
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

  _allCategories(HomeScreenProvider _provider){
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
              //CustomButton("Click here", onTap: (){},),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CategoryScreen()));
                    },
                    child: Row(
                      children: [
                        txt14("See All", textColor: ColorManager.seeAll),
                        Image.asset("assets/vectors/home_screen/arrow_right.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          szH15(),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: SDP.sdp(148),
              width: SDP.sdp(1160),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, index){
                 // print("inde................$index");
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        if(index == 3)GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => CategoryScreen()));
                          },
                          child: Container(
                            height: SDP.sdp(148),
                            width: SDP.sdp(160),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.green,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.fill,)),
                            ),
                        )
                        else Container(
                          height: SDP.sdp(148),
                          width: SDP.sdp(160),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                           // color: Colors.red
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.cover,)),
                        ),
                       // Text("data"),
                        if(index == 3) Positioned.fill(
                          // bottom: 10,
                          //top: 50,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => CategoryScreen()));
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: txt14("See All", textColor: Colors.white)
                            ),
                          ),
                        )
                        else Positioned.fill(
                           bottom: SDP.sdp(10),
                           top: SDP.sdp(95),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                txt14("${_provider.categoryList[index]}", textColor: Colors.white),
                                txt12("5 properties", textColor: Colors.white),
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

  _latestProperties(HomeScreenProvider _provider){
    return Container(
      height: SDP.sdp(265),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txt18("Latest Properties"),
              GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    txt14("See All", textColor: ColorManager.seeAll),
                    Image.asset("assets/vectors/home_screen/arrow_right.png"),
                  ],
                ),
              ),
            ],
          ),
          szH15(),
          Container(
            height: SDP.sdp(220),
           // width: SDP.sdp(303),
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        //szW10(),
                       // txt16("title"),
                        Stack(
                            children: [
                              if(index == 3)ClipRRect(
                                //borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: SDP.sdp(205),
                                  width: SDP.sdp(303),
                                  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.red,
                                    //     //color: Colors.black.withOpacity(0.6), // Shadow color
                                    //     spreadRadius: 100,
                                    //     blurRadius: 10,
                                    //     blurStyle: BlurStyle.normal
                                    //   ),
                                    // ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    ),
                                      child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.cover,),
                                  ),
                                ),
                              )
                              else Container(
                                height: SDP.sdp(180),
                                width: SDP.sdp(303),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                    child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.cover,),
                                ),
                              ),
                              // Text("data"),
                              if(index == 3) Positioned.fill(
                                // bottom: 10,
                                //top: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: txt14("See All", textColor: Colors.white),
                                ),
                              )
                              else Positioned.fill(
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

                            ]
                        ),

                        szH15(),

                        if(index != 3)Container(
                          //height: 50,
                          width: SDP.sdp(303),
                          //color: Colors.green,
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
                      ],
                    ),
                  ),
                );
              },),
          ),
        ],
      ),
    );
  }

  _recommendedFor(HomeScreenProvider _provider){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txt18("Recommend For You"),
              GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    txt14("See All", textColor: ColorManager.seeAll),
                    Image.asset("assets/vectors/home_screen/arrow_right.png"),
                  ],
                ),
              ),
            ],
          ),
          szH15(),
          Container(
            width: double.infinity,
            height: SDP.sdp(100),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [

                       Container(
                        height: SDP.sdp(80),
                        width: SDP.sdp(100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.cover,),
                        ),
                      ),

                      szW20(),

                      Container(
                        //height: 50,
                        //color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            txt12("Garden City", fontWeight: FontWeight.w500),
                            Row(
                              children: [
                                Image.asset("assets/vectors/home_screen/location.png", color: ColorManager.homeWe,),
                                txt10("adresss", textColor: ColorManager.homeWe)
                              ],
                            ),
                            szH5(),
                            txt12("tk 2500", textColor: ColorManager.dollarColor),
                            szH8(),
                            Row(
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

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },),

          ),
        ],
      ),
    );
  }

  _clientMethod(HomeScreenProvider _provider){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            txt18("Client Testimonials"),
            GestureDetector(
              child:  Image.asset("assets/vectors/home_screen/arrow_right.png"),
            ),
          ],
        ),
        szH15(),
          Container(
            height: MediaQuery.of(context).size.height * .35,
           // width: MediaQuery.of(context).size.width,
            // color: Colors.red,
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .35,
                aspectRatio: 16 / 9,
                viewportFraction: 1.05,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                //autoPlay: true,
                autoPlayCurve: Curves.decelerate,
                //enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason){
                  _provider.setActiveIndexValue(index);
                }
              ),
              items: _provider.clientSlider.map((index) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                         // color:Colors.yellow,
                          child: CircleAvatar(
                            radius: SDP.sdp(80),
                            //child: Image.asset(index,),
                            backgroundImage: Image.asset(index,).image
                            //backgroundImage: NetworkImage(index),
                          )
                        ),
                        szH5(),
                        txt18("name"),
                        szH5(),
                        txt12("location"),
                        szH10(),
                        //txt10("Real estate ls."),
                        Text("Real estate is a smart investment that offers stable income, appreciation, security, and endless opportunities to achieve financial goals.", maxLines: 5, style: TextStyle(fontSize: 10),)

                      ],
                    ),
                  );
                });
              }).toList(),
            ),
          ),
          szH30(),
          AnimatedSmoothIndicator(
            activeIndex: _provider.activeIndex,
            count: _provider.clientSlider.length,
            //count: 2,
            effect: SlideEffect(
                dotWidth: 10,
                dotHeight: 10
            ),
          )
      ],
    );
  }

  _realEstateBlog(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            txt18("Our Real Estate Blog"),
            GestureDetector(
              onTap: (){},
              child: Row(
                children: [
                  txt14("See All", textColor: ColorManager.seeAll),
                  Image.asset("assets/vectors/home_screen/arrow_right.png"),
                ],
              ),
            ),
          ],
        ),
        szH15(),
        Container(
          height: SDP.sdp(245),
          width: double.infinity,
          //color: Colors.red,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, index){
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    Container(
                      height: SDP.sdp(123),
                      width: SDP.sdp(230),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.green,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/vectors/home_screen/category/${index}.png", fit: BoxFit.cover,)
                      ),
                    ),
                    //szH5(),
                    Container(
                      height: SDP.sdp(122),
                      width: SDP.sdp(230),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          txt14("Why Live in New York"),
                          szH5(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              txt12("Date"),
                              Row(
                                children: [
                                  Image.asset("assets/vectors/home_screen/Clock.png",),
                                  szW5(),
                                  txt12("Hour")
                                ],
                              ),
                            ],
                          ),
                          szH10(),
                          Text("Lorem ipsum dolor sit amet, conse ctetur adipiscing. Interdum amet, felis", maxLines: 3, style: TextStyle(fontSize: 10),)
                        ],
                      ),
                    ),

                  ],
                ),
              );
            },),
        ),
      ],
    );
  }

}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/home_screen_provider.dart';
import 'package:real_state/utills/sdp.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utills/global/size_box.dart';
import '../../utills/global/text.dart';

class DetailsScreen extends StatefulWidget {
  static const String route = "/DetailsScreen";
  const DetailsScreen({Key? key,}) : super(key: key);


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      body: Consumer<HomeScreenProvider>(
        builder: (context, _provider, _) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                //backgroundColor: Colors.pink,
                backgroundColor: Colors.white,
                //appbar will not disapper
                  leadingWidth: 0,
                  pinned: false,
                  elevation: 0,
                  //when scroll down star then image will start showing
                  floating: true,
                  expandedHeight: MediaQuery.of(context).size.height * .35,
                 // expandedHeight: 200,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/vectors/details_screen/Back.png", fit: BoxFit.cover,),
                      txt18("Details"),
                      Image.asset("assets/vectors/details_screen/Icon.png"),
                    ],
                  ),
                  flexibleSpace:
                  //Image.asset("assets/vectors/home_screen/category/0.png", fit: BoxFit.cover,),
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    //height: 200,
                    width: double.infinity,
                   // color: Colors.grey,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .35,
                           width: double.infinity,
                           //color: Colors.yellow,
                           color: Colors.white,
                          child: CarouselSlider(
                            options: CarouselOptions(
                                height: MediaQuery.of(context).size.height * .35,
                                //height: 200,
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
                                  height: MediaQuery.of(context).size.height * .35,
                                  //height: 200,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 10),
                                  child: Container(
                                    // color:Colors.yellow,
                                      child:Image.asset(index, fit: BoxFit.cover,)
                                  ),
                                );
                              });
                            }).toList(),
                          ),
                        ),

                        // Container(
                        //   height: MediaQuery.of(context).size.height * .35,
                        //   width: double.infinity,
                        //   child: Image.asset("assets/vectors/home_screen/category/0.png", fit: BoxFit.cover,),
                        // ),

                        Positioned(
                          top: 200,
                          left: 150,
                          child: AnimatedSmoothIndicator(
                            activeIndex: _provider.activeIndex,
                            count: _provider.clientSlider.length,
                            //count: 2,
                            effect: SlideEffect(
                                dotWidth: 10,
                                dotHeight: 10
                            ),
                          )
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 230),
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     color: Color(0xff5c63f1),
              //     height: 20,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: <Widget>[
              //         Container(
              //           height: 20,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.only(
              //               topLeft: const Radius.circular(20.0),
              //               topRight: const Radius.circular(20.0),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Container(
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(50),
                    //       topRight: Radius.circular(50),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 300,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(20),
                    //       topRight: Radius.circular(20),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.only(
                        //   topLeft: Radius.circular(20),
                        //   topRight: Radius.circular(20),
                        // ),
                      ),
                    ),
                    Container(
                      height: 300,
                      color: Colors.white,
                    ),
                    Container(
                      height: 300,
                      color: Colors.red,
                    ),
                    Container(
                      height: 300,
                      color: Colors.white,
                    ),
                    Container(
                      height: 300,
                      color: Colors.red,
                    ),
                    Container(
                      height: 300,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
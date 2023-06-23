import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utills/conts/color_manager.dart';
import 'package:real_state/utills/global/text.dart';

import '../../utills/sdp.dart';

class DetailsScreen extends StatefulWidget {
  static const String route = "/DetailsScreen";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: ColorManager.homeBg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              //  height: 600,
                //height: double.infinity,
                child: Stack(
                 // fit: StackFit.expand,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: SDP.sdp(350),
                          //color: Colors.red,
                          width: double.infinity,
                          child: Image.asset("assets/vectors/home_screen/category/0.png", fit: BoxFit.cover,),
                        ),

                        Positioned.fill(
                          top: 50,
                          bottom: 230,
                          //bottom: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/vectors/details_screen/Back.png", fit: BoxFit.cover,),
                              txt18("Details"),
                              Image.asset("assets/vectors/details_screen/Icon.png"),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: 200,
                          bottom: 50,
                          left: 100,
                          right: 100,
                          child: Container(
                            height: 20,
                            width: 50,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    Positioned.fill(
                      top: 270,
                      //bottom: 200,
                     // left: 120,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                          ),
                          color: Colors.grey,
                         // color: Colors.blue,
                        ),
                       // height: 100,
                        child: ListView(
                            children: [
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),
                              txt18("dfdfdfd"),


                            ],

                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

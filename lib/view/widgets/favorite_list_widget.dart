
import 'package:flutter/material.dart';

import '../../utills/conts/color_manager.dart';
import '../../utills/global/size_box.dart';
import '../../utills/global/text.dart';
import '../../utills/sdp.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15, bottom: 30),
        width: double.infinity,
        height: SDP.sdp(195),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: SDP.sdp(99),
                //color: Colors.yellow,
                child: Row(
                  children: [
                    Container(
                      height: SDP.sdp(99),
                      width: SDP.sdp(80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/vectors/home_screen/category/${0}.png", fit: BoxFit.cover,),
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
                    Spacer(),
                    Container(
                     // margin: EdgeInsets.only(to),
                     // color: Colors.red,
                      height: SDP.sdp(99),
                      child: Align(
                        alignment: Alignment.topRight,
                          child: Image.asset("assets/vectors/favorite_list_screen/Delete 2.png",),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                //color: Colors.red,
                 // height: 10,
                  child: Image.asset("assets/vectors/favorite_list_screen/Line6.png",fit: BoxFit.fill,),
              ),
            ),
            szH10(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Booking Now", style: TextStyle(fontSize: 14, color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: ColorManager.buttonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onPressed: () {
                       // _formValidationAndSave();
                      },
                    ),
                  ),
                  szW20(),
                  Expanded(
                    child: ElevatedButton(
                      child: Row(
                        children: [
                          Image.asset("assets/vectors/favorite_list_screen/Call Icon.png"),
                          szW10(),
                          Text("Show Contact", style: TextStyle(fontSize: 14, color: Colors.black),),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: ColorManager.homeBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      onPressed: () {
                        // _formValidationAndSave();
                      },
                    ),
                  ),

                ],
              ),
            ),
           // szH5(),
          ],
        ),

      ),
    );
  }
}

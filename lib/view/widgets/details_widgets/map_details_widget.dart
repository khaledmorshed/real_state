import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';

import '../../../utills/conts/color_manager.dart';
import '../../../utills/sdp.dart';

class MapDetailsWidget extends StatelessWidget {
  //const MapDetailsWidget({Key? key}) : super(key: key);

  List starlist = [1,2,3,4,5];
  int value = 3;

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt18("Adress", fontWeight: FontWeight.w500),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/vectors/details_screen/location.png"),
                txt12("Adress"),
              ],
            ),
           SizedBox(
             width: SDP.sdp(120),
             child: ElevatedButton(
                child: Text("View Map", style: TextStyle(fontSize: 14, color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                 // minimumSize: const Size.fromHeight(18),
                 // minimumSize: const Size.fromWidth(80),
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
          ],
        ),
        Row(
          children: [
            Container(
              child: Wrap(
                children: starlist.map((e) {
                  if(value>0) {
                    value--;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset("assets/vectors/details_screen/star_color.png"),
                    );
                  }
                  else {
                    value--;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset("assets/vectors/details_screen/star_not_color.png"),
                    );
                  }
                }).toList(),
              )
            ),
            txt18("(4.8)")
          ],
        ),
        Row(
          children: [
            txt22("tk 230", textColor: ColorManager.dollarColor),
            szW5(),
            txt10("price", textColor: ColorManager.otpTimer),
          ],
        )
      ],
    );
  }
}

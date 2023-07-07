import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utills/conts/color_manager.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/utills/sdp.dart';

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          txt16("Contact", fontWeight: FontWeight.w500),
          szH10(),
          Container(
           // color: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: SDP.sdp(60),
                    //child: Image.asset(index,),
                    backgroundImage: Image.asset("assets/0.png").image
                  //backgroundImage: NetworkImage(index),
                ),
                szW20(),
                Expanded(
                  child: Container(
                   // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            txt12("Seller", textColor: ColorManager.otpTimer),
                            SizedBox(height: 3,),
                            txt14("Name"),
                          ],
                        ),
                        Container(
                          //color: Colors.grey,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: (){
                              },
                              child: txt14("See Profile"),
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
          szH10(),
          Divider(
            height: 1,
            thickness: 1,
             color: ColorManager.hintTextColor,
            //color: ColorManager.amber2,
          ),
          szH10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txt14("Contact No.", fontWeight: FontWeight.w500),
              txt14("0174656666"),
            ],
          ),
          szH10(),
          Divider(
            height: 1,
            thickness: 1,
            color: ColorManager.hintTextColor,
            //color: ColorManager.amber2,
          ),
          szH10(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              txt14("Email", fontWeight: FontWeight.w500),
              txt14("s.m.morshed10@gamil.com"),
            ],
          ),
          szH10(),
          Divider(
            height: 1,
            thickness: 1,
            color: ColorManager.hintTextColor,
            //color: ColorManager.amber2,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utills/sdp.dart';

import '../../../utills/conts/color_manager.dart';
import '../../../utills/global/size_box.dart';
import '../../../utills/global/text.dart';

class ReviewDetailsWidget extends StatelessWidget {
   ReviewDetailsWidget({Key? key}) : super(key: key);

  List starlist = [1,2,3,4,5];
  int value = 4;

  List reviewList = [1,2];

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Container(
      child: Column(
        children: [
          Column(
            children: reviewList.map((e) {
              value = 4;
              return  Container(
                // color: Colors.green,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: SDP.sdp(40),
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
                                    txt12("Name", textColor: ColorManager.otpTimer),
                                    SizedBox(height: 3,),
                                    txt14("date"),
                                  ],
                                ),
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
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    szH20(),
                    txt12("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
                    szH20(),
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: ColorManager.hintTextColor,
                      //color: ColorManager.amber2,
                    ),
                    szH30(),
                  ],
                ),
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}

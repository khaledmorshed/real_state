import 'dart:io';

import 'package:flutter/material.dart';

class SDP{
  static late int dimen;
  static late double width;
  static late double height;
  static late double ratio;
  static late BuildContext context;

  static void init(BuildContext c){
    context = c;
    width = MediaQuery.of(context).size.shortestSide;
    // print(width);
    ratio = MediaQuery.of(context).size.aspectRatio;
    // print(ratio);
    height = MediaQuery.of(context).size.longestSide;
    // print(height);
  }

  static double sdp(double dp) {

    if(dp==500 && Platform.isAndroid && height>800 && width<550){
      return height - SDP.sdp(240);
    }
    return (dp /(width>550? 500 : 420) ) * width;
  }

}
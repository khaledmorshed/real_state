import 'package:flutter/material.dart';

class ColorManager {
  static Color splashBackground = HexColor.fromHex("#1F53B9");
  static Color signUPBackground = HexColor.fromHex("#F4F7FD");
  static Color signUpHey = Color.fromRGBO(0, 0, 0, 0.5);
  static Color signAgree = Color.fromRGBO(0, 0, 0, 0.5);
  static Color updatePlease = HexColor.fromHex("#585858");
  static Color otpTimer = HexColor.fromHex("#A6A6A6");
  static Color otpResend = HexColor.fromHex("#1F53B9");
  static Color hintTextColor = HexColor.fromHex("#A6A6A6");
  static Color buttonColor = HexColor.fromHex("#1F53B9");
  static Color seeAll = HexColor.fromHex("#1F53B9");
  static Color dollarColor = HexColor.fromHex("#F7941D");
  static Color floatingButton = HexColor.fromHex("#1F53B9");
  static Color inactiveSliding = Color.fromRGBO(31, 83, 185, 0.1);


  //for home screen
  static Color homeBg = HexColor.fromHex("#F4F7FD");
  static Color homeWe = HexColor.fromHex("#585858");


  static Color selectButtonColor = HexColor.fromHex("#1F53B9");



  static Color white1 = HexColor.fromHex("#FFFFFF");
  static Color lightPink2 = Color.fromARGB(255, 255, 255, 1);

  static Color red1 = Color.fromARGB(255, 241, 207, 213);
  static Color red2 = Color(0xfff06292);
  static Color red3 = Color(0xffec407a);
  static Color red4 = Color(0xfff48fb1);
  static Color red5 = Color(0xfff44336);

  static Color depOrange1 = Color(0xfffbe9e7);
  static Color depOrange2 = Color(0xffffccbc);
  static Color depOrange3 = Color(0xffff8a65);
  static Color depOrange4 = Color(0xffff57043);

  static Color orange1 = Color(0xfffffce0);
  static Color orange2 = Color(0xfffffe0b2);
  static Color orange3 = Color(0xffffcc80);
  static Color orange4 = Color(0xfff57c00);

  static Color amber1 = Color(0xffffecb3);
  static Color amber2 = Color(0xffffd54f);
  static Color amber3 = Color(0xffffca28);
  static Color amber4 = Color(0xffffb300);

  static Color yellow1 = Color(0xfffffde7);
  static Color yellow2 = Color(0xfffff9c3);
  static Color yellow3 = Color(0xfffff59d);
  static Color yellow4 = Color(0xfffff176);
  static Color yellow5 = Color(0xfffbc02d);

  static Color lime1 = Color(0xffe6ee9c);
  static Color lime2 = Color(0xffdce775);
  static Color lime3 = Color(0xffd4e157);
  static Color lime4 = Color(0xffc0ca33);

  static Color liGreen1 = Color(0xffc5e1a5);
  static Color liGreen2 = Color(0xffaed581);
  static Color liGreen3 = Color(0xff9ccc65);
  static Color liGreen4 = Color(0xff3369f38);

  static Color green1 = Color(0xffa5d6a7);
  static Color green2 = Color(0xff81c784);
  static Color green3 = Color(0xff66bb6a);
  static Color green4 = Color(0xff1b5e20);

  static Color cyan1 = Color(0xff80deea);
  static Color cyan2 = Color(0xff4dd0e1);
  static Color cyan3 = Color(0xff26c6da);
  static Color cyan4 = Color(0xff00acc1);

  static Color liBlue1 = Color(0xff4fc3f7);
  static Color liBlue2 = Color(0xff039be5);
  static Color liBlue3 = Color(0xff01579b);

  static Color blue1 = Color(0xff64b5f6);
  static Color blue2 = Color(0xff42a5f5);
  static Color blue3 = Color(0xff1565c0);
  static Color blue4 = Color(0xff0d47a1);

  static Color purple1 = Color(0xffe1bee7);
  static Color purple2 = Color(0xffce93d8);
  static Color purple3 = Color(0xffba68c8);
  static Color purple4 = Color(0xffaa00ff);

  static Color grey1 = Color(0xfff5f5f5);
  static Color grey2 = Color(0xffeeeeee);
  static Color grey3 = Color(0xffe0e0e0);
  static Color grey4 = Color(0xff757575);
  static Color grey5 = Color(0xff616161);
  static Color grey6= Color(0xff303030);

  static Color blackOnly = Color(0x00000000);
  static Color whiteOnly = Color(0xffffffff);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
import 'package:flutter/material.dart';

import '../conts/color_manager.dart';


class TextFormFieldDecoration extends StatelessWidget {
  IconData? suffixIcon;
  IconData? prefixIcon;
  String? hintText;
  bool? isPassword;
  bool? isFilled;
  bool? fillColor;
  double? outLineBoarder;
  double? contentPadding;
  double? iconPadding;
  String? prefixIconString;
  bool? isOutllineboarder;



  TextFormFieldDecoration({this.suffixIcon, this.prefixIcon, this.hintText,
      this.isPassword, this.isFilled, this.fillColor, this.outLineBoarder, this.iconPadding, this.contentPadding, this.prefixIconString, this.isOutllineboarder});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        decoration: decoaration(),
       // obscureText: isPassword == null ? false : isPassword!,
      ),
    );
  }

  InputDecoration decoaration() {
    return InputDecoration(
        border: isOutllineboarder == null ?  null : OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(outLineBoarder!)),
        ),
     //contentPadding: contentPadding == null ? null : EdgeInsets.symmetric(horizontal: contentPadding!, vertical: contentPadding!),
      suffix: suffixIcon == null ? null : Padding(
        padding: iconPadding == null ? const EdgeInsets.all(0) : EdgeInsets.only(left: iconPadding!, right: iconPadding!),
        child: Icon(suffixIcon!),
      ),
      prefixIcon: prefixIconString == null ? null : SizedBox(
      height: 4,
      child: Image.asset(prefixIconString!),
    ),
      hintText: hintText == null ? null : hintText!,
      filled: true,
      fillColor: Colors.white
      //enabled: true,
       // focusColor: Colors.red
    );
  }
}
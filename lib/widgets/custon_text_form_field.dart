import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
   String? hintText;
   IconData? icon;
   bool? isPassword;
   Color? hintColor;
   Color? textColor;
   TextInputType? textInputType;
   Function? onChanged;
   TextEditingController? controller;
   Function? onSubmit;
   bool? isReadOnly;
   EdgeInsets? padding;
   double? height;
   double? font_size;
   String? errorText;



  CustomTextFormField({
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.textInputType,
    this.controller,
    this.hintColor,
    this.textColor,
    this.onChanged,
    this.onSubmit,
    this.isReadOnly = false,
    this.padding,
    this.height = 0,
    this.font_size=14,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    // print("padding...................$padding+eee........$errorText");
    return Container(
      padding: /*padding*/EdgeInsets.all(0),
      height: height == 0 ? null : height,

      child: Center(

        child: TextFormField(

          readOnly: isReadOnly!,
         // onSubmitted: onSubmit!,

         // onTap: onSubmit!,
          onTap: onSubmit != null ? () => onChanged!() : null,
          controller: controller!,
          obscureText: isPassword!,
          keyboardType: textInputType,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged!= null ? (String txt) => onChanged!(txt) : null,
          style: TextStyle(
            color: textColor,
            fontSize: font_size,
            fontWeight: FontWeight.w500,
          ),

          decoration: InputDecoration(
            errorText: errorText == "" ? null : errorText,
            suffixIcon: Icon(icon),
            //border: InputBorder.none,
            border: UnderlineInputBorder(),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(
            //       color: FirewoodColor.BorderColorOnFocused, width: 2.0),
            //   // borderRadius: BorderRadius.all(Radius.circular(0)),
            //   // gapPadding: 0
            // ),
            // hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: font_size,
              // fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                //  color: FirewoodColor.BorderColorDefault, width: 1.0),
            ),
        ),
      ),
    )
    )
    );
  }
}
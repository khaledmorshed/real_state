import 'package:flutter/material.dart';

import '../../utills/global/global.dart';
import '../../utills/sdp.dart';

class CustomTextFormField extends StatelessWidget {
  IconData? suffixIcon;
  IconData? prefixIcon;
  String? hintText;
  IconData? icon;
  bool isPassword;
  Color? hintColor;
  double? hintTextSize;
  Color? textColor;
  TextInputType? textInputType;
  Function? onChanged;
  Function? validation;
  TextEditingController? controller;
  Function? onSubmit;
  bool? isReadOnly;
  EdgeInsets? padding;
  double? height;
  double? fontSize;
  String? errorText;
  double? outLineBoarder;
  bool? isOutLineboarder;
  Color? fillColor;
  double? contentPadding;
  double? iconPadding;
  String? prefixIconString;
  String? suffixIconString;
  bool? isFilled;
  FontWeight? fontWeight;

  CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.icon,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.controller,
    this.hintColor,
    this.textColor = Colors.black,
    this.onChanged,
    this.onSubmit,
    this.isReadOnly = false,
    this.padding,
    this.height = 0,
    this.fontSize = 14,
    this.errorText,
    this.validation,
    this.contentPadding,
    this.fillColor = Colors.white,
    this.isOutLineboarder,
    this.outLineBoarder,
    this.iconPadding,
    this.prefixIconString,
    this.suffixIconString,
    this.isFilled = true,
    this.fontWeight = FontWeight.w400,
    this.hintTextSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    //print("padding...................$isPassword+fonsize........$fontSize.....+obSecureConfirmPasswordValue.............${obSecureValue.value}");
    return Container(
      padding: /*padding*/ EdgeInsets.all(0),
      height: height == 0 ? null : SDP.sdp(height!),
      //width: 300,
      child: Center(
        child: ValueListenableBuilder(
            valueListenable: obSecureValue,
            builder: (context, value, _) {
              return TextFormField(
                readOnly: isReadOnly!,
                onTap: onSubmit != null ? () => onSubmit!() : null,
                validator: validation != null
                    ? (String? txt) => validation!(txt)
                    : null,
                controller: controller!,
                obscureText: isPassword,
                keyboardType: textInputType,
                textAlignVertical: TextAlignVertical.center,
                onChanged:
                    onChanged != null ? (String txt) => onChanged!(txt) : null,
                style: TextStyle(
                  color: textColor,
                  fontSize: SDP.sdp(fontSize!),
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  //border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: isOutLineboarder == null
                      ? null
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(outLineBoarder!),
                          ),
                          borderSide: BorderSide.none,

                        ),
                 // contentPadding: contentPadding == null ? null : EdgeInsets.symmetric(horizontal: contentPadding!, vertical: contentPadding!),
                  suffixIcon: suffixIconString == null
                      ? null
                      : Padding(
                          padding: iconPadding == null
                              ? const EdgeInsets.all(0)
                              : EdgeInsets.only(
                                  left: iconPadding!, right: iconPadding!),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                if (controller!.text.isEmpty) return;
                                obSecureValue.value = isPassword;
                                isPassword = !isPassword;
                                obSecureValue.value = isPassword;
                              },
                              icon: Image.asset(suffixIconString!),
                            ),
                          ),
                        ),
                  prefixIcon: prefixIconString == null
                      ? null
                      : SizedBox(
                          //height: 4,
                          child: Image.asset(prefixIconString!),
                        ),
                  hintText: hintText == null ? null : hintText!,
                  hintStyle: TextStyle(fontSize: hintTextSize, color: hintColor),
                  filled: isFilled,
                  fillColor: fillColor,
                ),
              );
            }),
      ),
    );
  }
}

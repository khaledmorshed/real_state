import 'package:flutter/material.dart';

import '../global/global.dart';

class CustomTextFormField extends StatelessWidget {
  IconData? suffixIcon;
  IconData? prefixIcon;
  String? hintText;
  IconData? icon;
  bool isPassword;
  Color? hintColor;
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
  });

  @override
  Widget build(BuildContext context) {
    //print("padding...................$isPassword+fonsize........$fontSize.....+obSecureConfirmPasswordValue.............${obSecureValue.value}");
    return Container(
      padding: /*padding*/ EdgeInsets.all(0),
      height: height == 0 ? null : height,
      child: Center(
        child: ValueListenableBuilder(
            valueListenable: obSecureValue,
            builder: (context, value, _) {
              // print("ispass..........................$isPassword");
              return TextFormField(
                readOnly: isReadOnly!,
                onTap: onSubmit != null ? () => onChanged!() : null,
                validator: validation != null
                    ? (String? txt) => validation!(txt)
                    : null,
                controller: controller!,
                obscureText: isPassword,
                keyboardType: textInputType,
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChanged != null ? (String txt) => onChanged!(txt) : null,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: isOutLineboarder == null
                      ? null
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(outLineBoarder!)),
                        ),
                  //contentPadding: contentPadding == null ? null : EdgeInsets.symmetric(horizontal: contentPadding!, vertical: contentPadding!),
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
                                //  print("ispass suffix button..........................$isPassword");
                                obSecureValue.value = isPassword;
                                isPassword = !isPassword;
                                obSecureValue.value = isPassword;
                                // print("suffixbutton pressed....................valuLisnter=${obSecureValue.value}.............+isPassword...$isPassword");
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
                  filled: isFilled,
                  fillColor: fillColor,
                ),
              );
            }),
      ),
    );
  }
}

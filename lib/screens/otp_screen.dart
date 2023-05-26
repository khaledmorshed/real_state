import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../conts/color_manager.dart';

class OtpScreen extends StatefulWidget {
  static const String route = "/OtpScreen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.signUPBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Container(
          margin: const EdgeInsets.only(top: 108),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter 4-digit OTP code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "We have sent you 4 digit code via your email, please check your email",
                style:
                    TextStyle(fontSize: 16, color: ColorManager.updatePlease),
              ),
              const SizedBox(
                height: 50,
              ),
              _textForm(),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      "Verify OTP",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                      minimumSize: const Size.fromHeight(48),
                      backgroundColor: ColorManager.buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                    onPressed: () {
                      //_formValidationAndSave();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "00:30",
                    style:
                        TextStyle(fontSize: 12, color: ColorManager.otpTimer),
                  ),
                  const SizedBox(width: 6.5,),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Don't receive the code?",
                        style: TextStyle(
                            color: ColorManager.updatePlease, fontSize: 14),
                      ),
                      TextSpan(
                        text: " Resend OTP",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('otp resend......');
                          },
                        style: TextStyle(
                            color: ColorManager.otpResend,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textForm() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                //style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

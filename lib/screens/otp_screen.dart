import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../conts/color_manager.dart';

class OtpScreen extends StatefulWidget {
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
          margin: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter 4-digit OTP code", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text("We have sent you 4 digit code via your email, please check your email", style: TextStyle(fontSize: 15),),
              const SizedBox(height: 30,),
              _textForm(),
              const SizedBox(height: 30,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("Verify OTP", style: TextStyle(fontSize: 18),),
                    style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 50, vertical: 10),
                      padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      //   side: BorderSide(color: ColorManager.depOrange1),
                      // ),
                    ),
                    onPressed: () {
                      //_formValidationAndSave();
                    },
                  ),
                  Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  _textForm(){
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height:  60,
            width:  60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: TextFormField(
                onChanged: (value){
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500,),
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
            height:  60,
            width:  60,

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: TextFormField(
                onChanged: (value){
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500,),
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
            height:  60,
            width:  60,

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: TextFormField(
                onChanged: (value){
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500,),
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
            height:  60,
            width:  60,

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: TextFormField(
                onChanged: (value){
                  if(value.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500,),
                //style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
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

import 'package:flutter/material.dart';
import '../../../utills/conts/color_manager.dart';
import '../../widgets/custon_text_form_field.dart';


class UpdatePasswordScreen extends StatefulWidget {
  static const String route = "/UpdatePasswordScreen";

  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.signUPBackground,
      body: Container(
        margin: const EdgeInsets.only(top: 108),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Update your password",style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
              const SizedBox(height: 5,),
              Text("please type your new password", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400, color: ColorManager.updatePlease),),
              const SizedBox(height: 50,),
              _allTextFormField(),
              const SizedBox(height: 30,),
              ElevatedButton(
                child: const Text("Update Password", style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: ColorManager.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  _showDialog();
                },
              ),
              // Spacer(),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8),
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Image.asset("assets/vectors/splash screen/home indicator.png", color: Colors.black,),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _allTextFormField(){
    return Column(
      children: [
        CustomTextFormField(
          controller: _passwordController,
          isPassword: true,
          prefixIconString: "assets/vectors/sign up screen/lock_icon.png",
          suffixIconString: "assets/vectors/sign up screen/lock_suffix_icon.png",
          validation: (value) {
            if (value!.isEmpty) {
              return "Please enter password";
            }
            if(value.toString().length < 6){
              return "password should be at least 6 characters";
            }
            return null;
          },
        ),

        const SizedBox(height: 20,),

        CustomTextFormField(
          controller: _confirmPasswordController,
          isPassword: true,
          prefixIconString: "assets/vectors/sign up screen/lock_icon.png",
          suffixIconString: "assets/vectors/sign up screen/lock_suffix_icon.png",
          validation: (value) {
            if (value!.isEmpty) {
              return "Please enter confirm password";
            }
            if(value.toString().length < 6){
              return "password should be at least 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
  _showDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: SizedBox(
          height: 228,
          width: 343,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/vectors/update_password/check.png"),
              const SizedBox(height: 15,),
              const Text('Congratulations',style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
              const SizedBox(height: 15,),
              Text('You have created your new password',style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400, color: ColorManager.updatePlease),),
            ],
          ),
        ),
      );
    });
  }
}

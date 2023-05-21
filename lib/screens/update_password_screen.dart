import 'package:flutter/material.dart';
import 'package:real_state/conts/color_manager.dart';

import '../widgets/custon_text_form_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
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
        child: Column(
          children: [
            Text("Update your password"),
            Text("df"),

            _allTextFormField(),

          ],
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
}

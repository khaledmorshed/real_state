import 'package:flutter/material.dart';
import '../../../utills/conts/color_manager.dart';
import '../../widgets/custon_text_form_field.dart';


class ResetPasswordScreen extends StatefulWidget {
  static const String route = "/ResetPasswordScreen";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }


  Future<void> _formValidationAndSave() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.signUPBackground,
      body: Container(
        margin: const EdgeInsets.only(top: 108),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Reset password",style: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
                const SizedBox(height: 5,),
                Text("Enter the email address associated with your account.", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w400, color: ColorManager.updatePlease),),
                const SizedBox(height: 50,),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: "Email Address",
                  hintColor: ColorManager.hintTextColor,
                  prefixIconString: "assets/vectors/sign up screen/gmail_icon.png",
                  textInputType: TextInputType.emailAddress,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an email";
                    }
                    return null;
                  },
                ),
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
                    _formValidationAndSave();
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
      ),
    );
  }
}

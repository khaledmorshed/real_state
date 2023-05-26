import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/registration_provider.dart';

import '../conts/color_manager.dart';
import '../global/global.dart';
import '../global/text.dart';
import '../models/user_model.dart';
import '../widgets/custon_text_form_field.dart';
import '../widgets/textformfield_decoration.dart';


class SignUpScreen extends StatefulWidget {
  static const String route = "/SignUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _checkboxValue = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    //print("dispose.................");
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }


  Future<void> _formValidationAndSave() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _registration();
  }

  Future<void> _registration()async{
    final _user = User(
      userName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    Provider.of<RegistrationProvider>(context, listen: false).registration(_user).then((value){

      print("sign up..............");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.signUPBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 118, left: 109, right: 109),
              child: Image.asset("assets/vectors/sign up screen/logo.png"),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                child: Column(
                  children: [
                   //const Text("Sign Up", style: TextStyle(fontFamily: 'Poppins', fontStyle: FontStyle.normal, fontSize: 24, fontWeight: FontWeight.w500),),
                    t24("Sign Up"),
                    const SizedBox(height: 5,),
                    Text("Hey, good to see you again", style: TextStyle(fontFamily: 'Poppins', fontStyle: FontStyle.normal, fontSize: 14, color: ColorManager.signUpHey),),
                    const SizedBox(height: 30,),
                    _allTextField(),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                      child: Text("Sign In", style: TextStyle(fontSize: 18),),
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
                    const SizedBox(height: 25,),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Or Sign up with',
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service......');
                                }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    _gmailAndFb(),
                    const SizedBox(height: 31,),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                              color: ColorManager.updatePlease, fontSize: 14),
                        ),
                        TextSpan(
                          text: " Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Sign up.....');
                            },
                          style: TextStyle(
                              color: ColorManager.otpResend,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    // const SizedBox(height: 51.5,),
                    // Image.asset("assets/vectors/splash screen/home indicator.png",color: Colors.black,),
                    const SizedBox(height: 8,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _allTextField(){
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            CustomTextFormField(
              controller: _nameController,
              hintText: "Enter Your Name",
              hintColor: ColorManager.hintTextColor,
              prefixIconString: "assets/vectors/sign up screen/person.png",
              validation: (value) {
                if (value!.isEmpty) {
                  return "Please enter a name";
                }
                return null;
              },
            ),

            const SizedBox(height: 20,),

            CustomTextFormField(
              controller: _emailController,
              hintText: "Enter Your Email",
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

            // const SizedBox(height: 20,),
            //
            // CustomTextFormField(
            //   controller: _phoneController,
            //   hintText: "Enter Phone Number",
            //   hintColor: ColorManager.hintTextColor,
            //   textInputType: TextInputType.phone,
            //   prefixIconString: "assets/vectors/sign up screen/phone_icon.png",
            //   validation: (value) {
            //     if (value!.isEmpty) {
            //       return "Please enter a phone number";
            //     }
            //     return null;
            //   },
            // ),

            const SizedBox(height: 20,),

            CustomTextFormField(
              controller: _passwordController,
              hintText: "Enter Your Password",
              hintColor: ColorManager.hintTextColor,
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
              hintText: "Confirm Password",
              hintColor: ColorManager.hintTextColor,
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

            const SizedBox(height: 20,),

            Row(
              children: [
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (va){
                    setState(() {
                      _checkboxValue = !_checkboxValue;
                    });
                  },),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'I agree to the', style: TextStyle(color: ColorManager.signAgree, fontSize: 14)),
                        TextSpan(
                            text: ' Privacy policy',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service......');
                              }),
                        TextSpan(text: ' and', style: TextStyle(color: ColorManager.signAgree, fontSize: 14)),
                        TextSpan(
                            text: ' Terms & Conditions',
                            style: TextStyle(color: Colors.black),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms & Conditions........');
                              }),
                        TextSpan(text: ' of Real State', style: TextStyle(color: ColorManager.signAgree, fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
   _gmailAndFb(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/vectors/sign up screen/gmail.png", height: 50, width: 50,),
        const SizedBox(height: 25,),
        Image.asset("assets/vectors/sign up screen/fb.png", height: 50, width: 50,),
      ],
    );
  }
}

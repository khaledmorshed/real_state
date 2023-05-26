import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../conts/color_manager.dart';
import '../global/global.dart';
import '../widgets/custon_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  static const String route = "/SignInScreen";

  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                    const Text("Sign In", style: TextStyle(fontFamily: 'Poppins', fontStyle: FontStyle.normal, fontSize: 24, fontWeight: FontWeight.w500),),
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
                              text: 'Or Sign In with',
                              style: const TextStyle(color: Colors.black, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('sing in......');
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
                          text: "Don't have an account?",
                          style: TextStyle(
                              color: ColorManager.updatePlease, fontSize: 14),
                        ),
                        TextSpan(
                          text: " Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Sign In.....');
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


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxValue,
                      onChanged: (va){
                        setState(() {
                          _checkboxValue = !_checkboxValue;
                        });
                      },),
                    const SizedBox(width: 10,),
                    const Text('Remember me', style: TextStyle(fontSize: 14)),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Forget Password',
                          style: const TextStyle(color: Colors.black, fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('forget......');
                            }),
                    ],
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

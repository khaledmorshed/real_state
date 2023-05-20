import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../conts/color_manager.dart';
import '../widgets/textformfield_decoration.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _obSecureValue = true;
  bool _obSecureConfirmValue = true;

  bool _checkboxValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.signUPBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 118, left: 109, right: 109),
              child: Image.asset("assets/vectors/sign up screen/logo.png"),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                child: Column(
                  children: [
                    Text("Sign Up", style: TextStyle(fontFamily: 'Poppins', fontStyle: FontStyle.normal, fontSize: 24, fontWeight: FontWeight.w500),),
                    const SizedBox(height: 5,),
                    Text("Hey, good to see you again", style: TextStyle(fontFamily: 'Poppins', fontStyle: FontStyle.normal, fontSize: 14, color: ColorManager.signUpHey),),
                    const SizedBox(height: 30,),
                    _allTextField(),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                      child: Text("Sign In", style: TextStyle(fontSize: 18),),
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

                      },
                    ),
                    const SizedBox(height: 25,),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Or Sign in with',
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service......');
                                }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    _gmailAndFb(),
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
      child: Column(
        children: [

          TextFormField(
            controller: _nameController,
            decoration: TextFormFieldDecoration(prefixIcon: Icons.person, prefixIconString: "assets/vectors/sign up screen/person.png", iconPadding: 10.0, outLineBoarder: 2, hintText: "Enter ",).decoaration(),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),

          TextFormField(
            controller: _emailController,
            decoration: TextFormFieldDecoration(prefixIcon: Icons.email, prefixIconString: "assets/vectors/sign up screen/gmail_icon.png", iconPadding: 10.0, outLineBoarder: 2,fillColor: true, ).decoaration(),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter an email";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),

          TextFormField(
            controller: _phoneController,
            decoration: TextFormFieldDecoration(prefixIcon: Icons.phone, prefixIconString: "assets/vectors/sign up screen/phone_icon.png", iconPadding: 10.0, outLineBoarder: 2,).decoaration(),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a phone number";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),

          TextFormField(
            controller: _passwordController,
            obscureText: _obSecureValue,
            decoration: InputDecoration(
              prefixIcon: SizedBox(
                child: Image.asset("assets/vectors/sign up screen/lock_icon.png"),
              ),
              suffixIcon: SizedBox(
                height: 4,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _obSecureValue = !_obSecureValue;
                    });
                    // print("I am suffix............");
                  },
                  icon: Image.asset("assets/vectors/sign up screen/lock_suffix_icon.png"),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a name";
              }
              return null;
            },
          ),

          const SizedBox(height: 20,),

          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _obSecureConfirmValue,
            decoration: InputDecoration(
              prefixIcon: SizedBox(
                child: Image.asset("assets/vectors/sign up screen/lock_icon.png"),
              ),
              suffixIcon: SizedBox(
                height: 4,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      _obSecureConfirmValue = !_obSecureConfirmValue;
                    });
                    // print("I am suffix............");
                  },
                  icon: Image.asset("assets/vectors/sign up screen/lock_suffix_icon.png"),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter a name";
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
    );
  }
   _gmailAndFb(){
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/vectors/sign up screen/gmail.png", height: 50, width: 50,),
          const SizedBox(height: 25,),
          Image.asset("assets/vectors/sign up screen/fb.png", height: 50, width: 50,),
        ],
      ),
    );
  }
}

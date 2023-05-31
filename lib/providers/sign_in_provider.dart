import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/global.dart';
import '../models/user_model.dart';
import '../repository/auth.dart';

class SignInProvider with ChangeNotifier{
  User? _user;
  loadSharedPref()async{
    sPref = await SharedPreferences.getInstance();
  }
   Future signIn(User? user)async{
     try{
        await loadSharedPref();
       _user = await Auth.signIn(user);
       print("_pro..........${_user!.tokens!.access}");
       String _access = _user!.tokens!.access.toString();
       sPref!.setString("access", _access);

       print("sf..............${sPref!.getString("access")}");

     }catch(error){
       throw error;
     }
   }
}
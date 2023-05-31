import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/remote/dio/dio_service.dart';
import '../data/models/user_model.dart';
import '../data/repositories/auth/auth_repo.dart';
import '../utills/global/global.dart';


class SignInProvider with ChangeNotifier{

  DioService dioService;
  final AuthRepo auth;

  SignInProvider({required this.dioService, required this.auth});

  User? _user;
  loadSharedPref()async{
    sPref = await SharedPreferences.getInstance();
  }
   Future signIn(User? user)async{
     try{
        await loadSharedPref();
       _user = await AuthRepo.signIn(user);
       print("_pro..........${_user!.tokens!.access}");
       String _access = _user!.tokens!.access.toString();
       sPref!.setString("access", _access);

       print("sf..............${sPref!.getString("access")}");

     }catch(error){
       throw error;
     }
   }
}
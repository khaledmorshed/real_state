import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/remote/dio/dio_service.dart';
import '../data/models/base_model/api_response_model.dart';
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

  Future<String?> signIn({User? user, required BuildContext context})async{
    // notifyListeners();

    print("provider........sing up");
    ApiResponseModel apiResponseModel = await auth.signIn(user);

    // try{
    //
    //   print("provider........user..............+${_user.toString()}+");
    //   print("name.........${_user!.userName}");
    // }catch(error){
    //   print("provider...........error..............${user!.userName}");
    //   return
    //   throw error;
    // }

    if(apiResponseModel.response != null && apiResponseModel.response!.data["status"]=="success"){
      Map map = apiResponseModel.response?.data;

      String token = '';
      String message = '';

      try{
        // message = map["message"];
        // token = map["token"];

        if(kDebugMode){
          print("--------------message----------------------->>>>>$message");
          print("--------------token----------------------->>>>>$token");
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
          backgroundColor: Theme.of(context).primaryColor,
        ));


      }catch(e){

        print("provider e............");

        //throw e;
      }

      if(token.isNotEmpty){
        // authRepo.saveUserToken(token);
      }
      notifyListeners();
    }

    // else{
    //   print("provider else............");
    //
    //   _isLoading = false;
    //   notifyListeners();
    //   if(apiResponseModel.response != null && apiResponseModel.response!.statusCode==200){
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(apiResponseModel.response!.data["message"]),
    //       elevation: 6.0,
    //       duration: const Duration(seconds: 2),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    //
    //   String errorMessage;
    //   if(apiResponseModel.error is String){
    //     if(kDebugMode){
    //       print(apiResponseModel.error.toString());
    //     }
    //     errorMessage = apiResponseModel.error.toString();
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text('${errorMessage}'),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    //   else{
    //     ErrorResponse errorResponse = apiResponseModel.error;
    //     if(kDebugMode){
    //       print(errorResponse.error![0].message);
    //     }
    //     errorMessage = errorResponse.error![0].message;
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //       content: Text(errorMessage),
    //       backgroundColor: Colors.red,
    //     ));
    //   }
    //  // notifyListeners();
    // }
    if (kDebugMode) {
      print("response.statusCode${apiResponseModel.response!.statusCode}");
    }
    print("provider return............");
    return apiResponseModel.response!.data["status"];
  }

   // Future signIn(User? user)async{
   //   try{
   //      await loadSharedPref();
   //     _user = await AuthRepo.signIn(user);
   //     print("_pro..........${_user!.tokens!.access}");
   //     String _access = _user!.tokens!.access.toString();
   //     sPref!.setString("access", _access);
   //
   //     print("sf..............${sPref!.getString("access")}");
   //
   //   }catch(error){
   //     throw error;
   //   }
   // }
}
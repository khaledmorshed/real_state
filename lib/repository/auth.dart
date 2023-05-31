import 'dart:convert';

import 'package:dio/dio.dart';

import '../conts/api.dart';
import '../models/user_model.dart';

class Auth{
  static Future<User?> registration(User? user)async{

      try{
        var dio = Dio();
        dio.options.headers['Content-Type'] = 'application/json';
        print("test1..........");

        print("user.....${user!.userName}+${user.email}+${user.password}");
        var data = json.encode({
          "username": user.userName,
          "email": user.email,
          "password": user.password,
        });
        print("test2..........");

        Response response = await dio.post(
          Api.baseUrl + Api.registration,
          data: data,
        );
        print("test3..........");
        print("ds...........${response.data.toString()}");
        //final map = json.decode(response.data);
        print("test4..........");

        if(response.statusCode == 201){

          print("test5..........");
            print("d...........${response.data.toString()}");
            return User.fromJson(response.data);
        }else{
          print("fail.................");
        }

      }catch(error){
        throw Exception("Failed to register");
       // throw Exception(response.data);
      }
  }
  //sign in
  static Future signIn(User? user)async{
    try{
      var dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      print("test1..........");

      print("user.....+${user!.email}+${user.password}");
      var data = json.encode({
        "email": user.email,
        "password": user.password,
      });
      print("test2..........");

      Response response = await dio.post(
        Api.baseUrl + Api.login,
        data: data,
      );

      if(response.statusCode == 200){
        return User.fromJson(response.data);
       // return response.statusCode;
      }
    }catch(error){
      throw Exception("Failed to login");
    }
  }
}
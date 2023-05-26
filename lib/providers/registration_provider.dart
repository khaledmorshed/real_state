import 'package:flutter/cupertino.dart';
import 'package:real_state/repository/auth.dart';

import '../models/user_model.dart';

class RegistrationProvider with ChangeNotifier{
  User? _user;
  User? get user => _user;
  Future registration(User? user)async{
    print("provider........registration");
      try{
        _user = await Auth.registration(user);
        print("provider........user..............+${_user.toString()}+");
        print("name.........${_user!.userName}");
      }catch(error){
        print("provider...........error..............${user!.userName}");
        return
        throw error;
      }
  }
}
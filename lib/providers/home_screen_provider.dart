import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{

  List<String> _image = ["0.png", "1.png", "2.png", "3.png"];
  List<String> _categoryList = ["Apartment","House", "Restaurant", "df"];
  List<String> get categoryList => _categoryList;
   List<String> get imageList => _image;

  Future<void> getCategory()async{

  }

}
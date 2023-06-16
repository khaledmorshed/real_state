import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{
  static String baseFile = "assets/vectors/home_screen/client_slider/";
  List<String> _image = ["0.png", "1.png", "2.png", "3.png"];
  List<String> _categoryList = ["Apartment","House", "Restaurant", "df"];
  List<String> get categoryList => _categoryList;
  List<String> get imageList => _image;
  List<String> _client_slider = ["${baseFile}0.jpg", "${baseFile}1.jpg", "${baseFile}2.jpg",];
  List<String> get clientSlider => _client_slider;


  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  void setActiveIndexValue(int index){
    _activeIndex = index;
    notifyListeners();
  }

  Future<void> getCategory()async{

  }

}
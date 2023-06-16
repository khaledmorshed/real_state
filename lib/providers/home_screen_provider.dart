import 'package:flutter/cupertino.dart';

class HomeScreenProvider with ChangeNotifier{
  static String baseFile = "assets/vectors/home_screen/client_slider/";
  static String baseFile2 = "assets/vectors/home_screen/category/";
  List<String> _image = ["0.png", "1.png", "2.png", "3.png"];
  List<String> _categoryList = ["Apartment","House", "Restaurant", "df"];
  List<String> get categoryList => _categoryList;
  List<String> get imageList => _image;
  List<String> _client_slider = ["${baseFile}0.jpg", "${baseFile}1.jpg", "${baseFile}2.jpg",];
  List<String> get clientSlider => _client_slider;
  List<String> _dummyImage = ["${baseFile2}0.png", "${baseFile2}1.png", "${baseFile2}2.png", "${baseFile2}3.png", "${baseFile2}4.png"];
  List<String> get dummyImage => _dummyImage;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  void setActiveIndexValue(int index){
    _activeIndex = index;
    notifyListeners();
  }

  Future<void> getCategory()async{

  }

}
import 'package:flutter/cupertino.dart';

class PropertyProvider with ChangeNotifier{

  static String baseFile2 = "assets/vectors/home_screen/category/";
  List<String> _dummyImage = ["${baseFile2}0.png", "${baseFile2}1.png", "${baseFile2}2.png", "${baseFile2}3.png", "${baseFile2}4.png"];
  List<String> get dummyImage => _dummyImage;

  int _selectedButtonIndex = -1;
  int get selectedButtonIndex => _selectedButtonIndex;

  void setButtonSelectionValue(int index){
    _selectedButtonIndex = index;
    notifyListeners();
  }

}
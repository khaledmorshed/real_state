import 'package:flutter/cupertino.dart';

class ASpecificWidgetProvider with ChangeNotifier{

  int _selectedButtonIndex = -1;
int get selectedButtonIndex => _selectedButtonIndex;

  void setButtonSelectionValue(int index){
    _selectedButtonIndex = index;
    notifyListeners();
  }

}
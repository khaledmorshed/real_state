import 'package:flutter/cupertino.dart';

class ASpecificWidgetProvider with ChangeNotifier{

  int _selectedButtonIndex = -1;
int get selectedButtonIndex => _selectedButtonIndex;

  void setButtonSelectionValue(int index){
    _selectedButtonIndex = index;
    notifyListeners();
  }

  double _lowerValue = 5000, _upperValue = 20000;
  double get lowerValue => _lowerValue;
  double get upperValue => _upperValue;

  void setLowerAndUpperValue(double low, up){
    _lowerValue = low;
    _upperValue = up;
    notifyListeners();
  }

}
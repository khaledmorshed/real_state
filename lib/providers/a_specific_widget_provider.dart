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

  bool _selectedHomeForBottomNavBar = false;
  bool get selectedHomeForBottomNavBar => _selectedHomeForBottomNavBar;
  bool _selectedPropertyForBottomNavBar = false;
  bool get selectedPropertyForBottomNavBar => _selectedPropertyForBottomNavBar;
  bool _selectedAddPropertyForBottomNavBar = false;
  bool get selectedAddPropertyForBottomNavBar => _selectedAddPropertyForBottomNavBar;
  bool _selectedFavoriteForBottomNavBar = false;
  bool get selectedFavoriteForBottomNavBar => _selectedFavoriteForBottomNavBar;
  bool _selectedSettingsForBottomNavBar = false;
  bool get selectedSettingsForBottomNavBar => _selectedSettingsForBottomNavBar;

  void setButtonSelectionValueForNavBar(String check){
    if(check.compareTo("home") == 0){
      _selectedHomeForBottomNavBar = true;
      _selectedPropertyForBottomNavBar = false;
      _selectedAddPropertyForBottomNavBar = false;
      _selectedFavoriteForBottomNavBar = false;
      _selectedSettingsForBottomNavBar = false;
    }
    if(check.compareTo("property") == 0){
      _selectedPropertyForBottomNavBar = true;
      _selectedHomeForBottomNavBar = false;
      _selectedAddPropertyForBottomNavBar = false;
      _selectedFavoriteForBottomNavBar = false;
      _selectedSettingsForBottomNavBar = false;
    }
    if(check.compareTo("add_property") == 0){
      _selectedAddPropertyForBottomNavBar = true;
      _selectedHomeForBottomNavBar = false;
      _selectedPropertyForBottomNavBar = false;
      _selectedFavoriteForBottomNavBar = false;
      _selectedSettingsForBottomNavBar = false;
    }
    if(check.compareTo("favorite") == 0){
      _selectedFavoriteForBottomNavBar = true;
      _selectedHomeForBottomNavBar = false;
      _selectedPropertyForBottomNavBar = false;
      _selectedAddPropertyForBottomNavBar = false;
      _selectedSettingsForBottomNavBar = false;
    }
    if(check.compareTo("settings") == 0){
      _selectedSettingsForBottomNavBar = true;
      _selectedHomeForBottomNavBar = false;
      _selectedPropertyForBottomNavBar = false;
      _selectedAddPropertyForBottomNavBar = false;
      _selectedFavoriteForBottomNavBar = false;
    }


    notifyListeners();
  }

}
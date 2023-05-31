import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//bool obSecureConfirmValue = true;
SharedPreferences? sPref;
ValueNotifier obSecureValue = ValueNotifier(false);
ValueNotifier obSecurePasswordValue = ValueNotifier(false);
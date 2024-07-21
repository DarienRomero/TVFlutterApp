import 'package:flutter/material.dart';

class ButtonFocusProvider extends ChangeNotifier{
  String _buttonFocusedLabel = "";
  set buttonFocusedLabel(String buttonFocusedLabel){
    _buttonFocusedLabel = buttonFocusedLabel;
    notifyListeners();
  }
  String get buttonFocusedLabel => _buttonFocusedLabel;
}
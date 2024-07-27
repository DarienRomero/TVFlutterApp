import 'dart:math';

import 'package:flutter/material.dart';

class ButtonFocusProvider extends ChangeNotifier{
  String _buttonFocusedLabel = "";
  final seed = Random(DateTime.now().millisecondsSinceEpoch);
  set buttonFocusedLabel(String buttonFocusedLabel){
    _buttonFocusedLabel = buttonFocusedLabel;
    notifyListeners();
  }
  String get buttonFocusedLabel => _buttonFocusedLabel;

  String _lastButtonFocusedLabel = "";

  String get lastButtonFocusedLabel => _lastButtonFocusedLabel;

  set lastButtonFocusedLabel(String lastButtonFocusedLabel){
    _lastButtonFocusedLabel = lastButtonFocusedLabel;
    notifyListeners();
  }

  int getRandomNumber(){
    return seed.nextInt(100);
  }
}
import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _value = 0;
  //getter
  double get value => _value;
  //setter
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}

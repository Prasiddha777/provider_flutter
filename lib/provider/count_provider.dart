import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  //changeNotifier => setState
  int _count = 0;
  //💖getter and setter are used to read and write the operations
  //
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}

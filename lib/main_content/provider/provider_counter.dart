import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ProviderCounter with ChangeNotifier {
  int _counter;
  ProviderCounter() {
    _counter = 0;
  }
  int get counter => _counter;

  void setCounter(int value) {
    _counter = value;
    notifyListeners();
  }
}

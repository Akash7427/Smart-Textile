import 'package:flutter/cupertino.dart';

class SetScreen with ChangeNotifier {
  int _index;

  SetScreen() {
    _index = 2;
  }

  int get index => _index;

  void changeScreen(int index) {
    _index = index;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:smarttextile/shared/size_config.dart';

class CircleProvider with ChangeNotifier {
  double _size;
  double _x;
  double _y;
  CircleProvider() {
    _x = 600;
    _y = 500;
    _size = 80.0;
  }

  double get x => _x;
  double get y => _y;
  double get size => _size;

  setSize(double s) {
    _size = s;

    notifyListeners();
    if (_size == 280) {
      setOffset(_x - 100, _y - 100);
    } else {
      setOffset(_x + 100, _y + 100);
    }
  }

  setOffset(double x, double y) {
    _x = x;
    _y = y;
    notifyListeners();
  }
}

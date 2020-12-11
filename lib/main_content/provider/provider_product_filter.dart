import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderProductsFilter with ChangeNotifier {
  List<String> _filterOccassion;
  List<String> _filterColor;
  List<String> _filterSize;
  List<String> _filterPattern;
  String _blouseFabric;
  String _fabric;
  String _setContent;
  String _work;
  String _sampleOrders;
  String _stichedType;
  String _sleeveType;
  String _width;
  String _material;
  String _brand;
  String _use;
  String _productType;

  ProviderProductsFilter() {
    _filterOccassion = [];
    _filterColor = [];
    _filterSize = [];
    _filterPattern = [];
    _blouseFabric = "";
    _fabric = "";
    _setContent = "";
    _work = "";
    _sampleOrders = "";
    _stichedType = "";
    _sleeveType = "";
    _width = "";
    _material = "";
    _brand = "";
    _use = "";
    _productType = "";
  }

  List<String> get filterOcassion => _filterOccassion;
  List<String> get filterColor => _filterColor;
  List<String> get filterSize => _filterSize;
  List<String> get filterPattern => _filterPattern;
  String get blouseFabric => _blouseFabric;
  String get fabric => _fabric;
  String get setContent => _setContent;
  String get work => _work;
  String get sampleOrders => _sampleOrders;
  String get stichedType => _stichedType;
  String get sleeveType => _sleeveType;
  String get width => _width;
  String get material => _material;
  String get brand => _brand;
  String get use => _use;
  String get productType => _productType;

  void setOccassion(List<String> occassion) {
    _filterOccassion.clear();
    occassion.forEach((element) {
      _filterOccassion.add(element);
    });

    notifyListeners();
  }

  void setColor(List<String> color) {
    _filterColor.clear();
    color.forEach((element) {
      _filterColor.add(element);
    });
    notifyListeners();
  }

  void setPattern(List<String> pattern) {
    _filterPattern.clear();
    pattern.forEach((element) {
      _filterPattern.add(element);
    });
    notifyListeners();
  }

  void setSize(List<String> size) {
    _filterSize.clear();
    size.forEach((element) {
      _filterSize.add(element);
    });
    notifyListeners();
  }

  void setBlouseFabric(String blouseFabric) {
    _blouseFabric = blouseFabric;
    notifyListeners();
  }

  void setFabric(String fabric) {
    _fabric = fabric;
    notifyListeners();
  }

  void setWork(String work) {
    _work = work;
    notifyListeners();
  }

  void setSetContent(String setContent) {
    _setContent = setContent;
    notifyListeners();
  }

  void setSampleOrders(String sampleOrder) {
    _sampleOrders = sampleOrder;
    notifyListeners();
  }

  void setStichedType(String stiched) {
    _stichedType = stiched;
    notifyListeners();
  }

  void setSleeveType(String sleeveType) {
    _sleeveType = sleeveType;
    notifyListeners();
  }

  void setWidth(String width) {
    _width = width;
    notifyListeners();
  }

  void setMaterial(String material) {
    _material = material;
    notifyListeners();
  }

  void setBrand(String brand) {
    _brand = brand;
    notifyListeners();
  }

  void setUse(String use) {
    _use = use;
    notifyListeners();
  }

  void clearAll() {
    _filterOccassion = [];
    _filterColor = [];
    _filterSize = [];
    _filterPattern = [];
    _blouseFabric = "";
    _fabric = "";
    _setContent = "";
    _work = "";
    _sampleOrders = "";
    _stichedType = "";
    _sleeveType = "";
    _width = "";
    _material = "";
    _brand = "";
    _use = "";
    notifyListeners();
  }

  void setProductType(String type) {
    _productType = type;
    notifyListeners();
  }
}

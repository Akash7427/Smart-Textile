import 'package:flutter/cupertino.dart';

class ProviderSupplierFilterOption with ChangeNotifier {
  List<String> _cities;
  List<String> _filterCity;
  List<String> _subCategory;
  List<String> _filterSubCategory;
  double _ratings;
  String _categoryType;
  String _supplierType;
  int _counter;

  ProviderSupplierFilterOption() {
    _cities = ["Surat", "Mumbai", "Ahmedabad", "Vadodra", "Banglore"];
    _subCategory = [];
    _filterCity = [];
    _filterSubCategory = [];
    _ratings = 0.0;
    _categoryType = "";
    _supplierType = "";
    _counter = 0;
  }
  int get counter => _counter;
  String get supplierType => _supplierType;
  String get categoryType => _categoryType;
  List<String> get cities => _cities; //List of cities diplayed on screen
  List<String> get filtercity => _filterCity; //List of cities selected
  List<String> get subCategory =>
      _subCategory; //List of subCategory displayed on Screen
  List<String> get filterSubCategory =>
      _filterSubCategory; //List of selected subCategory
  double get ratings => _ratings; //Ratings

  void setCounter(int count) {
    _counter = count;
    //For calling getData for one time only
    notifyListeners();
  }

  void setSupplierType(String type) {
    _supplierType = type;
    print(_supplierType);
    notifyListeners();
  }

  void setCategoryType(String catType) {
    _categoryType = catType;
    notifyListeners();
  }

  void addCity(String cityName) {
    if (_cities.contains(cityName) == false) {
      _cities.add(cityName);
      notifyListeners();
    }
  }

  void removeCity(String cityName) {
    if (_cities.contains(cityName) == true) {
      _cities.remove(cityName);
      notifyListeners();
    }
  }

  void clearCity() {
    _cities.clear();
    notifyListeners();
  }

  void addFlterCity(String cityName) {
    if (_filterCity.contains(cityName) == false) {
      _filterCity.add(cityName);
      notifyListeners();
    }
  }

  void removeFilterCity(String cityName) {
    if (_filterCity.contains(cityName) == true) {
      _filterCity.remove(cityName);
      notifyListeners();
    }
  }

  void clearFilterCity() {
    _filterCity.clear();
    notifyListeners();
  }

  void setSubCategory(List category) {
    _subCategory.clear();
    category.forEach((e) {
      _subCategory.add(e);
    });
    notifyListeners();
  }

  void addSubCategory(String subCategory) {
    if (_subCategory.contains(subCategory) == false) {
      _subCategory.add(subCategory);
      notifyListeners();
    }
  }

  void removeSubCategory(String subCategory) {
    if (_subCategory.contains(subCategory) == true) {
      _subCategory.remove(subCategory);
      notifyListeners();
    }
  }

  void clearSubCategory() {
    _subCategory.clear();
    notifyListeners();
  }

  void addFilterSubCategory(String subCategory) {
    if (_filterSubCategory.contains(subCategory) == false) {
      _filterSubCategory.add(subCategory);
      notifyListeners();
    }
  }

  void removeFilterSubCategory(String subCategory) {
    if (_filterSubCategory.contains(subCategory) == true) {
      _filterSubCategory.remove(subCategory);
      notifyListeners();
    }
  }

  void clearFilterSubCategory() {
    _filterSubCategory.clear();
    notifyListeners();
  }

  void setRatings(double ratings) {
    _ratings = ratings;
    notifyListeners();
  }
}

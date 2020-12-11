import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main.dart';

class ProviderUser with ChangeNotifier {
  List<String> _ethnicWear;
  List<String> _apparelAndGarments;
  List<String> _saree;
  String _state;
  String _gstNum;
  List<String> _categories;
  List<String> _fabrics;
  String _logo;
  String _name;
  String _rating;
  String _companyName;
  String _email;
  String _type;
  String _address;
  String _city;
  String _phoneNo;
  String _establishmentYear;
  String _deviceToken;
  String _pincode;
  List<String> _kurti;
  List<String> _dress;
  String _uid;
  String _website;
  List<String> _products;
  List<String> _favouriteProducts;
  List<String> _favouriteUsers;
  String _description;
  List<String> _cities;
  List<String> _qrCode;
  List<String> _certificates;
  List<String> _connection;
  List<String> _sendConnection;
  List<String> _newConnection;
  Box<User> _userBox;
  User _user;

  ProviderUser() {
    _userBox = Hive.box<User>("User");
    _user = _userBox.get("user");
    if (_user != null) {
      print("Inside if in providerUser");
      _ethnicWear = _user.ethnicWear;
      _apparelAndGarments = _user.apparelAndGarments;
      _saree = _user.saree;
      _kurti = _user.kurti;
      _fabrics = _user.fabrics;
      _dress = _user.dress;
      _categories = _user.categories;
      _name = _user.name;
      _companyName = _user.companyName;
      _address = _user.address;
      _pincode = _user.pincode;
      _city = _user.city;
      _state = _user.state;
      _gstNum = _user.gstNum;
      _establishmentYear = _user.establishmentYear;
      _phoneNo = _user.phoneNo;
      _email = _user.email;
      _rating = _user.rating;
      _logo = _user.logo;
      _deviceToken = _user.deviceToken;
      _website = _user.website;
      _uid = _user.uid;
      _type = _user.type;
      _products = _user.products;
      _favouriteProducts = _user.favouriteProducts;
      _favouriteUsers = _user.favouriteUsers;
      _cities = _user.cities;
      _description = _user.description;
      _qrCode = _user.qrcode;
      _certificates = _user.certificates;
      _connection = _user.connection;
      _sendConnection = _user.sendConnection;
      _newConnection = _user.newConnection;
    } else {
      print("Outside if in provider User");
      _uid = null;
    }
  }

  List<String> get ethnicWear => _ethnicWear;
  List<String> get apparelAndGarments => _apparelAndGarments;
  List<String> get saree => _saree;
  String get state => _state;
  String get gstNum => _gstNum;
  List<String> get categories => _categories;
  List<String> get fabrics => _fabrics;
  String get logo => _logo;
  String get name => _name;
  String get rating => _rating;
  String get companyName => _companyName;
  String get email => _email;
  String get type => _type;
  String get address => _address;
  String get city => _city;
  String get phoneNo => _phoneNo;
  String get establishmentYear => _establishmentYear;
  String get deviceToken => _deviceToken;
  String get pincode => _pincode;
  String get uid => _uid;
  String get website => _website;
  List<String> get kurti => _kurti;
  List<String> get dress => _dress;
  List<String> get cities => _cities;
  List<String> get products => _products;
  List<String> get favouriteProducts => _favouriteProducts;
  List<String> get favouriteUsers => _favouriteUsers;
  String get description => _description;
  List<String> get qrCode => _qrCode;
  List<String> get certificates => _certificates;
  List<String> get connection => _connection;
  List<String> get sendConnection => _sendConnection;
  List<String> get newConnection => _newConnection;

  User get user => _user;

  void setName(String name) {
    print(name);
    _name = name;
    _user.name = name;
    print(_user.name);

    notifyListeners();
    _userBox.put("user", _user);
  }

  void setCompanyName(String companyName) {
    _companyName = companyName;
    _user.companyName = companyName;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setAddress(String address) {
    _address = address;
    _user.address = address;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setPincode(String pincode) {
    _pincode = pincode;
    _user.pincode = pincode;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setCity(String city) {
    _city = city;
    _user.city = city;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setState(String state) {
    _state = state;
    _user.state = state;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setGst(String gst) {
    _gstNum = gst;
    _user.gstNum = gst;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setEstablishmentYear(String year) {
    _establishmentYear = year;
    _user.establishmentYear = year;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setPhoneNumber(String phone) {
    _phoneNo = phone;
    _user.phoneNo = phone;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setEmail(String email) {
    _email = email;
    _user.email = email;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setCategory(List category) {
    _categories = category;
    _user.categories = category;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setDeviceToken(String token) {
    _deviceToken = token;
    _user.deviceToken = token;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setlogo(String logo) {
    _logo = logo;
    _user.logo = logo;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setWebsite(String website) {
    _website = website;
    _user.website = website;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setSaree(List saree) {
    _saree = saree;
    _user.saree = saree;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setDress(List dress) {
    _dress = dress;
    _user.dress = dress;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setKurti(List kurti) {
    _kurti = kurti;
    _user.kurti = kurti;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setEthnicWear(List ethnicWear) {
    _ethnicWear = ethnicWear;
    _user.ethnicWear = ethnicWear;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setFabrics(List fabrics) {
    _fabrics = fabrics;
    _user.fabrics = fabrics;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setApparelAndGarments(List apparelAndGarments) {
    _apparelAndGarments = apparelAndGarments;
    _user.apparelAndGarments = apparelAndGarments;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setCities(List cities) {
    _cities = cities;
    _user.cities = cities;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setDescription(String description) {
    _description = description;
    _user.description = description;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setProducts(List products) {
    _products = products;
    _user.products = products;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setFavouriteProducts(String favProId) {
    if (!_favouriteProducts.contains(favProId)) {
      _favouriteProducts.add(favProId);
    } else {
      _favouriteProducts.remove(favProId);
    }
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setFavouriteUsers(String favUsersId) {
    if (!_favouriteUsers.contains(favUsersId)) {
      _favouriteUsers.add(favUsersId);
    } else {
      _favouriteUsers.remove(favUsersId);
    }
    _user.favouriteUsers = _favouriteUsers;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setQrCode(List qrCode) {
    _qrCode = qrCode;
    _user.qrcode = qrCode;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setCertificates(List<String> certificates) {
    _certificates.clear();
    _certificates.addAll(certificates);
    _user.certificates = certificates;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setConnection(String connection) {
    if (!_connection.contains(connection)) {
      _connection.add(connection);
    }
    _user.connection = _connection;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setSendConnection(String connection) {
    if (!_sendConnection.contains(connection)) {
      _sendConnection.add(connection);
    }
    _user.sendConnection = _sendConnection;
    notifyListeners();
    _userBox.put("user", _user);
  }

  void setNewConnection(String connection) {
    if (!_newConnection.contains(connection)) {
      _newConnection.add(connection);
    }
    _user.newConnection = _newConnection;
    notifyListeners();
    _userBox.put("user", _user);
  }
}

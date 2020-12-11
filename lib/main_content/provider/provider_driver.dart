import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';

class ProviderDriver with ChangeNotifier {
  List<dynamic> _userId;
  String _username;
  String _password;
  String _email;
  String _driverID;
  String _phoneNo;
    String _vehicleNo;
    String _loc_long;
    String _loc_lat;
    Box<Driver> _userBox;
  Driver _driver;

  
  ProviderDriver(){
    _userBox = Hive.box<Driver>("Driver");
    _driver = _userBox.get("driver");
    if (_driver != null) {
      print("Inside if in providerUser");
      _userId = _driver.userId;
      
    _username = _driver.username;
    _password = _driver.password;
    _email = _driver.email;
    _driverID = _driver.driverID;
    _phoneNo = _driver.phoneNo;
    _vehicleNo = _driver.vehicleNo;
    _loc_lat = _driver.loc_lat;
    _loc_long = _driver.loc_long;
      }

      else{
        print("Outside if in provider User");
      _driverID = null;
      }
    
  }

  List<dynamic> get userID => _userId;
  String get username =>_username;
  String get password => _password;
  String get email => _email;
  String get driverID => _driverID;
  String get phoneNo => _phoneNo;
  String get vehicleNo => _vehicleNo;
  String get loc_long => _loc_long;
  String get loc_lat => _loc_lat;

}
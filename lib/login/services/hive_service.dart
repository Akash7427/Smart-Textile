import 'package:hive/hive.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main.dart';

import 'package:smarttextile/Business/Invoice/driver.dart';

class HiveService {
  setHiveUser(User user) {
    try {
      Box<User> userBox = Hive.box<User>(userBoxName);

      userBox.put("user", user);
      print("Done Hive Uploading");
    } catch (e) {
      print(e);
    }
  }

  User getHiveUser() {
    try {
      Box<User> userBox = Hive.box<User>("User");
      User a = userBox.get("user");
      print(a.name);
      return a;
    } catch (e) {
      print(e);
    }
  }


  setHiveDriver(Driver driver) {
    try {
      Box<Driver> userBox = Hive.box<Driver>(driverBox);

      userBox.put("driver", driver);
      print("Done Hive Uploading");
    } catch (e) {
      print(e);
    }
  }


  Driver getHiveDriver() {
    try {
      Box<Driver> userBox = Hive.box<Driver>("Driver");
      Driver a = userBox.get("driver");
      print(a.name);
      return a;
    } catch (e) {
      print(e);
    }
  }
}

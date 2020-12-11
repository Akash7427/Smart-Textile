import 'package:hive/hive.dart';
import 'package:smarttextile/login/models/user.dart';

class LogOut {
  void userLogOut() {
    Box<User> userBox = Hive.box<User>("User");
    userBox.delete("user");
  }
}

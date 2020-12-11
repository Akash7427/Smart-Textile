import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smarttextile/login/models/pincode.dart';
import 'package:smarttextile/login/models/user.dart';

class ApiService {
  Future pincode(String pincode) async {
    try {
      http.Response response = await http
          .get("https://pincode.saratchandra.in/api/pincode/${pincode}");
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        Pincode pincodeData = Pincode.fromJson(body);
        return pincodeData;
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      http.Response response = await http.get(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/read/${uid}");

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(body);
        User user = User.fromJson(body);

        return user;
      }
    } catch (e) {}
  }

  Future postUser(User user, String uid) async {
    print(uid);
    try {
      http.Response response = await http.post(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/create/${uid}",
          headers: {
            'Content-type': 'application/json',
          },
          body: json.encode(user.toJson()));
      if (response.statusCode == 200) {
        print("Done");
      }

      print("Not Done");
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkGST(String gst) async {
    try {
      http.Response response = await http.get(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/check/${gst}");
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future updateDeviceToken(String token, String uid) async {
    try {
      http.Response response = await http.put(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/update-d/${uid}/${token}");
    } catch (e) {
      print(e);
    }
  }
}

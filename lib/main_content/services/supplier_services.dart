import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/models/supplier.dart';

class SupplierService {
  final String baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";

  Future<List<User>> getUser(String type, String categ) async {
    http.Response response =
        await http.get("${baseUrl}users/filter/${type}/${categ}");
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<User> suppliers = body.map((e) => User.fromJson(e)).toList();
      print("abcd");
      print(suppliers);
      return suppliers;
    } else {
      print("Error");
    }
  }

  Future getTranspoterUser(String type) async {
    http.Response response =
        await http.get("${baseUrl}users/type/${type}");
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);

      List<User> suppliers = body.map((e) => User.fromJson(e)).toList();
      print("abcd");
      print(suppliers);
      return suppliers;
    } else {
      print("Error");
    }
  }

  Future updateUser(User user) async {
    try {
      http.Response response = await http.put(
        "${baseUrl}users/update/${user.uid}",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(
          user.toJson(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}

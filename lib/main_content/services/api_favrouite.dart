import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/login/models/user.dart';

class ApiFavourite {
  String baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";
  Future<List<Product>> getFavProducts(List products) async {
    try {
      http.Response response = await http
          .get("${baseUrl}products/readUID/?uid=${products.join(",")}");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Product> favProductsList =
            body.map((e) => Product.fromJson(e)).toList();
        return favProductsList;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<User>> getFavUsers(List users) async {
    print("Get Fav. Users");
    try {
      http.Response response =
          await http.get("${baseUrl}users/readUID/?uid=${users.join(",")}");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<User> favUsersList = body.map((e) => User.fromJson(e)).toList();
        return favUsersList;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

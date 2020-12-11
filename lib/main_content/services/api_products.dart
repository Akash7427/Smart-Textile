import 'dart:convert';

import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:http/http.dart' as http;

class ApiProducts {
  String baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";

  Future<List<Product>> getProduct(String category) async {
    try {
      http.Response response =
          await http.get("${baseUrl}products/filter/category/$category");
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Product> productList = body
            .map(
              (e) => Product.fromJson(e),
            )
            .toList();
        print(productList);
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future productIncrementCounter(String uid) async {
    try {
      http.Response response =
          await http.put("${baseUrl}products/incrementCounter/$uid");
      if (response.statusCode == 200) {
        print("Counter Incremented");
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}

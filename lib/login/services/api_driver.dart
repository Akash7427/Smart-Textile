import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';

class ApiDriver {
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";

  Future checkDriver(String email, String username, String password) async {
    print(username+ email + password);
    try {
      http.Response response = await http.get(
          "${baseUrl}drivers/authentication/${email}/${username}/$password");

      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Driver> _driver = body.map((e) => Driver.fromJson(e)).toList();
        print(_driver[0].name);
        return _driver[0];
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      //return null;
    }
  }

  Future DriverPendindList(String id) async {
    try {
      http.Response response = await http.get(
          "${baseUrl}invoice/filter/inprogress-d/$id");

      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Invoice> invoice = body.map((e) => Invoice.fromJson(e)).toList();
        return invoice;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      //return null;
    }
  }



}

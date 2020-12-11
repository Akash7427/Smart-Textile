
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smarttextile/catalogue/screens/catalogue.dart';

class ApiCatalogue{
  
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";
  Future uploadcatalogue(Catalogue catalogue,String id) async {
    print(catalogue.toJson());
    print("Hello World");

    try {
      http.Response response = await http.post(
        "${baseUrl}catalogues/create/$id",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(catalogue.toJson()),
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  Future getAllCataloguelist(String id) async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}catalogues/readUserCatalogue/$id");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Catalogue> catalogueList =
            body.map((e) => Catalogue.fromJson(e)).toList();
        print(catalogueList);
        return catalogueList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
}
    Future getAllCataloguelist1() async {
    print("Hello World");
    try {
      http.Response response =
          await http.get("${baseUrl}catalogues/read");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        List<Catalogue> catalogueList =
            body.map((e) => Catalogue.fromJson(e)).toList();
        print(catalogueList);
        return catalogueList;
      } else {
        return null;
      }

      print(response.statusCode);
    } catch (e) {
      print(e);
      return null;
    }
}
}
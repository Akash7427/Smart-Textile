import 'dart:convert';

import 'package:smarttextile/main_content/models/requirements_model.dart';
import 'package:http/http.dart' as http;

class ApiRequirements {
  final baseUrl =
      "https://us-central1-smarttextile-137.cloudfunctions.net/app/";
  Future postRequirements(RequirementsModel requirements) async {
    try {
      http.Response response = await http.post(
        "${baseUrl}req/create",
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(
          requirements.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        print("Requirement Upload Done");
      } else {
        print("Requirement Upload Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<RequirementsModel>> getRequirements() async {
    try {
      http.Response response = await http.get("${baseUrl}req/read");
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<RequirementsModel> requirements =
            body.map((e) => RequirementsModel.fromJson(e)).toList();
        return requirements;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}

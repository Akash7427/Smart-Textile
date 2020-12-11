import 'dart:convert';

List<RequirementsModel> requirementsModelFromJson(String str) =>
    List<RequirementsModel>.from(
        json.decode(str).map((x) => RequirementsModel.fromJson(x)));

String requirementsModelToJson(List<RequirementsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequirementsModel {
  RequirementsModel({
    this.uid,
    this.description,
    this.category,
    this.subCategory,
    this.startingPrice,
    this.endingPrice,
  });

  String uid;
  String description;
  String category;
  String subCategory;
  String startingPrice;
  String endingPrice;

  factory RequirementsModel.fromJson(Map<String, dynamic> json) =>
      RequirementsModel(
        uid: json["uid"],
        description: json["description"],
        category: json["category"],
        subCategory: json["sub_category"],
        startingPrice: json["starting_price"],
        endingPrice: json["ending_price"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "description": description,
        "category": category,
        "sub_category": subCategory,
        "starting_price": startingPrice,
        "ending_price": endingPrice,
      };
}

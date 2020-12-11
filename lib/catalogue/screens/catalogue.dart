// To parse this JSON data, do
//
//     final catalogue = catalogueFromJson(jsonString);

import 'dart:convert';

List<Catalogue> catalogueFromJson(String str) => List<Catalogue>.from(json.decode(str).map((x) => Catalogue.fromJson(x)));

String catalogueToJson(List<Catalogue> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Catalogue {
    Catalogue({
        this.userId,
        this.name,
        this.code,
        this.pdf,
        this.category,
        this.connectedUsers,
        this.catId,
        this.public,
    });

    String userId;
    String name;
    String code;
    String pdf;
    String category;
    List<dynamic> connectedUsers;
    String catId;
    bool public;

    factory Catalogue.fromJson(Map<String, dynamic> json) => Catalogue(
        userId: json["userID"],
        name: json["name"],
        code: json["code"],
        pdf: json["pdf"],
        category: json["category"],
        connectedUsers: List<dynamic>.from(json["connectedUsers"].map((x) => x)),
        catId: json["catID"],
        public: json["public"]
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "name": name,
        "code": code,
        "pdf": pdf,
        "category": category,
        "connectedUsers": connectedUsers??[],
        "public":public,
        //"catID": catId,
    };
}

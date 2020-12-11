// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

import 'dart:ffi';

part 'driver.g.dart';

List<Driver> driverFromJson(String str) => List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String driverToJson(List<Driver> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 1)
class Driver {
    Driver({
        this.driverID,
        this.userId,
        this.name,
        this.phoneNo,
        this.vehicleNo,
        this.username,
        this.password,
        this.email,
        this.loc_long,
        this.loc_lat,
    });

    @HiveField(0)
    String driverID;
    @HiveField(1)
    List<dynamic> userId;
    @HiveField(2)
    String name;
    @HiveField(3)
    String phoneNo;
    @HiveField(4)
    String vehicleNo;
    @HiveField(5)
    String username;
    @HiveField(6)
    String password;
    @HiveField(7)
    String email;
    @HiveField(8)
    String loc_long;
    @HiveField(9)
    String loc_lat;

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverID: json["driverID"],
        userId: List<String>.from(json["userID"].map((x) => x)),
        name: json["name"],
        phoneNo: json["phoneNo"],
        vehicleNo: json["vehicleNo"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        loc_lat: json["loc_lat"],
        loc_long: json["loc_lang"],
    );

    Map<String, dynamic> toJson() => {
        //"driverID": driverID,
        "email":email,
        "userID": List<dynamic>.from(userId.map((x) => x)),
        "name": name,
        "phoneNo": phoneNo,
        "vehicleNo": vehicleNo,
        "username": username,
        "password": password,
    };
}

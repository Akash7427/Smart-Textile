import 'dart:convert';

Pincode pincodeFromJson(String str) => Pincode.fromJson(json.decode(str));

String pincodeToJson(Pincode data) => json.encode(data.toJson());

class Pincode {
  Pincode({
    this.status,
    this.data,
  });

  int status;
  List<Datum> data;

  factory Pincode.fromJson(Map<String, dynamic> json) => Pincode(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.pincode,
    this.officeName,
    this.deliveryStatus,
    this.divisionName,
    this.regionName,
    this.circleName,
    this.district,
    this.stateName,
    this.taluk,
  });

  String pincode;
  String officeName;
  String deliveryStatus;
  String divisionName;
  String regionName;
  String circleName;
  String district;
  String stateName;
  String taluk;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        pincode: json["pincode"],
        officeName: json["office_name"],
        deliveryStatus: json["delivery_status"],
        divisionName: json["division_name"],
        regionName: json["region_name"],
        circleName: json["circle_name"],
        district: json["district"],
        stateName: json["state_name"],
        taluk: json["taluk"],
      );

  Map<String, dynamic> toJson() => {
        "pincode": pincode,
        "office_name": officeName,
        "delivery_status": deliveryStatus,
        "division_name": divisionName,
        "region_name": regionName,
        "circle_name": circleName,
        "district": district,
        "state_name": stateName,
        "taluk": taluk,
      };
}

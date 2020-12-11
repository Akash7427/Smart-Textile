import 'dart:convert';
import 'package:hive/hive.dart';

part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class User {
  User({
    this.ethnicWear,
    this.apparelAndGarments,
    this.saree,
    this.state,
    this.gstNum,
    this.categories,
    this.fabrics,
    this.logo,
    this.name,
    this.rating,
    this.companyName,
    this.email,
    this.type,
    this.address,
    this.city,
    this.phoneNo,
    this.establishmentYear,
    this.deviceToken,
    this.pincode,
    this.kurti,
    this.dress,
    this.uid,
    this.website,
    this.description,
    this.favouriteProducts,
    this.favouriteUsers,
    this.products,
    this.cities,
    this.billGenerated,
    this.billRecieved,
    this.qrcode,
    this.certificates,
    this.connection,
    this.newConnection,
    this.sendConnection,
  });

  @HiveField(0)
  List<String> ethnicWear;
  @HiveField(1)
  List<String> apparelAndGarments;
  @HiveField(2)
  List<String> saree;
  @HiveField(3)
  String state;
  @HiveField(4)
  String gstNum;
  @HiveField(5)
  List<String> categories;
  @HiveField(6)
  List<String> fabrics;
  @HiveField(7)
  String logo;
  @HiveField(8)
  String name;
  @HiveField(9)
  String rating;
  @HiveField(10)
  String companyName;
  @HiveField(11)
  String email;
  @HiveField(12)
  String type;
  @HiveField(13)
  String address;
  @HiveField(14)
  String city;
  @HiveField(15)
  String phoneNo;
  @HiveField(16)
  String establishmentYear;
  @HiveField(17)
  String deviceToken;
  @HiveField(18)
  String pincode;
  @HiveField(19)
  List<String> kurti;
  @HiveField(20)
  List<String> dress;
  @HiveField(21)
  String uid;
  @HiveField(22)
  String website;
  @HiveField(23)
  String description;
  @HiveField(24)
  List<String> products;
  @HiveField(25)
  List<String> favouriteUsers;
  @HiveField(26)
  List<String> favouriteProducts;
  @HiveField(27)
  List<String> cities;
  @HiveField(28)
  List<String> billGenerated;
  @HiveField(29)
  List<String> billRecieved;
  @HiveField(30)
  List<String> qrcode;
  @HiveField(31)
  List<String> certificates;
  @HiveField(32)
  List<String> connection;
  @HiveField(33)
  List<String> newConnection;
  @HiveField(34)
  List<String> sendConnection;

  factory User.fromJson(Map<String, dynamic> json) => User(
      ethnicWear: List<String>.from(json["Ethnic_Wear"].map((x) => x)),
      apparelAndGarments:
          List<String>.from(json["Apparel_And_Garments"].map((x) => x)),
      saree: List<String>.from(json["Saree"].map((x) => x)),
      state: json["state"],
      gstNum: json["gst_num"],
      categories: List<String>.from(json["categories"].map((x) => x)),
      fabrics: List<String>.from(json["Fabrics"].map((x) => x)),
      logo: json["logo"],
      name: json["name"],
      rating: json["rating"],
      companyName: json["company_name"],
      email: json["email"],
      type: json["type"],
      address: json["address"],
      city: json["city"],
      phoneNo: json["phone_no"],
      establishmentYear: json["establishment_year"],
      deviceToken: json["device_token"],
      pincode: json["pincode"],
      uid: json["uid"],
      website: json["website"],
      kurti: List<String>.from(json["Kurti"].map((x) => x)),
      dress: List<String>.from(json["Dress"].map((x) => x)),
      products: List<String>.from(json["products"].map((x) => x)),
      description: json["description"],
      favouriteProducts:
          List<String>.from(json["favourite_products"].map((x) => x)),
      favouriteUsers: List<String>.from(json["favourite_users"].map((x) => x)),
      cities: List<String>.from(json["cities"].map((x) => x)),
      billGenerated: List<String>.from(json["bill_generated"].map((x) => x)),
      billRecieved: List<String>.from(json["bill_recieved"].map((x) => x)),
      qrcode: List<String>.from(json["qrcode"].map((x) => x)),
      certificates: List<String>.from(json["certificates"].map((x) => x)),
      //connection: List<String>.from(json["connection"].map((x) => x)),
      //newConnection: List<String>.from(json["new_connection"].map((x) => x)),
      //sendConnection: List<String>.from(json["send_connection"].map((x) => x))
      
      );

  Map<String, dynamic> toJson() => {
        "Ethnic_Wear": ethnicWear ?? [],
        "Apparel_And_Garments": apparelAndGarments ?? [],
        "Saree": saree ?? [],
        "state": state,
        "gst_num": gstNum,
        "categories": categories,
        "Fabrics": fabrics ?? [],
        "logo": logo,
        "name": name,
        "rating": rating ?? "5.0",
        "company_name": companyName,
        "email": email,
        "type": type,
        "address": address,
        "city": city,
        "phone_no": phoneNo,
        "establishment_year": establishmentYear,
        "device_token": deviceToken,
        "pincode": pincode,
        "uid": uid,
        "website": website,
        "Kurti": kurti ?? [],
        "Dress": dress ?? [],
        "favourite_users": favouriteUsers ?? [],
        "favourite_products": favouriteProducts ?? [],
        "description": description,
        "products": products ?? [],
        "cities": cities ?? [],
        "bill_generated": billGenerated ?? [],
        "bill_recieved": billRecieved ?? [],
        "qrcode": qrcode ?? [],
      };
}

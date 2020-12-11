class Supplier {
  String id;
  String name;
  String companyName;
  String address;
  String city;
  String state;
  String pincode;
  int phoneNo;
  String email;
  String logo;
  String gSTNum;
  int establishmentYear;
  //List<dynamic> category;
  int rating;

  Supplier(
      {this.id,
      this.name,
      this.companyName,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.phoneNo,
      this.email,
      this.logo,
      this.gSTNum,
      this.establishmentYear,
      //this.category,
      this.rating});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    companyName = json['company_name'];
    address = json['Address'];
    city = json['City'];
    state = json['State'];
    pincode = json['Pincode'];
    phoneNo = json['phone_no'];
    email = json['email'];
    logo = json['logo'];
    gSTNum = json['GST_num'];
    establishmentYear = json['Establishment_year'];
    //category = json['category'];
    rating = json['Rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Pincode'] = this.pincode;
    data['phone_no'] = this.phoneNo;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['GST_num'] = this.gSTNum;
    data['Establishment_year'] = this.establishmentYear;
    //data['category'] = this.category;
    data['Rating'] = this.rating;
    return data;
  }
}

// class Cate{
//   final categoryName;
//   Cate({this.categoryName});

//   factory Cate.fromJson(Map<String, dynamic> json)=>Cate(
//     categoryName: json["name"]
//   );
// }

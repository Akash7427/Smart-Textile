// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.orderID,
    this.sellerName,
    this.buyerState,
    this.buyerGST,
    this.buyerCity,
    this.productUID,
    this.accept,
    this.buyerPhoneNo,
    this.buyerName,
    this.sellerUID,
    this.sellerGST,
    this.sellerPhoneNo,
    this.buyerUID,
    this.sellerState,
    this.price,
    this.buyerAddress,
    this.sellerAddress,
    this.sellerPincode,
    this.sellerCity,
    this.buyerPincode,
    this.quantity,
    this.product,
    this.category,
    this.invoiceID,
    this.completed,
  });

  String product;
  String category;
  String orderID;
  String sellerName;
  String buyerState;
  String buyerGST;
  String buyerCity;
  String productUID;
  bool accept;
  String buyerPhoneNo;
  String buyerName;
  String sellerUID;
  String sellerGST;
  String sellerPhoneNo;
  String buyerUID;
  String sellerState;
  String price;
  String buyerAddress;
  String sellerAddress;
  String sellerPincode;
  String sellerCity;
  String buyerPincode;
  String quantity;
  String invoiceID;
  bool completed;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        product: json["product"],
        category: json["category"],
        orderID: json["orderID"],
        sellerName: json["sellerName"],
        buyerState: json["buyerState"],
        buyerGST: json["buyerGST"],
        buyerCity: json["buyerCity"],
        productUID: json["productUID"],
        accept: json["accept"],
        buyerPhoneNo: json["buyerPhoneNo"],
        buyerName: json["buyerName"],
        sellerUID: json["sellerUID"],
        sellerGST: json["sellerGST"],
        sellerPhoneNo: json["sellerPhoneNo"],
        buyerUID: json["buyerUID"],
        sellerState: json["sellerState"],
        price: json["price"],
        buyerAddress: json["buyerAddress"],
        sellerAddress: json["sellerAddress"],
        sellerPincode: json["sellerPincode"],
        sellerCity: json["sellerCity"],
        buyerPincode: json["buyerPincode"],
        quantity: json["quantity"],
        invoiceID: json["invoiceID"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "category": category,
        //"orderID": orderID,
        "sellerName": sellerName,
        "buyerState": buyerState,
        "buyerGST": buyerGST,
        "buyerCity": buyerCity,
        "productUID": productUID,
        "accept": accept ?? false,
        "buyerPhoneNo": buyerPhoneNo,
        "buyerName": buyerName,
        "sellerUID": sellerUID,
        "sellerGST": sellerGST,
        "sellerPhoneNo": sellerPhoneNo,
        "buyerUID": buyerUID,
        "sellerState": sellerState,
        "price": price,
        "buyerAddress": buyerAddress,
        "sellerAddress": sellerAddress,
        "sellerPincode": sellerPincode,
        "sellerCity": sellerCity,
        "buyerPincode": buyerPincode,
        "quantity": quantity,
        "invoiceID": invoiceID ?? "",
        "completed": completed ?? false,
      };
}

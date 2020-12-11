import 'dart:convert';

Invoice invoiceFromJson(String str) => Invoice.fromJson(json.decode(str));

String invoiceToJson(Invoice data) => json.encode(data.toJson());

class Invoice {
  Invoice({
    this.sellerId,
    this.sellerName,
    this.sellerGst,
    this.sellerAddress,
    this.sellerPhoneNo,
    this.buyerId,
    this.buyerName,
    this.buyerGst,
    this.buyerAddress,
    this.buyerPhoneNo,
    this.transporterId,
    this.transporterName,
    this.transporterGst,
    this.transporterPhoneNo,
    this.product,
    this.quantity,
    this.price,
    this.date,
    this.bill_link,
    this.qrcode,
    this.invoiceID,
    this.pending,
    this.inprogress,
    this.completed,
    this.orderID,
    this.driverID
  });

  bool pending;
  bool inprogress;
  bool completed;
  String invoiceID;
  String sellerId;
  String sellerName;
  String sellerGst;
  String sellerAddress;
  String sellerPhoneNo;
  String buyerId;
  String buyerName;
  String buyerGst;
  String buyerAddress;
  String buyerPhoneNo;
  String transporterId;
  String transporterName;
  String transporterGst;
  String transporterPhoneNo;
  String product;
  String quantity;
  String price;
  String date;
  String qrcode;
  String bill_link;
  String orderID;
  String driverID;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        invoiceID: json["invoiceID"],
        sellerId: json["sellerID"],
        sellerName: json["sellerName"],
        sellerGst: json["sellerGST"],
        sellerAddress: json["sellerAddress"],
        sellerPhoneNo: json["sellerPhoneNo"],
        buyerId: json["buyerID"],
        buyerName: json["buyerName"],
        buyerGst: json["buyerGST"],
        buyerAddress: json["buyerAddress"],
        buyerPhoneNo: json["buyerPhoneNo"],
        transporterId: json["transporterID"],
        transporterName: json["transporterName"],
        transporterGst: json["transporterGST"],
        transporterPhoneNo: json["transporterPhoneNo"],
        product: json["product"],
        quantity: json["quantity"],
        price: json["price"],
        date: json["date"],
        qrcode: json["qrcode"],
        bill_link: json["bill_link"],
        pending: json["pending"],
        inprogress: json["inprogress"],
        completed: json["completed"],
        orderID: json["orderID"],
        driverID: json["driverID"]
      );

  Map<String, dynamic> toJson() => {
        "orderID": orderID,
        // "pending": pending ?? true,
        //"inprogress": inprogress ?? false,
        //"completed": completed ?? false,
        //"invoiceID": invoiceID,
        "driverID":driverID??"",
        "sellerID": sellerId,
        "sellerName": sellerName,
        "sellerGST": sellerGst,
        "sellerAddress": sellerAddress,
        "sellerPhoneNo": sellerPhoneNo,
        "buyerID": buyerId,
        "buyerName": buyerName,
        "buyerGST": buyerGst,
        "buyerAddress": buyerAddress,
        "buyerPhoneNo": buyerPhoneNo,
        "transporterID": transporterId,
        "transporterName": transporterName,
        "transporterGST": transporterGst,
        "transporterPhoneNo": transporterPhoneNo,
        "product": product,
        "quantity": quantity,
        "price": price,
        //"date": date,
        "qrcode": qrcode,
        "bill_link": bill_link,
      };
}

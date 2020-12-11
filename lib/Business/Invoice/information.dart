import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:smarttextile/Business/Main/dashboard.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/main_content/components/radial.dart';

import 'api_service.dart';
import 'grey_header.dart';
import 'invoice.dart';
import 'scanner.dart';
import 'size_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flare_flutter/flare_actor.dart';

class ConfirmDtls extends StatefulWidget {
  final List deviceTokenTransporter;
  final Invoice invoice;
  final Order order;

  const ConfirmDtls(
      {Key key, this.invoice, this.order, this.deviceTokenTransporter})
      : super(key: key);
  @override
  _ConfirmDtlsState createState() => _ConfirmDtlsState();
}

class _ConfirmDtlsState extends State<ConfirmDtls> {
  Invoice invoice;
   bool _visibleError = false;
  bool _loadingVisible = false;
  var _quantity = TextEditingController();
  var _price = TextEditingController();
  var _buyerAddress = TextEditingController();
  var _buyerPhone = TextEditingController();
  String url = "";
  Future savePdf(File file) async {
    StorageReference _storageReference;
    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('invoice/${DateTime.now().millisecondsSinceEpoch}');
      final StorageUploadTask uploadTask = _storageReference.putFile(file);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      print(url);
      print(url.runtimeType);
      return url;
    } catch (e) {
      return null;
    }
  }

  GlobalKey globalKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    invoice = widget.invoice;
    _quantity = new TextEditingController(text: invoice.quantity);
    _price = new TextEditingController(text: invoice.price);
    _buyerAddress = new TextEditingController(text: invoice.buyerAddress);
    _buyerPhone = new TextEditingController(text: invoice.buyerPhoneNo);
  }

  @override
  Widget build(BuildContext context) {
    String sellername = invoice.sellerName;
    String buyername = invoice.buyerName;
    String transpotername = invoice.transporterName;
    String selleraddress = invoice.sellerAddress;
    String product = invoice.product;
    String sellerphone = invoice.sellerPhoneNo;
    String transpoterphone = invoice.transporterPhoneNo;
    String sellergst = invoice.sellerGst;
    String buyergst = invoice.buyerGst;
    String transpotergst = invoice.transporterGst;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: GreyHeader(
                        name: "Add Information",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Seller Info",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 1,
                      width: SizeConfig.safeBlockVertical * 400,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff4BFF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "Seller Name",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Text(
                            sellername,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff4BFF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "Seller Gst",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Expanded(
                            child: Text(
                              sellergst,
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 50,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff4BFF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "SellerAddress",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Expanded(
                            child: Text(
                              selleraddress,
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff4BFF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "SellerPhoneNo.",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Expanded(
                            child: Text(
                              sellerphone,
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Buyer Info",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 1,
                      width: SizeConfig.safeBlockVertical * 400,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffFFA200).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "Buyer Name",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Text(
                            buyername,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffFFA200).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 100,
                            child: Text(
                              "Buyer Gst",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 25,
                          ),
                          Expanded(
                            child: Text(
                              buyergst,
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Buyer Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: TextField(
                        controller: _buyerAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Buyer Address",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Buyer PhoneNo.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: TextField(
                        controller: _buyerPhone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Buyer PhoneNo.",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Transpoter Info",
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 1,
                      width: SizeConfig.safeBlockVertical * 400,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffF7FF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 110,
                            child: Text(
                              "Transpoter Name",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Text(
                            transpotername,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    invoice.transporterGst != null
                        ? Container(
                            height: SizeConfig.safeBlockHorizontal * 40,
                            width: SizeConfig.safeBlockVertical * 299,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(35),
                                    topRight: Radius.circular(35)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xffF7FF00).withOpacity(0.3),
                                      blurRadius: 2,
                                      offset: Offset(0, 2)),
                                ]),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConfig.safeBlockVertical * 25,
                                ),
                                Container(
                                  width: SizeConfig.safeBlockVertical * 110,
                                  child: Text(
                                    "Transpoter Gst",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 15,
                                        color: Colors.black,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockVertical * 25,
                                ),
                                Container(
                                  height: SizeConfig.safeBlockHorizontal * 10,
                                  width: SizeConfig.safeBlockVertical * 1,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockVertical * 25,
                                ),
                                Expanded(
                                  child: Text(
                                    transpotergst,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 15,
                                        color: Colors.black,
                                        fontFamily: "Segoe UI",
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ))
                        : SizedBox(),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffF7FF00).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 110,
                            child: Text(
                              "TranspoterPhone",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Text(
                            transpoterphone,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Product Info",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: SizeConfig.safeBlockHorizontal * 25,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 1,
                      width: SizeConfig.safeBlockVertical * 400,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 31,
                      width: SizeConfig.safeBlockVertical * 299,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              topRight: Radius.circular(35)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffFF0000).withOpacity(0.3),
                                blurRadius: 2,
                                offset: Offset(0, 2)),
                          ]),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            width: SizeConfig.safeBlockVertical * 60,
                            child: Text(
                              "Product",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal * 10,
                            width: SizeConfig.safeBlockVertical * 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 25,
                          ),
                          Text(
                            product,
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Quantity (CAN BE CHANGED)",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: TextField(
                        controller: _quantity,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Quantity",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Price (CAN BE CHANGED)",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: TextField(
                        controller: _price,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Price",
                          hintStyle: TextStyle(
                              color: Color(0xff646464),
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(left: 10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      onPressed: () async {
                        File file;
                        try {
                          file = await reportView(
                              invoice.sellerName,
                              invoice.buyerName,
                              invoice.transporterName,
                              invoice.quantity,
                              invoice.sellerAddress,
                              invoice.buyerAddress,
                              invoice.product,
                              invoice.date,
                              invoice.sellerPhoneNo,
                              invoice.buyerPhoneNo,
                              invoice.transporterPhoneNo,
                              invoice.price,
                              invoice.sellerGst,
                              invoice.buyerGst,
                              invoice.transporterGst);
                        } catch (e) {
                          print(e);
                        }
                        try {
                          setState(() {
                            _loadingVisible = true;
                          });
                          url = await savePdf(file);
                          invoice.bill_link = url;
                          setState(() {
                            url = url;
                          });
                          url != null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QrCode(
                                            deviceTokenTransporter:
                                                widget.deviceTokenTransporter,
                                            url: invoice.buyerId,
                                            invoice: invoice,
                                            order: widget.order,
                                          )))

                              : _loadingVisible = true;
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Colors.blue,
                      child: Text("Confirm"),
                    ),
                  ],
                ),
              ],
            ),
            Radial(),
            Visibility(
              visible: _loadingVisible,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black38,
                child: Center(
                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 120,
                    width: SizeConfig.safeBlockHorizontal * 120,
                    child: FlareActor(
                      "assets/images/loader.flr",
                      animation: "Aura",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  reportView(
    String sellername,
    String buyername,
    String transpotername,
    String quantity,
    String selleraddress,
    String buyeraddress,
    String product,
    String date,
    String sellerphone,
    String buyerphone,
    String transpoterphone,
    String price,
    String sellergst,
    String buyergst,
    String transpotergst,
  ) async {
    final pw.Document pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
        pageFormat:
            PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          if (context.pageNumber == 1) {
            return null;
          }
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              decoration: const pw.BoxDecoration(
                  border: pw.BoxBorder(
                      bottom: true, width: 0.5, color: PdfColors.grey)),
              child: pw.Text('Invoice : 0001',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        footer: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.centerRight,
              margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              child: pw.Text(
                  'Page ${context.pageNumber} of ${context.pagesCount}',
                  style: pw.Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Invoice : 0001', textScaleFactor: 2),
                      pw.Text('Date : $date', textScaleFactor: 2),
                    ])),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            pw.Header(
                level: 1,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Seller Info',
                          textScaleFactor: 1.5,
                          style: pw.TextStyle(color: PdfColors.green)),
                    ])),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            pw.Column(children: <pw.Widget>[
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Seller name : $sellername",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Seller address : $selleraddress",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Seller phone : $sellerphone",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Seller GST: $sellergst",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Transporter name : $transpotername",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Transporter phone : $transpoterphone",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Transpoter GST : $transpotergst",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
            ]),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            pw.Header(
                level: 1,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Buyer Info',
                          textScaleFactor: 1.5,
                          style: pw.TextStyle(color: PdfColors.orange)),
                    ])),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            pw.Column(children: <pw.Widget>[
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Buyer name : $buyername",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Buyer address : $buyeraddress",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Buyer phone : $buyerphone",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text("Buyer GST : $buyergst",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)),
              ),
            ]),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 5),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Table.fromTextArray(
                context: context,
                oddRowDecoration: pw.BoxDecoration(color: PdfColors.grey),
                rowDecoration: pw.BoxDecoration(color: PdfColors.white),
                headerDecoration: pw.BoxDecoration(color: PdfColors.blue),
                cellStyle: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: SizeConfig.safeBlockHorizontal * 10),
                headerStyle:
                    pw.TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 15),
                data: <List<String>>[
                  <String>['Description', 'Quantity', 'Price'],
                  <String>['$product', '$quantity', '$price'],
                  <String>['', '', ''],
                  <String>['', '', ''],
                  <String>['', '', ''],
                  <String>['Total', '$quantity', '$price'],
                ]),
            pw.SizedBox(height: SizeConfig.safeBlockHorizontal * 45),
            pw.Center(
                child: pw.Text("Thank You For Business!",
                    style: pw.TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15)))
          ];
        }));
    //save PDF
    final String dir = (await getExternalStorageDirectory()).path;
    final String path = '$dir/invoice.pdf';
    final File file = File(path);
    await file.writeAsBytes(pdf.save());
    return file;
  }
}

class QrCode extends StatefulWidget {
  final List deviceTokenTransporter;
  final Order order;
  final String url;
  final Invoice invoice;
  

  const QrCode(
      {Key key,
      this.url,
      this.invoice,
      this.order,
      this.deviceTokenTransporter})
      : super(key: key);
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  
   bool _visibleError = false;
  bool _loadingVisible = false;
  Future savePdf(File file) async {
    StorageReference _storageReference;
    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('qrcode/${DateTime.now().millisecondsSinceEpoch}');
      final StorageUploadTask uploadTask = _storageReference.putFile(file);
      final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
      final String url = (await downloadUrl.ref.getDownloadURL());
      print(url);
      print(url.runtimeType);
      return url;
    } catch (e) {
      return null;
    }
  }

  Future<String> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);
      var y = await savePdf(file);
      print("y:-   " + y.toString());
      return y;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: GreyHeader(
                    name: "Qr Code",
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.blueAccent, blurRadius: 5),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          RepaintBoundary(
                            key: globalKey,
                            child: QrImage(
                              data: widget.url,
                              size: SizeConfig.safeBlockHorizontal * 250,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal * 15,
                          ),
                          Text(
                            "Note : This is your private Qr Code don't share with anyone",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: SizeConfig.safeBlockHorizontal * 25,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal * 15,
                          ),
                          Center(
                            child: RaisedButton(
                              color: Colors.black,
                              child: Text(
                                "Ok",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 25),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _loadingVisible =true;
                                });
                                String qrLink = await _captureAndSharePng();
                                widget.invoice.qrcode = qrLink;
                                print(widget.invoice.qrcode);
                                DateTime now = DateTime.now();
                                String formattedDate =
                                    DateFormat('kk:mm:ssEEEdMMM').format(now);
                                String id =
                                    widget.invoice.sellerId + formattedDate;
                                print(id);
                                //widget.invoice.invoiceID = id;
                                print(widget.invoice.toJson());

                                await ApiService().uploadInvoice(widget.invoice,
                                    id, widget.deviceTokenTransporter);
                                await ApiService()
                                    .changeAccept(widget.order.orderID);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageBusinessDashboard()));
                                _loadingVisible = false;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Radial(),
            Visibility(
              visible: _loadingVisible,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black38,
                child: Center(
                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 120,
                    width: SizeConfig.safeBlockHorizontal * 120,
                    child: FlareActor(
                      "assets/images/loader.flr",
                      animation: "Aura",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

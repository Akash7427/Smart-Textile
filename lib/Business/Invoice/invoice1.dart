import 'dart:math';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/Business/Main/dashboard.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';

import 'invoice.dart';
import 'size_config.dart';
import 'transpoter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Invoice1 extends StatefulWidget {
  final Order order;

  const Invoice1({Key key, this.order}) : super(key: key);
  @override
  _Invoice1State createState() => _Invoice1State();
}

class _Invoice1State extends State<Invoice1> {
  

  

  Invoice invoice = Invoice();
  Order order;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    order = widget.order;
  }

  ProviderUser providerUser;
  @override
  Widget build(BuildContext context) {
    providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                customTile(null, order.buyerName, order.category, order.product, order.quantity, order.price)
              ],
            ),
            Radial()
          ],
        ),
      ),
    );
  }

  customTile(String image1, String buyer, String category, String product,
      String quantity, String price) {
    return Column(
      children: <Widget>[
        Container(
          width: SizeConfig.blockSizeVertical * 500,
          height: SizeConfig.safeBlockHorizontal * 256,
          decoration: BoxDecoration(
            color: Color(0xff8DCDD8),
            image: DecorationImage(
                image: image1 != null
                    ? NetworkImage(image1)
                    : AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: SizeConfig.safeBlockHorizontal * 45,
                width: SizeConfig.safeBlockVertical * 45,
                color: Colors.transparent,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal * 30,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal * 38,
          width: SizeConfig.safeBlockVertical * 299,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff0076B4).withOpacity(0.3),
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
                  "Buyer",
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
              Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockHorizontal * 10,
                    width: SizeConfig.safeBlockVertical * 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockVertical * 25,
                  ),
                  Text(
                    buyer,
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 15,
                        color: Colors.black,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockHorizontal * 5,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal * 38,
          width: SizeConfig.safeBlockVertical * 299,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff0076B4).withOpacity(0.3),
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
                  "Category",
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
                category,
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
          height: SizeConfig.safeBlockHorizontal * 5,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal * 38,
          width: SizeConfig.safeBlockVertical * 299,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff0076B4).withOpacity(0.3),
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
          height: SizeConfig.safeBlockHorizontal * 5,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal * 38,
          width: SizeConfig.safeBlockVertical * 299,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff0076B4).withOpacity(0.3),
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
                  "Quantity",
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
                quantity,
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
          height: SizeConfig.safeBlockHorizontal * 5,
        ),
        Container(
          height: SizeConfig.safeBlockHorizontal * 38,
          width: SizeConfig.safeBlockVertical * 299,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff0076B4).withOpacity(0.3),
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
                  "Price",
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
                price,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.lightGreenAccent)),
              onPressed: () async {
                try {
                  const _chars =
                      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                  Random _rnd = Random();

                  String getRandomString(int length) =>
                      String.fromCharCodes(Iterable.generate(
                          length,
                          (_) =>
                              _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
                  invoice.sellerId = providerUser.uid;
                  invoice.buyerId = order.buyerUID;
                  invoice.sellerName = providerUser.companyName;
                  invoice.buyerName = buyer;

                  invoice.quantity = quantity;
                  invoice.sellerAddress =
                      "${providerUser.address}, ${providerUser.city}, ${providerUser.state}, ${providerUser.pincode}";
                  invoice.buyerAddress =
                      "${order.buyerAddress},${order.buyerCity},${order.buyerState},${order.buyerPincode}";
                  invoice.product = product;

                  invoice.sellerPhoneNo = providerUser.phoneNo;
                  invoice.buyerPhoneNo = order.buyerPhoneNo;
                  //invoice.invoiceid = "0001";
                  invoice.price = price;
                  invoice.orderID = order.orderID;
                  invoice.buyerGst = getRandomString(15);
                  invoice.sellerGst = providerUser.gstNum;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransportDtls(
                                invoice: invoice,order: order,
                              )));
                } catch (e) {
                  print(e);
                }
              },
              color: Colors.lightGreenAccent,
              child: Text("Accept"),
            ),
            SizedBox(
              width: SizeConfig.safeBlockVertical * 15,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              onPressed: () async {
                 await ApiService().deleteorder(order.orderID);
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageBusinessDashboard()));
              },
              color: Colors.red,
              child: Text("Decline"),
            ),
          ],
        ),
      ],
    );
  }
}

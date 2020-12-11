import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';

class DriverScan extends StatefulWidget {
  final Invoice invoice;

  const DriverScan({Key key, this.invoice}) : super(key: key);
  @override
  _DriverScanState createState() => _DriverScanState();
}

class _DriverScanState extends State<DriverScan> {
  Invoice invoice;
  String _result = "";
  Future _scanQR() async {
    try {
      String qrResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      setState(() {
        _result = qrResult;
        print(_result);
      });
    } catch (ex) {
      setState(() {
        _result = "Unknown Error $ex";
        print(_result);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    invoice = widget.invoice;
  }

  @override
  Widget build(BuildContext context) {
    String sellername = invoice.sellerName ?? "";
    String buyername = invoice.buyerName ?? "";
    String selleraddress = invoice.sellerAddress ?? "";
    String buyeraddress = invoice.buyerAddress ?? "";
    String sellerphone = invoice.sellerPhoneNo ?? "";
    String buyerphone = invoice.buyerPhoneNo ?? "";
    SizeConfig().init(context);
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
                  Align(
                  alignment: Alignment.topLeft,
                  child:IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                    Navigator.pop(context);
                  }),),

                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 25,
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
                    height: SizeConfig.safeBlockHorizontal * 45,
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
                    height: SizeConfig.safeBlockHorizontal * 64,
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
                    height: SizeConfig.safeBlockHorizontal * 45,
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
                        Text(
                          sellerphone,
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
                    height: SizeConfig.safeBlockHorizontal * 45,
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
                    height: SizeConfig.safeBlockHorizontal * 64,
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
                            "BuyerAddress",
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
                            buyeraddress,
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
                    height: SizeConfig.safeBlockHorizontal * 45,
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
                            "BuyerPhoneNo.",
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
                          buyerphone,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              color: Colors.black,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  
                ],
              ),
              
            ],
          ),
          Container(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton.extended(
                          icon: Icon(Icons.camera_alt),
                          label: Text("Scan"),
                          onPressed: () async {
                            await _scanQR();
                            if (invoice.invoiceID == _result) {
                              print("Same");
                              await ApiService()
                                  .changeOrderCompleted(invoice.invoiceID);
                            } else {
                              print("error");
                            }
                          },
                        ),
                      ),
                    ),
                  ),
        ],
      )),
    );
  }
}

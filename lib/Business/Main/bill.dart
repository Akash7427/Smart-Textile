import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Business/Main/bill.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flare_flutter/flare_actor.dart';


class Bill extends StatefulWidget {
  final ProviderUser providerUser;
  Bill({@required this.providerUser});
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  
   bool _visibleError = false;
  bool _loadingVisible = false;
  List<Invoice> invoiceList = List();
  Future getInvoice() async {
    invoiceList = await ApiService().getAllUserInvoice(widget.providerUser.uid);
    setState(() {});
  }

  _launchURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingVisible = true;
    getInvoice();
    _loadingVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeHorizontal * 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(0.3),
                            blurRadius: 2,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        "Bill",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 20,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                Expanded(
                  child: Container(
                    child: invoiceList != null
                        ? ListView.builder(
                            itemCount: invoiceList.length,
                            itemBuilder: (context, index) {
                              // return Text(invoiceList[index].buyerName);
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.blockSizeHorizontal * 15.0,
                                  vertical: SizeConfig.safeBlockVertical * 7,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.safeBlockVertical * 5,
                                    horizontal: SizeConfig.safeBlockHorizontal * 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.blockSizeVertical *
                                                12.0),
                                        child: Container(
                                            child: Center(
                                                child: Text(
                                          "#$index",
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.blockSizeHorizontal *
                                                      30,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Segoe UI"),
                                        ))),
                                      ),
                                      SizedBox(
                                          width: SizeConfig.blockSizeVertical * 10),
                                      Container(
                                        height: SizeConfig.blockSizeHorizontal * 50,
                                        width: SizeConfig.blockSizeVertical * 1,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                          width: SizeConfig.blockSizeVertical * 10),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              FittedBox(
                                                child: Text(
                                                  "Product : ${invoiceList[index].product}",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                          15,
                                                      fontFamily: "Segoe UI"),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    SizeConfig.blockSizeHorizontal *
                                                        5,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "Buyer name : ${invoiceList[index].buyerName}",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                          15,
                                                      fontFamily: "Segoe UI"),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    SizeConfig.blockSizeHorizontal *
                                                        5,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "Quantity : ${invoiceList[index].quantity}",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                          15,
                                                      fontFamily: "Segoe UI"),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    SizeConfig.blockSizeHorizontal *
                                                        5,
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "Price : ${invoiceList[index].price}",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                          15,
                                                      fontFamily: "Segoe UI"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.blockSizeVertical * 5,
                                      ),
                                      Container(
                                        height: SizeConfig.blockSizeHorizontal * 50,
                                        width: SizeConfig.blockSizeVertical * 1,
                                        color: Colors.grey,
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.file_download),
                                          onPressed: () async {
                                            await _launchURL(
                                                "${invoiceList[index].bill_link}");
                                          })
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Column(
                          children: <Widget>[
                            Text(
                            "No Bill Listed Here",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal * 19),
                          ),
                          SizedBox(height: SizeConfig.safeBlockHorizontal*15,),
                            SvgPicture.asset(
                                "assets/images/svg/no_invoice.svg",
                                height: SizeConfig.safeBlockVertical * 270,
                                width: SizeConfig.safeBlockHorizontal * 270,
                              ),
                              SizedBox(height: SizeConfig.safeBlockHorizontal*15,),
                          Text(
                            "Sell Some Product First",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal * 19),
                          ),
                          ],
                        ),
                  ),
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
}

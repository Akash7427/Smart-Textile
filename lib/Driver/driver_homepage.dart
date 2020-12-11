import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Driver/driver_scan.dart';
import 'package:smarttextile/Transporter/screens/transporter_driver.dart';
import 'package:smarttextile/login/screens/login_body.dart';
import 'package:smarttextile/login/services/api_driver.dart';
import 'package:smarttextile/main_content/components/search_bar.dart';
import 'package:smarttextile/main_content/screens/shared/user_notification.dart';
import 'package:smarttextile/Driver/services/location.dart';
import 'dart:async';

import 'package:smarttextile/shared/size_config.dart';

class DriverHomePage extends StatefulWidget {
  final Driver driver;

  const DriverHomePage({Key key, this.driver}) : super(key: key);
  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  Driver driver;

  List<Invoice> orderList = List();

  Future getdriverorder() async {
    orderList = await ApiDriver().DriverPendindList(widget.driver.driverID);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    driver = widget.driver;
    getdriverorder();
    if(orderList != null){
    Timer.periodic(Duration(minutes: 1), (timer) {
      Location().getCurrentLocation(widget.driver);
     });}
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  color: Color(0xff62B9BF),
                  width: double.maxFinite,
                  height: SizeConfig.safeBlockVertical * 84,
                  //color: Colors.red,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 10,
                    vertical: SizeConfig.safeBlockVertical * 7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          height: SizeConfig.safeBlockVertical * 60,
                          width: SizeConfig.safeBlockHorizontal * 60,
                          margin: EdgeInsets.only(
                            right: SizeConfig.safeBlockHorizontal * 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 15,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset:
                                    Offset(0, SizeConfig.safeBlockVertical * 3),
                                blurRadius: SizeConfig.safeBlockVertical * 6,
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Hello",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 14,
                              ),
                            ),
                            Text(
                              driver.username,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal * 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(icon: Icon(Icons.exit_to_app,
                          size: SizeConfig.safeBlockHorizontal * 30,
                          color: Colors.white,), onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return LoginBody();
                            }));
                          })
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 300,
                height: SizeConfig.safeBlockVertical * 36,
                margin: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 75,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: Offset(0, SizeConfig.safeBlockVertical * 2),
                      blurRadius: SizeConfig.safeBlockVertical * 3,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.safeBlockVertical * 13),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: SizeConfig.safeBlockHorizontal * 20,
                      color: Color(0xffB1B1B1),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 8,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: orderList != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 15),
                      child: ListContainer1(pendingList: orderList),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListContainer1 extends StatelessWidget {
  const ListContainer1({
    Key key,
    @required this.pendingList,
  }) : super(key: key);

  final List<Invoice> pendingList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 3,
      ),
      child: pendingList != null
          ? ListView.builder(
              itemCount: pendingList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DriverScan(invoice: pendingList[index],);
                    }));
                  },
                                  child: Container(
                    padding: EdgeInsets.only(
                      right: SizeConfig.safeBlockHorizontal * 5,
                      left: SizeConfig.safeBlockHorizontal * 7,
                      top: SizeConfig.safeBlockVertical * 5,
                      bottom: SizeConfig.safeBlockVertical * 5,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 120,
                    ),
                    width: SizeConfig.safeBlockHorizontal * 280,
                    height: SizeConfig.safeBlockVertical * 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockVertical * 12,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Sell_Name ',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '- ${pendingList[index].sellerName}',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 13,
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Sell_City ',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '- ${pendingList[index].sellerAddress}',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 13,
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Buy_Name ',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '- ${pendingList[index].buyerName}',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 13,
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Buyer_Address ',
                                  style: TextStyle(
                                    fontSize: SizeConfig.safeBlockHorizontal * 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '- ${pendingList[index].buyerAddress}',
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 13,
                                        color: Color(0xff707070),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 0.3,
                          height: double.maxFinite,
                          color: Color(0xff707070),
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                pendingList[index].quantity + "pcs",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 18,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical * 9,
                              ),
                              Text(
                                pendingList[index].product,
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
          : Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                SvgPicture.asset(
                  "assets/images/svg/no_invoice.svg",
                  height: SizeConfig.safeBlockVertical * 270,
                  width: SizeConfig.safeBlockHorizontal * 270,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Text(
                  "No Orders",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeHorizontal * 19),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Business/Invoice/invoice1.dart';
import 'package:smarttextile/Business/Invoice/scanner.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/services/api_orders.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/main_content/screens/wholesalers/w_home_page.dart';

class WholesalerOrderDtls extends StatefulWidget {
  final ProviderUser providerUser;

  const WholesalerOrderDtls({Key key, this.providerUser}) : super(key: key);
  @override
  _WholesalerOrderDtlsState createState() => _WholesalerOrderDtlsState();
}

class _WholesalerOrderDtlsState extends State<WholesalerOrderDtls> {
  List<Order> orderList = List();
  Future getorder() async {
    orderList = await ApiOrder().getAllUserOrder(widget.providerUser.uid);
    setState(() {});
  }

  List<Order> inprogressorderList = List();
  Future getinprogressorder() async {
    inprogressorderList =
        await ApiOrder().getAllUserInProgerssOrder(widget.providerUser.uid);
    setState(() {});
  }

  List<Order> completedorderList = List();
  Future getcompletedorder() async {
    completedorderList =
        await ApiOrder().getAllUserCompletedOrder(widget.providerUser.uid);
    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getorder();
    getinprogressorder();
    getcompletedorder();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(children: <Widget>[
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WHomePage(),));
                    },
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Orders",
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
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        child: TabBar(tabs: [
                          Tab(text: "Orders"),
                          Tab(text: "In-Progress"),
                          Tab(
                            text: "Completed",
                          )
                        ]),
                      ),
                      Expanded(
                          child: Container(
                              child: TabBarView(children: [
                        Inandcompletedcontainer(orderList: orderList),
                        Ordercontainer(orderList: inprogressorderList),
                        Inandcompletedcontainer(orderList: completedorderList),
                      ])))
                    ]),
                  )),
            )
          ],
        ),
        Radial()
      ]),
    ));
  }
}

class Ordercontainer extends StatelessWidget {
  const Ordercontainer({
    Key key,
    @required this.orderList,
  }) : super(key: key);

  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: orderList != null
          ? ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
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
                       borderRadius:
                          BorderRadius.circular(SizeConfig.safeBlockVertical*12),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, SizeConfig.safeBlockVertical*2.5),
                            blurRadius: SizeConfig.safeBlockVertical*5
                          ),]
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 12.0),
                          child: Container(
                              child: Center(
                                  child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () async {
                              Invoice invoice = await ApiService()
                                  .getInvoice(orderList[index].invoiceID);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) =>
                                          Scanner(invoiceid: invoice)));
                            },
                          ))),
                        ),
                        SizedBox(width: SizeConfig.blockSizeVertical * 10),
                        Container(
                          height: SizeConfig.blockSizeHorizontal * 50,
                          width: SizeConfig.blockSizeVertical * 1,
                          color: Colors.grey,
                        ),
                        SizedBox(width: SizeConfig.blockSizeVertical * 10),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    "Product : ${orderList[index].product}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Seller name : ${orderList[index].sellerName}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Quantity : ${orderList[index].quantity}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Price : ${orderList[index].price}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockSizeVertical * 10),
                        Container(
                          height: SizeConfig.blockSizeHorizontal * 50,
                          width: SizeConfig.blockSizeVertical * 1,
                          color: Colors.grey,
                        ),
                        SizedBox(width: SizeConfig.blockSizeVertical * 10),
                        IconButton(icon: Icon(Icons.airport_shuttle), onPressed: (){
                        })
                      ],
                    ),
                  ),
                );
              })
          : Column(
              children: <Widget>[
                Text(
                  "No Order Listed Here",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeHorizontal * 19),
                ),
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
              ],
            ),
    );
  }
}

class Inandcompletedcontainer extends StatelessWidget {
  const Inandcompletedcontainer({
    Key key,
    @required this.orderList,
  }) : super(key: key);

  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: orderList != null
          ? ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
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
                      color: Colors.white, borderRadius:
                          BorderRadius.circular(SizeConfig.safeBlockVertical*12),
                          boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(0.16),
                            offset: Offset(0, SizeConfig.safeBlockVertical*2.5),
                            blurRadius: SizeConfig.safeBlockVertical*5
                          ),]
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: SizeConfig.blockSizeHorizontal * 50,
                          width: SizeConfig.blockSizeVertical * 1,
                          color: Colors.grey,
                        ),
                        SizedBox(width: SizeConfig.blockSizeVertical * 10),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    "Product : ${orderList[index].product}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Seller name : ${orderList[index].sellerName}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Quantity : ${orderList[index].quantity}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeHorizontal * 5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Price : ${orderList[index].price}",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 15,
                                        fontFamily: "Segoe UI"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
          : Column(
              children: <Widget>[
                Text(
                  "No Order Listed Here",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeHorizontal * 19),
                ),
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
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/invoice1.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/Business/manage_product/services/api_service.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';

import 'package:flare_flutter/flare_actor.dart';

class OrderDtls extends StatefulWidget {
  final ProviderUser providerUser;

  const OrderDtls({Key key, this.providerUser}) : super(key: key);
  @override
  _OrderDtlsState createState() => _OrderDtlsState();
}

class _OrderDtlsState extends State<OrderDtls> {
  List<Order> orderList = List();
  bool _visibleError = false;
  bool _loadingVisible = false;
  Future getorder() async {
    orderList = await ApiService().getAllUserOrder(widget.providerUser.uid);
    setState(() {});
  }

  List<Order> inprogressorderList = List();
  Future getinprogressorder() async {
    inprogressorderList =
        await ApiService().getAllUserInProgerssOrder(widget.providerUser.uid);
    setState(() {});
  }

  List<Order> completedorderList = List();
  Future getcompletedorder() async {
    completedorderList =
        await ApiService().getAllUserCompletedOrder(widget.providerUser.uid);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingVisible = true;
    getorder();
    getinprogressorder();
    getcompletedorder();
    _loadingVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context)
;    return SafeArea(
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
                      Navigator.pop(context);
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:SizeConfig.safeBlockHorizontal*5),
                        child: Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: TabBar(tabs: [
                            Tab(text: "Orders"),
                            Tab(text: "In-Progress"),
                            Tab(
                              text: "Completed",
                            )
                          ]),
                        ),
                      ),
                      Expanded(
                          child: Container(
                              child: TabBarView(children: [
                        Ordercontainer(orderList: orderList),
                        Inandcompletedcontainer(orderList: inprogressorderList),
                        Inandcompletedcontainer(orderList: completedorderList),
                      ])))
                    ]),
                  )),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Invoice1(
                                  order: orderList[index],
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          SizeConfig.blockSizeHorizontal *
                              15.0,
                      vertical:
                          SizeConfig.safeBlockVertical * 7,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            SizeConfig.safeBlockVertical *
                                5,
                        horizontal:
                            SizeConfig.safeBlockHorizontal *
                                3,
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
                                left: SizeConfig
                                        .blockSizeVertical *
                                    12.0),
                            child: Container(
                                child: Center(
                                    child: Text(
                              "#$index",
                              style: TextStyle(
                                  fontSize: SizeConfig
                                          .blockSizeHorizontal *
                                      30,
                                  fontWeight:
                                      FontWeight.w400,
                                  fontFamily: "Segoe UI"),
                            ))),
                          ),
                          SizedBox(
                              width: SizeConfig
                                      .blockSizeVertical *
                                  10),
                          Container(
                            height: SizeConfig
                                    .blockSizeHorizontal *
                                50,
                            width: SizeConfig
                                    .blockSizeVertical *
                                1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                              width: SizeConfig
                                      .blockSizeVertical *
                                  10),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: <Widget>[
                                  FittedBox(
                                    child: Text(
                                      "Product : ${orderList[index].product}",
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                                  .blockSizeHorizontal *
                                              15,
                                          fontFamily:
                                              "Segoe UI"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig
                                            .blockSizeHorizontal *
                                        5,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Buyer name : ${orderList[index].buyerName}",
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                                  .blockSizeHorizontal *
                                              15,
                                          fontFamily:
                                              "Segoe UI"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig
                                            .blockSizeHorizontal *
                                        5,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Quantity : ${orderList[index].quantity}",
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                                  .blockSizeHorizontal *
                                              15,
                                          fontFamily:
                                              "Segoe UI"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig
                                            .blockSizeHorizontal *
                                        5,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Price : ${orderList[index].price}",
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                                  .blockSizeHorizontal *
                                              15,
                                          fontFamily:
                                              "Segoe UI"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      fontSize:
                          SizeConfig.blockSizeHorizontal *
                              19),
                ),
                SizedBox(
                  height:
                      SizeConfig.safeBlockHorizontal * 15,
                ),
                SvgPicture.asset(
                  "assets/images/svg/no_invoice.svg",
                  height:
                      SizeConfig.safeBlockVertical * 270,
                  width:
                      SizeConfig.safeBlockHorizontal * 270,
                ),
                SizedBox(
                  height:
                      SizeConfig.safeBlockHorizontal * 15,
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
                    horizontal:
                        SizeConfig.blockSizeHorizontal *
                            15.0,
                    vertical:
                        SizeConfig.safeBlockVertical * 7,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical:
                          SizeConfig.safeBlockVertical *
                              5,
                      horizontal:
                          SizeConfig.safeBlockHorizontal *
                              3,
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
,                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig
                                      .blockSizeVertical *
                                  12.0),
                          child: Container(
                              child: Center(
                                  child: Text(
                            "#$index",
                            style: TextStyle(
                                fontSize: SizeConfig
                                        .blockSizeHorizontal *
                                    30,
                                fontWeight:
                                    FontWeight.w400,
                                fontFamily: "Segoe UI"),
                          ))),
                        ),
                        SizedBox(
                            width: SizeConfig
                                    .blockSizeVertical *
                                10),
                        Container(
                          height: SizeConfig
                                  .blockSizeHorizontal *
                              50,
                          width: SizeConfig
                                  .blockSizeVertical *
                              1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                            width: SizeConfig
                                    .blockSizeVertical *
                                10),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    "Product : ${orderList[index].product}",
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                            15,
                                        fontFamily:
                                            "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig
                                          .blockSizeHorizontal *
                                      5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Buyer name : ${orderList[index].buyerName}",
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                            15,
                                        fontFamily:
                                            "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig
                                          .blockSizeHorizontal *
                                      5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Quantity : ${orderList[index].quantity}",
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                            15,
                                        fontFamily:
                                            "Segoe UI"),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig
                                          .blockSizeHorizontal *
                                      5,
                                ),
                                FittedBox(
                                  child: Text(
                                    "Price : ${orderList[index].price}",
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                                .blockSizeHorizontal *
                                            15,
                                        fontFamily:
                                            "Segoe UI"),
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
                      fontSize:
                          SizeConfig.blockSizeHorizontal *
                              19),
                ),
                SizedBox(
                  height:
                      SizeConfig.safeBlockHorizontal * 15,
                ),
                SvgPicture.asset(
                  "assets/images/svg/no_invoice.svg",
                  height:
                      SizeConfig.safeBlockVertical * 270,
                  width:
                      SizeConfig.safeBlockHorizontal * 270,
                ),
                SizedBox(
                  height:
                      SizeConfig.safeBlockHorizontal * 15,
                ),
              ],
            ),
    );
  }
}


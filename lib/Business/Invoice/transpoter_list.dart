import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/driver_details.dart';
import 'package:smarttextile/Business/Invoice/single_driver_list_container.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/services/supplier_services.dart';

import 'grey_header.dart';
import 'information.dart';
import 'invoice.dart';
import 'single_transporter_list_container.dart';
import 'size_config.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

import 'package:flare_flutter/flare_actor.dart';

class TransportDtls extends StatefulWidget {
  final Invoice invoice;
  final Order order;

  const TransportDtls({Key key, this.invoice, this.order}) : super(key: key);
  @override
  _TransportDtlsState createState() => _TransportDtlsState();
}

class _TransportDtlsState extends State<TransportDtls> {
  Invoice invoice;

  List<User> transpoterList = List();
   bool _visibleError = false;
  bool _loadingVisible = false;
  Future getTransList() async {
    transpoterList = await SupplierService().getTranspoterUser("Transporter");
    setState(() {});
  }

  List<Driver> driverList = List();
  Future getdriverList() async {
    driverList = await ApiService().getAllUserDriver(invoice.sellerId);
    setState(() {});
  }

  List deviceTokenTransporter = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadingVisible = true;
    invoice = widget.invoice;
    getTransList();
    getdriverList();
    _loadingVisible = false;
  }

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
                    name: "Transpoter List",
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints.expand(height: 50),
                          child: TabBar(tabs: [
                            Tab(text: "Transpoter"),
                            Tab(text: "Driver"),
                          ]),
                        ),
                        Expanded(
                          child: Container(
                            child: TabBarView(children: [
                              Container(
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: transpoterList != null
                                        ? ListView.builder(
                                            itemCount: transpoterList.length,
                                            itemBuilder: (context, index) {
                                              // return Text(invoiceList[index].buyerName);
                                              return GestureDetector(
                                                onTap: () {
                                                  invoice.transporterName =
                                                      transpoterList[index]
                                                          .companyName;
                                                  invoice.transporterId =
                                                      transpoterList[index].uid;
                                                  invoice.transporterGst =
                                                      transpoterList[index]
                                                          .gstNum;
                                                  invoice.transporterPhoneNo =
                                                      transpoterList[index]
                                                          .phoneNo;
                                                  deviceTokenTransporter.add(
                                                      transpoterList[index]
                                                          .deviceToken);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ConfirmDtls(
                                                                invoice:
                                                                    invoice,
                                                                order: widget
                                                                    .order,
                                                                deviceTokenTransporter:
                                                                    deviceTokenTransporter,
                                                              )));
                                                },
                                                child:
                                                    SingleTransporterListContainer(
                                                        companyName:
                                                            transpoterList[
                                                                    index]
                                                                .companyName,
                                                        city: transpoterList[
                                                                index]
                                                            .city,
                                                        ratings:
                                                            transpoterList[
                                                                    index]
                                                                .rating,
                                                        state: transpoterList[
                                                                index]
                                                            .state,
                                                        imageUrl:
                                                            transpoterList[
                                                                    index]
                                                                .logo),
                                              );
                                            })
                                        : Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: SizeConfig
                                                        .safeBlockHorizontal *
                                                    15,
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/svg/no_transpoter.svg",
                                                  height: SizeConfig
                                                          .safeBlockHorizontal *
                                                      200,
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      200),
                                              Text(
                                                "No Transpoter Available",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                        19),
                                              ),
                                            ],
                                          )),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        color: Color(0xff62B9BF),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DriverDtls()));
                                        },
                                        child: Text(
                                          "Add Driver",
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  15),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: driverList != null
                                              ? Container(
                                                  height: double.maxFinite,
                                                  width: double.maxFinite,
                                                  child: ListView.builder(
                                                      itemCount:
                                                          driverList.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        // return Text(invoiceList[index].buyerName);
                                                        return GestureDetector(
                                                          onTap: () {
                                                            invoice.transporterName =
                                                                driverList[
                                                                        index]
                                                                    .username;
                                                            invoice.transporterId =
                                                                driverList[
                                                                        index]
                                                                    .driverID;
                                                            invoice.transporterPhoneNo =
                                                                driverList[
                                                                        index]
                                                                    .phoneNo;
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ConfirmDtls(
                                                                              invoice: invoice,
                                                                              order: widget.order,
                                                                            )));
                                                          },
                                                          child:
                                                              SingleDriverListContainer(
                                                            name: driverList[
                                                                    index]
                                                                .name,
                                                            imageUrl: null,
                                                          ),
                                                        );
                                                      }),
                                                )
                                              : Column(
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .safeBlockHorizontal *
                                                          15,
                                                    ),
                                                    SvgPicture.asset(
                                                        "assets/images/svg/no_driver.svg",
                                                        height: SizeConfig
                                                                .safeBlockHorizontal *
                                                            200,
                                                        width: SizeConfig
                                                                .safeBlockHorizontal *
                                                            200),
                                                    Text(
                                                      "No Driver Available Add Some First",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily:
                                                              "Segoe UI",
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: SizeConfig
                                                                  .blockSizeHorizontal *
                                                              19),
                                                    ),
                                                  ],
                                                )),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        )
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

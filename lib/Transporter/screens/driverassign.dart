import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/invoice.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Transporter/screens/transporter_home_page.dart';
import 'package:smarttextile/Transporter/services/transporter_services.dart';
import 'package:smarttextile/shared/provider_user.dart';

class DriverAssign extends StatefulWidget {
  final String uid;
  final Invoice invoice;
  const DriverAssign({Key key, this.uid, this.invoice}) : super(key: key);
  @override
  _DriverAssignState createState() => _DriverAssignState();
}

class _DriverAssignState extends State<DriverAssign> {
  List<Driver> driverList = List();

  Future getdriverList() async {
    driverList = await TransporterService().getAllUserDriver(widget.uid);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdriverList();
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
                      "Drivers",
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
                  child: driverList != null
                      ? ListView.builder(
                        itemCount: driverList.length,
                          itemBuilder: (context, index) {
                            // return Text(invoiceList[index].buyerName);
                            return GestureDetector(
                              onTap: () async {
                                widget.invoice.driverID = driverList[index].driverID;
                                await TransporterService()
                                    .changePending(widget.invoice);
                                    
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TransporterHomePage()));
                              },
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 15.0,
                                    vertical: SizeConfig.safeBlockVertical * 7,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 10,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical:
                                          SizeConfig.safeBlockVertical * 4,
                                    ),
                                    height: SizeConfig.safeBlockVertical * 90,
                                    width: SizeConfig.safeBlockHorizontal * 260,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height:
                                              SizeConfig.safeBlockVertical * 70,
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  58,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/logo.png")),
                                            borderRadius: BorderRadius.circular(
                                              SizeConfig.safeBlockVertical * 8,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  8,
                                        ),
                                        Text(
                                          driverList[index].name,
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    15,
                                          ),
                                        ),
                                        Spacer(),
                                        IconButton(
                                            icon: Icon(
                                              Icons.call,
                                              size: SizeConfig
                                                      .safeBlockHorizontal *
                                                  25,
                                              color: Color(0xff1FC500),
                                            ),
                                            onPressed: null)
                                      ],
                                    ),
                                  )),
                            );
                          })
                      : Column(
                          children: <Widget>[
                            Text(
                              "No Driver Available ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 19),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal * 15,
                            ),
                            SvgPicture.asset(
                              "assets/images/svg/no_driver.svg",
                              height: SizeConfig.safeBlockVertical * 270,
                              width: SizeConfig.safeBlockHorizontal * 270,
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal * 15,
                            ),
                          ],
                        ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}

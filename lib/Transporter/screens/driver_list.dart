import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Transporter/services/transporter_services.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

class DriverList extends StatefulWidget {
  final ProviderUser providerUser;

  const DriverList({Key key, this.providerUser}) : super(key: key);
  @override
  _DriverListState createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  List<Driver> driverList = List();

  Future getdriverList() async {
    driverList =
        await TransporterService().getAllUserDriver(widget.providerUser.uid);
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
    return Container(
        padding: EdgeInsets.only(
          left: SizeConfig.safeBlockHorizontal * 30,
          right: SizeConfig.safeBlockHorizontal * 15,
          top: SizeConfig.safeBlockVertical * 50,
        ),
        height: SizeConfig.safeBlockVertical * 540,
        width: SizeConfig.safeBlockHorizontal * 310,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(SizeConfig.safeBlockHorizontal * 55,
                SizeConfig.safeBlockVertical * 70),
          ),
        ),
        child: driverList != null
            ? ListView.builder(
                itemCount: driverList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 10,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 4,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.safeBlockVertical * 70,
                          width: SizeConfig.safeBlockHorizontal * 58,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo.png")),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 8,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 8,
                        ),
                        Text(
                          driverList[index].name,
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 15,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            icon: Icon(
                              Icons.call,
                              size: SizeConfig.safeBlockHorizontal * 25,
                              color: Color(0xff1FC500),
                            ),
                            onPressed: null)
                      ],
                    ),
                  );
                },
              )
            : Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  SvgPicture.asset("assets/images/svg/no_driver.svg",
                      height: SizeConfig.safeBlockHorizontal * 200,
                      width: SizeConfig.safeBlockHorizontal * 200),
                  Text(
                    "No Driver Available Add Some First",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 19),
                  ),
                ],
              ));
  }
}

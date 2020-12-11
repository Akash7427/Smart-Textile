import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/driver_details.dart';
import 'package:smarttextile/Chat/screens/chat_home_screen.dart';
import 'package:smarttextile/Chat/screens/pageviews/chat_list_screen.dart';
import 'package:smarttextile/Transporter/screens/delivery_details.dart';
import 'package:smarttextile/Transporter/screens/driver_list.dart';
import 'package:smarttextile/Transporter/screens/transporter_driver.dart';
import 'package:smarttextile/Transporter/screens/transporter_profile_option.dart';
import 'package:smarttextile/Transporter/screens/transporter_notification.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';
import 'package:smarttextile/main_content/screens/shared/user_notification.dart';
import 'dart:math' as math;

import 'package:smarttextile/shared/provider_user.dart';

class TransporterHomePage extends StatefulWidget {
  @override
  _TransporterHomePageState createState() => _TransporterHomePageState();
}

class _TransporterHomePageState extends State<TransporterHomePage> {
  int _selected = 3;

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff62B9BF),
        body: Stack(
          children: <Widget>[
            Container(
              height: SizeConfig.safeBlockVertical * 540,
              width: SizeConfig.safeBlockHorizontal * 310,
              margin: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 100,
                left: SizeConfig.safeBlockHorizontal * 50,
              ),
              child: _selected == 3
                  ? DriverList(providerUser: providerUser,)
                  : DeliveryDetails(providerUser: providerUser,), //DriverList(),
            ),
            Container(
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
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TransporterProfileOption(
                          user: providerUser.user,
                        );
                      }));
                    },
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
                            offset: Offset(0, SizeConfig.safeBlockVertical * 3),
                            blurRadius: SizeConfig.safeBlockVertical * 6,
                          ),
                        ],
                        image: DecorationImage(
                          image: providerUser.logo!=null?NetworkImage(providerUser.logo):AssetImage("assets/images/logo.png"),
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
                          providerUser.companyName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TransporterDriverDtls();
                      }));
                    },
                    child: Icon(
                      Icons.person_add,
                      size: SizeConfig.safeBlockHorizontal * 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width:SizeConfig.safeBlockVertical*5),
                  GestureDetector(
                    onTap: () {
                      
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return UserNotification();
                }));
                    },
                    child: Icon(
                      Icons.notifications,
                      size: SizeConfig.safeBlockHorizontal * 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 200,
                    height: SizeConfig.safeBlockVertical * 36,
                    margin: EdgeInsets.only(
                      top: SizeConfig.safeBlockVertical * 84,
                      left: SizeConfig.safeBlockHorizontal * 110,
                      right: SizeConfig.safeBlockHorizontal * 15,
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
              ],
            ),
            // Container(
            //   width: SizeConfig.safeBlockHorizontal * 50,
            //   height: double.maxFinite,
            //   //color: Colors.red,
            //   margin: EdgeInsets.only(
            //     top: SizeConfig.safeBlockVertical * 170,
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[],
            //   ),
            // ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            top: _selected == 1
                                ? SizeConfig.safeBlockHorizontal * 12
                                : 0,
                          ),
                          width: SizeConfig.safeBlockVertical * 110,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatHomeScreen()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Chat",
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Visibility(
                                  visible: _selected == 1 ? true : false,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff62B9BF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.elliptical(
                                          SizeConfig.safeBlockVertical * 50,
                                          SizeConfig.safeBlockVertical * 30,
                                        ),
                                        bottomRight: Radius.elliptical(
                                          SizeConfig.safeBlockVertical * 50,
                                          SizeConfig.safeBlockVertical * 30,
                                        ),
                                      ),
                                    ),
                                    width: SizeConfig.safeBlockVertical * 70,
                                    child: Icon(
                                      Icons.blur_on,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: _selected == 2
                                ? SizeConfig.safeBlockHorizontal * 12
                                : 0,
                          ),
                          width: SizeConfig.safeBlockVertical * 156,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selected = 2;
                              });
                            },
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Delivery Detail",
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Visibility(
                                  visible: _selected == 2 ? true : false,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff62B9BF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.elliptical(
                                          SizeConfig.safeBlockVertical * 50,
                                          SizeConfig.safeBlockVertical * 30,
                                        ),
                                        bottomRight: Radius.elliptical(
                                          SizeConfig.safeBlockVertical * 50,
                                          SizeConfig.safeBlockVertical * 30,
                                        ),
                                      ),
                                    ),
                                    width: SizeConfig.safeBlockVertical * 70,
                                    child: Icon(
                                      Icons.blur_on,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: _selected == 3
                                ? SizeConfig.safeBlockHorizontal * 12
                                : 0,
                          ),
                          width: SizeConfig.safeBlockVertical * 156,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selected = 3;
                                });
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Drivers List",
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Visibility(
                                    visible: _selected == 3 ? true : false,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff62B9BF),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.elliptical(
                                            SizeConfig.safeBlockVertical * 70,
                                            SizeConfig.safeBlockVertical * 50,
                                          ),
                                          bottomRight: Radius.elliptical(
                                            SizeConfig.safeBlockVertical * 70,
                                            SizeConfig.safeBlockVertical * 50,
                                          ),
                                        ),
                                      ),
                                      width: SizeConfig.safeBlockVertical * 70,
                                      child: Icon(
                                        Icons.blur_on,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

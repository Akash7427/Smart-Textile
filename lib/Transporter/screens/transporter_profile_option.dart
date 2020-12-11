import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttextile/Transporter/screens/transporter_edit_profile.dart';
import 'package:smarttextile/Transporter/shared/size_config.dart';

import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main.dart';
import 'package:smarttextile/shared/log_out.dart';

class TransporterProfileOption extends StatelessWidget {
  final User user;
  TransporterProfileOption({this.user});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(1.5, 0.2),
              child: Image(
                image: AssetImage("assets/images/Plant.png"),
                height: SizeConfig.safeBlockVertical * 270,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment(1.9, 1.1),
              child: Image(
                image: AssetImage("assets/images/Corner_Plants.png"),
                height: SizeConfig.safeBlockVertical * 180,
                width: SizeConfig.safeBlockHorizontal * 240,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 10,
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 20,
                          fontFamily: "Segoe UI"),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 130,
                        height: SizeConfig.safeBlockHorizontal * 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff707070).withOpacity(0.4),
                              blurRadius: SizeConfig.safeBlockHorizontal * 5,
                              offset: Offset(2, 5),
                            ),
                          ],
                          image: DecorationImage(
                              image: user.logo == null
                                  ? AssetImage("assets/images/logo.png")
                                  : NetworkImage(user.logo),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10.0, top: 7),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TransporterEditProfile(user: user);
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                  fontFamily: "Segoe UI",
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 11),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 45,
                            vertical: SizeConfig.safeBlockVertical * 10,
                          ),
                          height: SizeConfig.safeBlockVertical * 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 25,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(
                                    0, SizeConfig.safeBlockVertical * 2.5),
                                blurRadius: SizeConfig.safeBlockVertical * 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 17,
                                fontFamily: "Segoe UI L",
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 45,
                            vertical: SizeConfig.safeBlockVertical * 10,
                          ),
                          height: SizeConfig.safeBlockVertical * 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 25,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(
                                    0, SizeConfig.safeBlockVertical * 2.5),
                                blurRadius: SizeConfig.safeBlockVertical * 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Contact Us",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 17,
                                fontFamily: "Segoe UI L",
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          LogOut().userLogOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return MyApp();
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 45,
                            vertical: SizeConfig.safeBlockVertical * 10,
                          ),
                          height: SizeConfig.safeBlockVertical * 40,
                          decoration: BoxDecoration(
                            color: Color(0xffFF6363),
                            borderRadius: BorderRadius.circular(
                              SizeConfig.safeBlockVertical * 25,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: Offset(
                                    0, SizeConfig.safeBlockVertical * 2.5),
                                blurRadius: SizeConfig.safeBlockVertical * 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 17,
                                fontFamily: "Segoe UI L",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

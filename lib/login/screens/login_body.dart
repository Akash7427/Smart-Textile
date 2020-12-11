import 'package:animate_do/animate_do.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Driver/driver_homepage.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/login/screens/otp.dart';
import 'package:smarttextile/login/screens/register_option.dart';
import 'package:smarttextile/login/services/api_driver.dart';
import 'package:smarttextile/login/services/api_service.dart';
import 'package:smarttextile/login/services/auth.dart';
import 'package:smarttextile/login/services/cloud_messaging.dart';
import 'package:smarttextile/login/services/hive_service.dart';
import 'package:smarttextile/login/shared/constants.dart';
import 'package:smarttextile/main.dart';
import 'package:smarttextile/shared/check_user.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  var _username = TextEditingController();

  int _userSelected = 1;

  bool visiblePassword = false;
  bool _visibleError = false;
  bool _loadingVisible = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            FadeInLeft(
              child: Align(
                alignment: Alignment(-1.1, -1.1),
                child: SvgPicture.asset(
                  "assets/images/svg/top_leaves.svg",
                  width: SizeConfig.safeBlockHorizontal * 130,
                  height: SizeConfig.safeBlockVertical * 120,
                ),
              ),
            ),
            FadeInRight(
              child: Align(
                alignment: Alignment(1.7, -1.1),
                child: SvgPicture.asset(
                  "assets/images/svg/login_leaves.svg",
                  width: SizeConfig.safeBlockHorizontal * 220,
                  height: SizeConfig.safeBlockVertical * 180,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 90,
                    width: double.maxFinite,
                  ),
                  SlideInLeft(
                    child: SvgPicture.asset(
                      "assets/images/svg/Human.svg",
                      height: SizeConfig.safeBlockVertical * 100,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  SlideInRight(
                    child: Text(
                      "SET YOUR OWN BUSINESS",
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: SizeConfig.safeBlockVertical * 20,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _userSelected = 1;
                          });
                        },
                        child: Text(
                          "User's Login",
                          style: TextStyle(
                            color: _userSelected == 1
                                ? Color(0xff008895)
                                : Color(0xffAEAEAE),
                            fontFamily: "Segoe UI",
                            fontSize: SizeConfig.safeBlockHorizontal * 17,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 7,
                        ),
                        height: 25,
                        width: 0.3,
                        color: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _userSelected = 2;
                          });
                        },
                        child: Text(
                          "Driver's Login",
                          style: TextStyle(
                            color: _userSelected == 2
                                ? Color(0xff008895)
                                : Color(0xffAEAEAE),
                            fontFamily: "Segoe UI",
                            fontSize: SizeConfig.safeBlockHorizontal * 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: SlideInUp(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12),
                            child: TextFormField(
                                validator: (val) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(val))
                                    return 'Enter Valid Email';
                                  else
                                    return null;
                                },
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: kTextField.copyWith(
                                  hintText: "Email",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.safeBlockHorizontal *
                                            20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.mail_outline,
                                          size: SizeConfig.safeBlockHorizontal *
                                              28,
                                          color: Color(0xff828282),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              SizeConfig.safeBlockHorizontal *
                                                  4.5),
                                          child: SizedBox(
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    1.2,
                                            height:
                                                SizeConfig.safeBlockHorizontal *
                                                    32,
                                            child: Container(
                                              color: Color(0xff828282),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          _userSelected == 2
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 20,
                                    right: SizeConfig.safeBlockHorizontal * 20,
                                    top: SizeConfig.safeBlockVertical * 5,
                                    bottom: SizeConfig.safeBlockVertical * 12,
                                  ),
                                  child: TextFormField(
                                      validator: (val) {
                                        if (val.length == 0)
                                          return 'Enter UserName';
                                        else
                                          return null;
                                      },
                                      controller: _username,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: kTextField.copyWith(
                                        hintText: "Username",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              left: SizeConfig
                                                      .safeBlockHorizontal *
                                                  20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Icon(
                                                Icons.person_outline,
                                                size: SizeConfig
                                                        .safeBlockHorizontal *
                                                    28,
                                                color: Color(0xff828282),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(SizeConfig
                                                        .safeBlockHorizontal *
                                                    4.5),
                                                child: SizedBox(
                                                  width: SizeConfig
                                                          .safeBlockHorizontal *
                                                      1.2,
                                                  height: SizeConfig
                                                          .safeBlockHorizontal *
                                                      32,
                                                  child: Container(
                                                    color: Color(0xff828282),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                )
                              : SizedBox(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: TextFormField(
                                validator: (val) {
                                  return val.length < 6
                                      ? "Password length must be greater than 6"
                                      : null;
                                },
                                controller: _password,
                                obscureText:
                                    visiblePassword == true ? false : true,
                                decoration: kTextField.copyWith(
                                  hintText: "Password",
                                  suffixIcon: visiblePassword == false
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              visiblePassword = true;
                                            });
                                          },
                                          child: Icon(Icons.visibility))
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              visiblePassword = false;
                                            });
                                          },
                                          child: Icon(Icons.visibility_off)),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.safeBlockHorizontal *
                                            20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.lock_outline,
                                          size: SizeConfig.safeBlockHorizontal *
                                              28,
                                          color: Color(0xff828282),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                              SizeConfig.safeBlockHorizontal *
                                                  4.5),
                                          child: SizedBox(
                                            width: 1.5,
                                            height:
                                                SizeConfig.safeBlockHorizontal *
                                                    32,
                                            child: Container(
                                              color: Color(0xff828282),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              //TODo
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Otp();
                              }));
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: SizeConfig.safeBlockHorizontal * 20,
                                  bottom: SizeConfig.safeBlockVertical * 10,
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    color: Color(0xff00747A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: FlatButton(
                                    color: Color(0xff00B6C7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onPressed: () async {
                                      if (_userSelected == 1) {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _loadingVisible = true;
                                          });
                                          var uid = await Authemtication()
                                              .loginWithEmailandPassword(
                                                  _email.text, _password.text);

                                          if (uid != null) {
                                            String device_token =
                                                await CloudMessaging()
                                                    .getToken();
                                            await ApiService()
                                                .updateDeviceToken(
                                                    device_token, uid);
                                            User user =
                                                await ApiService().getUser(uid);

                                            HiveService().setHiveUser(user);

                                            setState(() {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                return MyApp();
                                              }));
                                              _loadingVisible = false;
                                            });
                                          } else {
                                            _loadingVisible = false;
                                            _visibleError = true;
                                            setState(() {});
                                          }
                                        }
                                      } else {
                                        setState(() {
                                          _loadingVisible = true;
                                        });
                                        Driver driver = await ApiDriver()
                                            .checkDriver(_email.text,
                                                _username.text, _password.text);
                                        HiveService().setHiveDriver(driver);
                                        if (driver != null) {
                                          setState(() {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                              return MyApp();
                                            }));
                                          });
                                          _loadingVisible = false;
                                        } else {
                                          _loadingVisible = false;
                                          _visibleError = true;
                                          setState(() {});
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.safeBlockVertical * 8),
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    20),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _userSelected == 2
                        ? SizeConfig.safeBlockVertical * 105
                        : SizeConfig.safeBlockVertical * 165,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Not a Member? ",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 18,
                          fontFamily: "Segoe UI L",
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return RegisterOption();
                          }));
                        },
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 19,
                            fontFamily: "Segoe UI",
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _visibleError,
              child: GestureDetector(
                onTap: () {
                  _visibleError = false;
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 20),
                  height: SizeConfig.safeBlockVertical * 70,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff111111).withOpacity(0.5),
                      Color(0xff545454).withOpacity(0.5),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            "We don't recognize this e-mail or password.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.safeBlockHorizontal * 15),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "Double-check your information and try again",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.safeBlockHorizontal * 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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

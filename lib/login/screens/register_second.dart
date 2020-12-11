import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/login/screens/login_body.dart';
import 'package:smarttextile/login/services/api_service.dart';
import 'package:smarttextile/login/services/auth.dart';
import 'package:smarttextile/login/services/cloud_messaging.dart';
import 'package:smarttextile/login/services/hive_service.dart';
import 'package:smarttextile/login/shared/constants.dart';
import 'package:smarttextile/main.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';

import 'package:flare_flutter/flare_actor.dart';

class RegisterSecond extends StatefulWidget {
  final User user;
  RegisterSecond({this.user});
  @override
  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  List<String> _filterCategory = [];
  List<String> categories = [
    "Saree",
    "Kurti",
    "Dress",
    "Fabrics",
    "Ethnic Wear",
    "Apparel and Garments"
  ];

  String categoryError = "";
  bool _visibleError = false;
  bool _loadingVisible = false;
  var _phone = TextEditingController();
  var _email = TextEditingController();
  var _website = TextEditingController();
  var _password = TextEditingController();
  var _cPassword = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(1.2, 1.05),
              child: SvgPicture.asset(
                "assets/images/svg/register_leaves.svg",
                width: SizeConfig.safeBlockHorizontal * 200,
                height: SizeConfig.safeBlockVertical * 200,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 10,
                    ),
                    FittedBox(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                          FittedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical * 10,
                                horizontal: SizeConfig.safeBlockHorizontal * 15,
                              ),
                              child: Text(
                                "Register your Details",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 8,
                      ),
                      child: TextFormField(
                        controller: _phone,
                        validator: (value) {
                          Pattern pattern = r'^[+]*[0-9 ]*[789]\d{9}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value.trim())) {
                            return "Enter a Valid Phone number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: kTextField.copyWith(
                          hintText: "PH-NUMBER",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              Icons.call,
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 8,
                      ),
                      child: TextFormField(
                        controller: _email,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value.trim()))
                            return 'Enter Valid Email';
                          else
                            return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: kTextField.copyWith(
                          hintText: "EMAIL",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              Icons.mail_outline,
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 8,
                      ),
                      child: TextFormField(
                        controller: _website,
                        keyboardType: TextInputType.url,
                        decoration: kTextField.copyWith(
                          hintText: "WEBSITE",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              Icons.public,
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 8,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _password,
                        validator: (value) {
                          return value.length < 6
                              ? "Password Length must be graeter than 6"
                              : null;
                        },
                        decoration: kTextField.copyWith(
                          hintText: "PASSWORD",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              Icons.lock_outline,
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 20,
                        vertical: SizeConfig.safeBlockVertical * 8,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: _cPassword,
                        validator: (value) {
                          return value != _password.text
                              ? "Both Password are not same"
                              : null;
                        },
                        decoration: kTextField.copyWith(
                          hintText: "CONFIRM-PASSWORD",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Icon(
                              Icons.lock,
                              color: Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Select Cataegory",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 17,
                          fontFamily: "Segoe UI",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory.contains("Saree"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Saree");
                                } else {
                                  _filterCategory.remove("Saree");
                                }
                                setState(() {});
                              },
                              title: Text(
                                "Saree",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 20),
                              ),
                              activeColor: Color(0xff00B6C7),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory.contains("Kurti"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Kurti");
                                } else {
                                  _filterCategory.remove("Kurti");
                                }
                                setState(() {});
                              },
                              activeColor: Color(0xff00B6C7),
                              title: Text(
                                "Kurti",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 20),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory.contains("Fabrics"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Fabrics");
                                } else {
                                  _filterCategory.remove("Fabrics");
                                }
                                setState(() {});
                              },
                              title: Text(
                                "Fabrics",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 20),
                              ),
                              activeColor: Color(0xff00B6C7),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory.contains("Dress"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Dress");
                                } else {
                                  _filterCategory.remove("Dress");
                                }
                                setState(() {});
                              },
                              activeColor: Color(0xff00B6C7),
                              title: Text(
                                "Dress",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 20),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory.contains("Ethnic Wear"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Ethnic Wear");
                                } else {
                                  _filterCategory.remove("Ethnic Wear");
                                }
                                setState(() {});
                              },
                              title: Text(
                                "Ethnic Wear",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 16),
                              ),
                              activeColor: Color(0xff00B6C7),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _filterCategory
                                  .contains("Apparel and Garments"),
                              onChanged: (bool selected) {
                                if (selected) {
                                  _filterCategory.add("Apparel and Garments");
                                } else {
                                  _filterCategory
                                      .remove("Apparel and Garments");
                                }
                                setState(() {});
                              },
                              activeColor: Color(0xff00B6C7),
                              title: Text(
                                "Apparel & Garments",
                                style: TextStyle(
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      categoryError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: SizeConfig.safeBlockHorizontal * 12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 50,
                              right: 50,
                              top: SizeConfig.safeBlockVertical * 8,
                            ),
                            child: FlatButton(
                              color: Color(0xff00B6C7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  if (_filterCategory.length == 0) {
                                    categoryError = "Select atlest 1 category";
                                    setState(() {});
                                  } else {
                                    setState(() {
                                      _loadingVisible = true;
                                    });
                                    widget.user.categories = _filterCategory;

                                    widget.user.phoneNo = _phone.text
                                        .substring(_phone.text.length - 10);
                                    widget.user.email =
                                        _email.text.trim().toLowerCase();
                                    widget.user.description =
                                        "We are ${widget.user.companyName.trim()} from ${widget.user.city}, ${widget.user.state} supplier of ${widget.user.categories.join(", ")} established since ${widget.user.establishmentYear}";
                                    var uid = await Authemtication()
                                        .registerWithEmailandPassword(
                                            _email.text, _password.text);
                                    if (uid != null) {
                                      widget.user.uid = uid;
                                      String device_token =
                                          await CloudMessaging().getToken();
                                      widget.user.deviceToken = device_token;

                                      await ApiService()
                                          .postUser(widget.user, uid);

                                      HiveService().setHiveUser(widget.user);
                                      // ProviderUser.namedConst();
                                      setState(() {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return MyApp();
                                        }));
                                        _loadingVisible = false;
                                      });
                                    } else {
                                      _visibleError = true;
                                      _loadingVisible = false;

                                      setState(() {});
                                    }
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.safeBlockVertical * 8),
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 20),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 10),
                      child: RegisterBottomLine(),
                    ),
                  ],
                ),
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
                    child: Text(
                      "Something Went wrong, please try again later",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.safeBlockHorizontal * 15),
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

class RegisterBottomLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "You are a Member?  ",
          style: TextStyle(
              color: Color(0xff707070),
              fontSize: SizeConfig.safeBlockHorizontal * 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return LoginBody();
              },
            ));
          },
          child: Text(
            "SIGNIN",
            style: TextStyle(
                color: Color(0xff000000),
                fontSize: SizeConfig.safeBlockHorizontal * 19),
          ),
        )
      ],
    );
  }
}

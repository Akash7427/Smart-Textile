import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/login/models/pincode.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/login/screens/login_body.dart';
import 'package:smarttextile/login/screens/register_second.dart';
import 'package:smarttextile/login/screens/transporter_register_second.dart';
import 'package:smarttextile/login/services/api_service.dart';
import 'package:smarttextile/login/shared/constants.dart';

import 'package:smarttextile/shared/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterFirst extends StatefulWidget {
  final User user;
  RegisterFirst({this.user});
  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  var _name = TextEditingController();
  var _companyName = TextEditingController();
  var _address = TextEditingController();
  var _city = TextEditingController();
  var _state = TextEditingController();
  var _pincode = TextEditingController();
  var _country = TextEditingController();
  var _gst = TextEditingController();
  var _establishmentYear = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Pincode pincodeData;
  bool _visible = false, _loadingVisible = false;

  @override
  void initState() {
    super.initState();
    print(widget.user.type);
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 10,
                        horizontal: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      child: Text(
                        "Register your Details",
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 40),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 20,
                      vertical: SizeConfig.safeBlockVertical * 8,
                    ),
                    child: TextFormField(
                      controller: _name,
                      validator: (value) {
                        return value.trim().length == 0
                            ? "Enter Your Name"
                            : null;
                      },
                      textCapitalization: TextCapitalization.words,
                      decoration: kTextField.copyWith(
                        hintText: "NAME",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.accessibility,
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
                      controller: _companyName,
                      validator: (value) {
                        return value.trim().length == 0
                            ? "Enter Your Company Name"
                            : null;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration: kTextField.copyWith(
                        hintText: "COMPANY NAME",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.account_balance,
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
                      controller: _address,
                      validator: (value) {
                        return value.trim().length == 0
                            ? "Enter Your Company Address"
                            : null;
                      },
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 5,
                      decoration: kTextField.copyWith(
                        hintText: "ADDRESS",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 78),
                            child: Icon(
                              Icons.home,
                              color: Color(0xff828282),
                            ),
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
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: _pincode,
                            validator: (value) {
                              return value.trim().length != 6
                                  ? "Enter Valid Pincode"
                                  : null;
                            },
                            onChanged: (value) async {
                              if (value.length == 6) {
                                pincodeData = await ApiService()
                                    .pincode(value.trim().toString());
                                if (pincodeData != null) {
                                  _city.text =
                                      pincodeData.data[0].district.toString();
                                  _state.text =
                                      pincodeData.data[0].stateName.toString();
                                  _country.text = "India";
                                }
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: kTextField.copyWith(
                              hintText: "PINCODE",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.radio_button_checked,
                                  color: Color(0xff828282),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _country,
                            validator: (value) {
                              return value.trim().length == 0
                                  ? "Enter Your Country Name"
                                  : null;
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: kTextField.copyWith(
                              hintText: "Country",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: Color(0xff828282),
                                ),
                              ),
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
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: _city,
                            validator: (value) {
                              if (pincodeData != null) {
                                return value.trim() !=
                                        pincodeData.data[0].district
                                    ? "Pincode & city do not match"
                                    : null;
                              } else {
                                return value.trim().length == 0
                                    ? "Enter your city name"
                                    : null;
                              }
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: kTextField.copyWith(
                              hintText: "CITY",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.location_city,
                                  color: Color(0xff828282),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _state,
                            validator: (value) {
                              if (pincodeData != null) {
                                return value.trim() !=
                                        pincodeData.data[0].stateName
                                    ? "Pincode & state do not match"
                                    : null;
                              } else {
                                return value.trim().length == 0
                                    ? "Enter your State name"
                                    : null;
                              }
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: kTextField.copyWith(
                              hintText: "State",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.location_searching,
                                  color: Color(0xff828282),
                                ),
                              ),
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
                      controller: _gst,
                      validator: (value) {
                        Pattern pattern =
                            r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(value.toUpperCase())) {
                          return "Enter a Valid GST number";
                        } else {
                          return null;
                        }
                      },
                      textCapitalization: TextCapitalization.characters,
                      decoration: kTextField.copyWith(
                        hintText: "GST-NUMBER",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.vpn_key,
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
                      controller: _establishmentYear,
                      validator: (value) {
                        return value.trim().length != 4
                            ? "Enter Valid Establishment Year"
                            : null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: kTextField.copyWith(
                        hintText: "ESTABLISHMENT-YEAR",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Icon(
                            Icons.access_time,
                            color: Color(0xff828282),
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
                                setState(() {
                                  _loadingVisible = true;
                                });
                                widget.user.name = _name.text.trim();
                                widget.user.companyName =
                                    _companyName.text.trim();
                                widget.user.address = _address.text.trim();
                                widget.user.pincode = _pincode.text.trim();
                                widget.user.city = _city.text.trim();
                                widget.user.state = _state.text.trim();
                                widget.user.gstNum =
                                    _gst.text.trim().toUpperCase();
                                widget.user.establishmentYear =
                                    _establishmentYear.text;

                                bool check = await ApiService()
                                    .checkGST(widget.user.gstNum);
                                print(check);
                                if (check) {
                                  setState(() {
                                    widget.user.type != "Transporter"
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                            return RegisterSecond(
                                              user: widget.user,
                                            );
                                          }))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                            return TransporterRegisterSecond(
                                              user: widget.user,
                                            );
                                          }));
                                  });
                                } else {
                                  setState(() {
                                    _visible = true;
                                    _loadingVisible = false;
                                  });
                                }
                              }
                              setState(() {
                                _loadingVisible = false;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 8),
                              child: Text(
                                "NEXT",
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
            visible: _visible,
            child: GestureDetector(
              onTap: () {
                _visible = false;
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
                    "This GST number is already registered",
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
      )),
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

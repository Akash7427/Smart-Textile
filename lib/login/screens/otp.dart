import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttextile/shared/size_config.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  List _otp = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            SvgPicture.asset(
              "assets/images/svg/otp.svg",
              height: SizeConfig.safeBlockVertical * 90,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 20),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "Enter 6 Digit code sent to you at ",
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockVertical * 25,
                          color: Colors.black,
                          fontFamily: "Segoe UI L"),
                      children: [
                        TextSpan(
                          text: "+91 99######89",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockVertical * 28,
                              color: Color(0xff00747A),
                              fontFamily: "Segoe UI L"),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            FittedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 10,
                    vertical: SizeConfig.safeBlockVertical * 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    OtpContainer(
                      text: _otp.length <= 0 ? "" : _otp[0],
                    ),
                    OtpContainer(
                      text: _otp.length <= 1 ? "" : _otp[1],
                    ),
                    OtpContainer(
                      text: _otp.length <= 2 ? "" : _otp[2],
                    ),
                    OtpContainer(
                      text: _otp.length <= 3 ? "" : _otp[3],
                    ),
                    OtpContainer(
                      text: _otp.length <= 4 ? "" : _otp[4],
                    ),
                    OtpContainer(
                      text: _otp.length <= 5 ? "" : _otp[5],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Resend code",
              style: TextStyle(
                  color: Color(0xffFE8D6F),
                  fontSize: SizeConfig.safeBlockVertical * 15),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: SizeConfig.safeBlockVertical * 320,
                  decoration: BoxDecoration(
                    color: Color(0xff00B6C7),
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(SizeConfig.safeBlockVertical * 80),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 40,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if (_otp.length == 6) {
                                var otpVerify = _otp[0].toString() +
                                    _otp[1].toString() +
                                    _otp[2].toString() +
                                    _otp[3].toString() +
                                    _otp[4].toString() +
                                    _otp[5].toString();
                                print(otpVerify);
                              }
                            },
                            child: Text(
                              "VERIFY",
                              style: GoogleFonts.montserrat(
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 50,
                          right: SizeConfig.safeBlockHorizontal * 40,
                        ),
                        width: double.maxFinite,
                        height: SizeConfig.safeBlockVertical * 280,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                SizeConfig.safeBlockVertical * 80),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OtpButton(
                                  text: "1",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("1");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "2",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("2");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "3",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("3");
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OtpButton(
                                  text: "4",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("4");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "5",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("5");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "6",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("6");
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OtpButton(
                                  text: "7",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("7");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "8",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("8");
                                        },
                                      );
                                    }
                                  },
                                ),
                                OtpButton(
                                  text: "9",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("9");
                                        },
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                OtpButton(
                                  text: "",
                                  onTap: () {},
                                ),
                                OtpButton(
                                  text: "0",
                                  onTap: () {
                                    if (_otp.length <= 5) {
                                      setState(
                                        () {
                                          _otp.add("0");
                                        },
                                      );
                                    }
                                  },
                                ),
                                FlatButton(
                                    onPressed: () {
                                      if (_otp.length >= 0) {
                                        setState(() {
                                          _otp.removeLast();
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.backspace,
                                      color: Color(0xff352641),
                                    ))
                              ],
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical * 3,
                              width: SizeConfig.safeBlockHorizontal * 150,
                              color: Color(0xff707070).withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OtpButton extends StatelessWidget {
  final Function onTap;
  final text;
  OtpButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: SizeConfig.safeBlockHorizontal * 25,
          color: Color(0xff352641),
        ),
      ),
    );
  }
}

class OtpContainer extends StatelessWidget {
  final text;
  OtpContainer({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 3),
      child: CircleAvatar(
        backgroundColor: Color(0xffa0dde0).withOpacity(0.5),
        radius: SizeConfig.safeBlockVertical * 25,
        child: Text(
          text,
          style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 22,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/shared/size_config.dart';
import 'package:smarttextile/login/screens/login_body.dart';
import 'package:smarttextile/login/screens/registerfirst.dart';

class RegisterOption extends StatelessWidget {
  User user = User();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(SizeConfig.safeBlockHorizontal * 1.65,
                  -SizeConfig.safeBlockVertical * 0.59),
              child: Transform.rotate(
                angle: pi / 5,
                child: SvgPicture.asset(
                  "assets/images/svg/login_leaves.svg",
                  width: SizeConfig.safeBlockHorizontal * 220,
                  height: SizeConfig.safeBlockVertical * 180,
                ),
              ),
            ),
            Align(
              alignment: Alignment(-1.1, 1.1),
              child: SvgPicture.asset(
                "assets/images/svg/bottom_leaves.svg",
                width: SizeConfig.safeBlockHorizontal * 220,
                height: SizeConfig.safeBlockVertical * 230,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 25,
                  width: double.maxFinite,
                ),
                Text(
                  "Who are you?",
                  style:
                      TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 30),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: SizeConfig.safeBlockVertical * 50,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                    RegisteroptionContainer(
                      iconData: Icons.face,
                      color: Color(0xff97008D),
                      name: "Producer",
                      onTap: () {
                        user.type = "Producer";

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return RegisterFirst(
                              user: user,
                            );
                          },
                        ));
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                    RegisteroptionContainer(
                      iconData: Icons.shopping_cart,
                      color: Color(0xffFF7575),
                      name: "Wholesaler",
                      onTap: () {
                        user.type = "Wholesaler";

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return RegisterFirst(
                              user: user,
                            );
                          },
                        ));
                      },
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: SizeConfig.safeBlockVertical * 50,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                    RegisteroptionContainer(
                      iconData: Icons.record_voice_over,
                      color: Color(0xff0086EC),
                      name: "Retailer",
                      onTap: () {
                        user.type = "Retailer";

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return RegisterFirst(
                              user: user,
                            );
                          },
                        ));
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                    RegisteroptionContainer(
                      iconData: Icons.local_shipping,
                      color: Color(0xff2DB704),
                      name: "Transporter",
                      onTap: () {
                        user.type = "Transporter";

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return RegisterFirst(
                              user: user,
                            );
                          },
                        ));
                      },
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: SizeConfig.safeBlockVertical * 50,
                  ),
                ),
                RegisterBottomLine(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 20,
                ),
              ],
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

class RegisteroptionContainer extends StatelessWidget {
  final name;
  final iconData;
  final color;
  final Function onTap;
  RegisteroptionContainer({this.color, this.name, this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius:
                  BorderRadius.circular(SizeConfig.safeBlockHorizontal * 35),
            ),
            child: Icon(
              iconData,
              size: SizeConfig.safeBlockHorizontal * 100,
              color: color,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 4,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: SizeConfig.blockSizeHorizontal * 18,
          ),
        ),
      ],
    );
  }
}

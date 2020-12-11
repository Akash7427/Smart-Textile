import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/screens/chat_home_screen.dart';
import 'package:smarttextile/main_content/provider/circle_provider.dart';
import 'package:smarttextile/main_content/provider/set_screen.dart';
import 'package:smarttextile/main_content/screens/shared/global_markets.dart';
import 'package:smarttextile/main_content/screens/shared/requirements/requirements.dart';
import 'package:smarttextile/shared/check_user.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:smarttextile/catalogue/screens/catalogue_home.dart';
import 'package:smarttextile/Business/Main/Dashboard.dart';
import 'package:smarttextile/main_content/screens/shared/favourite/favourite.dart';

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: RadialAnimationTesting(controller: controller));
  }
}

class RadialAnimationTesting extends StatelessWidget {
  RadialAnimationTesting({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        translation = Tween<double>(begin: 0.0, end: 100).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.1,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;
  SetScreen setScreen;
  CircleProvider circleProvider;

  @override
  Widget build(BuildContext context) {
    circleProvider = Provider.of<CircleProvider>(context);
    setScreen = Provider.of<SetScreen>(context);
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildButton(
                30,
                color: Color(0xffFEF09C),
                text: "Home",
                heroTag: "1",
                onTap: () {
                  setScreen.changeScreen(2);
                  circleProvider.setSize(80);
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return CheckUser();
                  }));
                },
              ),
              _buildButton(
                90,
                color: Color(0xffB9DCFF),
                text: "Requirements",
                heroTag: "2",
                onTap: () {
                  circleProvider.setSize(80);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return Requirements();
                  }), (route) => false);
                },
              ),
              _buildButton(
                150,
                color: Color(0xffD7AFFF),
                text: "Chat",
                heroTag: "3",
                onTap: () {
                  circleProvider.setSize(80);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return ChatHomeScreen();
                  }), (route) => false);
                },
              ),
              _buildButton(210,
                  color: Color(0xffFFCB7E),
                  text: "Favorites",
                  heroTag: "4", onTap: () {
                circleProvider.setSize(80);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Favourite();
                }), (route) => false);
              }),
              _buildButton(
                270,
                color: Color(0xffCEFF95),
                text: "Business",
                heroTag: "1",
                onTap: () {
                  circleProvider.setSize(80);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return ManageBusinessDashboard();
                  }), (route) => false);
                },
              ),
              _buildButton(
                330,
                color: Color(0xffFBBEFF),
                text: "Catalogue",
                heroTag: "1",
                onTap: () {
                  circleProvider.setSize(80);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return CatalogueHome(providerUser:ProviderUser());
                  }), (route) => false);
                },
              ),
              Transform.scale(
                scale: scale.value - 1.5,
                child: FloatingActionButton(
                  elevation: 0.0,
                  disabledElevation: 0.0,
                  focusElevation: 0.0,
                  highlightElevation: 0.0,
                  heroTag: "d",
                  onPressed: _close,
                  child: Text(
                    "X",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Color(0xffFF6B6B),
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: GestureDetector(
                  onTap: _open,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Color(0xff707070),
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Color(0xffFFF491).withOpacity(0.8),
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Color(0xffFFF8BE),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  _buildButton(double angle,
      {Color color, String text, String heroTag, Function onTap}) {
    final double rad = radians(angle);

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0, 2),
                blurRadius: 0.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: "Segoe UI L"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _open() {
    circleProvider.setSize(280);
    controller.forward();
  }

  _close() {
    circleProvider.setSize(80);

    controller.reverse();
  }
}

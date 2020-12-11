import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main.dart';
import 'package:smarttextile/main_content/components/top_bar.dart';
import 'package:smarttextile/main_content/screens/shared/edit_profile.dart';
import 'package:smarttextile/main_content/screens/shared/user_notification.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/log_out.dart';
import 'package:smarttextile/shared/provider_user.dart';

class ProducerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.safeBlockVertical * 570,
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: FittedBox(
                    child: Text(
                      "SMART TEXTILE",
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 25,
                        color: Color(0xff011427),
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                        fontFamily: "Palatino Linotype",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
            ),
          ),
          child: Container(
            height: SizeConfig.safeBlockVertical * 570,
            decoration: BoxDecoration(
              color: Color(0xff241332),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
              ),
            ),
            child: DashboardContainerDesign(
              icon1: Icons.info,
              name1: "About US",
              showBadge1: false,
              onTap1: () {},
              icon2: Icons.exit_to_app,
              name2: "Logout",
              showBadge2: false,
              onTap2: () {
                LogOut().userLogOut();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
              },
              height: 450,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
            ),
          ),
          child: Container(
            height: SizeConfig.safeBlockVertical * 450,
            decoration: BoxDecoration(
              color: Color(0xff241332),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
              ),
            ),
            child: DashboardContainerDesign(
              icon1: Icons.markunread,
              name1: "Messages",
              showBadge1: true,
              onTap1: () {},
              icon2: Icons.notifications,
              name2: "Notifications",
              showBadge2: true,
              onTap2: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return UserNotification();
                }));
              },
              height: 330,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.safeBlockVertical * 50,
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: providerUser.logo == null
                        ? AssetImage("assets/images/logo.png")
                        : NetworkImage(providerUser.logo),
                    fit: BoxFit.cover),
                border: Border.all(style: BorderStyle.none),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(SizeConfig.safeBlockVertical * 70),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 50,
                      ),
                      FittedBox(
                        child: Text(
                          providerUser.companyName.toUpperCase(),
                          style: GoogleFonts.montserrat(
                            color: Color(0xff352641),
                            fontSize: SizeConfig.safeBlockHorizontal * 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return EditProfile(
                              user: providerUser.user,
                            );
                          }));
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xff352641),
                          radius: SizeConfig.safeBlockHorizontal * 18,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: SizeConfig.safeBlockHorizontal * 22,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        TopBar(),
      ],
    );
  }
}

class DashboardContainerDesign extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final double height;
  final name1;
  final name2;
  final bool showBadge1;
  final bool showBadge2;
  final onTap1;
  final onTap2;

  DashboardContainerDesign(
      {this.icon1,
      this.icon2,
      this.height,
      this.name1,
      this.name2,
      this.showBadge1,
      this.showBadge2,
      this.onTap1,
      this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: SizeConfig.safeBlockVertical * height,
        ),
        Expanded(
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Badge(
                        badgeContent: Text(
                          "12",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 10),
                        ),
                        badgeColor: Color(0xff00B6C7),
                        showBadge: showBadge1,
                        child: IconButton(
                            icon: Icon(
                              icon1,
                              color: Colors.white,
                              size: SizeConfig.safeBlockVertical * 30,
                            ),
                            onPressed: onTap1),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 100,
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              name1,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.2,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 65,
                    width: 0.5,
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Badge(
                        badgeContent: Text(
                          " 1 ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal * 10),
                        ),
                        badgeColor: Color(0xffFD8753),
                        showBadge: showBadge2,
                        child: IconButton(
                            icon: Icon(
                              icon2,
                              color: Colors.white,
                              size: SizeConfig.safeBlockVertical * 30,
                            ),
                            onPressed: onTap2),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 4,
                      ),
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 100,
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              name2,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.2,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 12),
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
        ),
      ],
    );
  }
}

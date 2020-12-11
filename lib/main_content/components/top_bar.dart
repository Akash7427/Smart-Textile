import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/provider/set_screen.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    var setscreeen = Provider.of<SetScreen>(context);
    return Container(
      padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 7),
      height: SizeConfig.safeBlockVertical * 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: SizeConfig.safeBlockVertical * 8,
            spreadRadius: SizeConfig.safeBlockVertical * 0.6,
          ),
        ],
        color: Color(0xfffbfbfb),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.safeBlockVertical * 70),
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    YouTopBarCircularIcon(
                      name: "You",
                      iconData: Icons.attach_money,
                      onTap: () => setscreeen.changeScreen(1),
                      selected: setscreeen.index == 1 ? true : false,
                    ),
                    TopBarCircularIcon(
                      name: "Global Markets",
                      iconData: Icons.attach_money,
                      onTap: () => setscreeen.changeScreen(2),
                      selected: setscreeen.index == 2 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    TopBarCircularIcon(
                      name: "Prediction",
                      iconData: Icons.trending_up,
                      onTap: () => setscreeen.changeScreen(3),
                      selected: setscreeen.index == 3 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    TopBarCircularIcon(
                      name: "Products",
                      iconData: Icons.shopping_basket,
                      onTap: () => setscreeen.changeScreen(8),
                      selected: setscreeen.index == 8 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    TopBarCircularIcon(
                      name: "Catalogue",
                      iconData: Icons.class_,
                      onTap: () => setscreeen.changeScreen(11),
                      selected: setscreeen.index == 11 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    providerUser.type == "Wholesaler"
                        ? TopBarCircularIcon(
                            name: "Producer",
                            iconData: Icons.people,
                            onTap: () => setscreeen.changeScreen(9),
                            selected: setscreeen.index == 9 ? true : false,
                            circleColor: Color(0xff008A91),
                          )
                        : TopBarCircularIcon(
                            name: "WholeSalers",
                            iconData: Icons.people,
                            onTap: () => setscreeen.changeScreen(4),
                            selected: setscreeen.index == 4 ? true : false,
                            circleColor: Color(0xff008A91),
                          ),
                    providerUser.type == "Retailer"
                        ? TopBarCircularIcon(
                            name: "Producer",
                            iconData: Icons.shopping_cart,
                            onTap: () => setscreeen.changeScreen(9),
                            selected: setscreeen.index == 9 ? true : false,
                            circleColor: Color(0xff008A91),
                          )
                        : TopBarCircularIcon(
                            name: "Retailers",
                            iconData: Icons.shopping_cart,
                            onTap: () => setscreeen.changeScreen(5),
                            selected: setscreeen.index == 5 ? true : false,
                            circleColor: Color(0xff008A91),
                          ),
                    TopBarCircularIcon(
                      name: "Transporters",
                      iconData: Icons.local_shipping,
                      onTap: () => setscreeen.changeScreen(6),
                      selected: setscreeen.index == 6 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    TopBarCircularIcon(
                      name: "Tax Consultants",
                      iconData: Icons.attach_money,
                      onTap: () => setscreeen.changeScreen(7),
                      selected: setscreeen.index == 7 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                    TopBarCircularIcon(
                      name: "Policy",
                      iconData: Icons.library_books,
                      onTap: () => setscreeen.changeScreen(10),
                      selected: setscreeen.index == 10 ? true : false,
                      circleColor: Color(0xff008A91),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                size: SizeConfig.safeBlockVertical * 25,
                color: Colors.black.withOpacity(0.21),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBarCircularIcon extends StatelessWidget {
  final name;
  final iconData;
  final Function onTap;
  final bool selected;
  final circleColor;
  TopBarCircularIcon(
      {this.iconData, this.name, this.onTap, this.selected, this.circleColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockVertical * 15,
                vertical: SizeConfig.safeBlockVertical * 6),
            child: CircleAvatar(
              backgroundColor:
                  selected == false ? Color(0xffE0E0E0) : circleColor,
              radius: (SizeConfig.safeBlockHorizontal * 24) + 2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: selected == false
                    ? SizeConfig.safeBlockHorizontal * 24
                    : SizeConfig.safeBlockHorizontal * 23,
                child: Icon(
                  iconData,
                  size: SizeConfig.safeBlockHorizontal * 25,
                  color: Color(0xff9AA6AC),
                ),
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            name,
            style: GoogleFonts.montserrat(
                color: Color(0xff9599B3),
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.safeBlockHorizontal * 10),
          ),
        )
      ],
    );
  }
}

class YouTopBarCircularIcon extends StatelessWidget {
  final name;
  final iconData;
  final Function onTap;
  final bool selected;
  YouTopBarCircularIcon({this.iconData, this.name, this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockVertical * 15,
                vertical: SizeConfig.safeBlockVertical * 6),
            child: Badge(
              position: BadgePosition.topRight(
                top: SizeConfig.safeBlockVertical * 1,
              ),
              badgeContent: Text(
                "13",
                style: TextStyle(color: Colors.white),
              ),
              animationType: BadgeAnimationType.fade,
              borderRadius: SizeConfig.safeBlockHorizontal * 25,
              badgeColor: Color(0xffFE8D6F),
              child: CircleAvatar(
                backgroundColor:
                    selected == false ? Color(0xffE0E0E0) : Color(0xffFF3D3D),
                radius: (SizeConfig.safeBlockHorizontal * 24) + 2,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: selected == false
                      ? SizeConfig.safeBlockHorizontal * 24
                      : SizeConfig.safeBlockHorizontal * 23,
                  backgroundImage: providerUser.logo == null
                      ? AssetImage("assets/images/logo.png")
                      : NetworkImage(providerUser.logo),
                ),
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            name,
            style: GoogleFonts.montserrat(
                color: Color(0xff9599B3),
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.safeBlockHorizontal * 10),
          ),
        )
      ],
    );
  }
}

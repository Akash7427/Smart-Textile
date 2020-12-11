import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/invoice1.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Business/Main/bill.dart';
import 'package:smarttextile/Business/Main/manage.dart';
import 'package:smarttextile/Business/Main/qr.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Business/Main/your_order.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/shared/provider_user.dart';

class ManageBusinessDashboard extends StatefulWidget {
  @override
  _ManageBusinessDashboardState createState() =>
      _ManageBusinessDashboardState();
}

class _ManageBusinessDashboardState extends State<ManageBusinessDashboard> {
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD96F9F),
        body: Stack(
          children: <Widget>[
            ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeHorizontal * 60,
                  width: SizeConfig.blockSizeVertical * 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff000000).withOpacity(0.3),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "Business",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 20,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Manage()));
                  },
                  child: CurvedListItem(
                    title: 'Product',
                    color: Color(0xffD96F9F),
                    nextColor: Color(0xff8343AE),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderDtls(providerUser: providerUser,)));
                  },
                  child: CurvedListItem(
                    title: 'Orders',
                    color: Color(0xff8343AE),
                    nextColor: Color(0xff150428),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bill(
                                  providerUser: providerUser,
                                )));
                  },
                  child: CurvedListItem(
                    title: 'Bill',
                    color: Color(0xff150428),
                    nextColor: Color(0xffE94B3C),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Qr(
                                  providerUser: providerUser,
                                )));
                  },
                  child: CurvedListItem(
                    title: 'Qrcode',
                    color: Color(0xffE94B3C),
                    nextColor: Color(0xffFDD20E),
                  ),
                ),
                GestureDetector(
                  child: CurvedListItem(
                    title: 'Report',
                    color: Color(0xffFDD20E),
                  ),
                ),
              ],
            ),
            Radial(),
          ],
        ),
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.title,
    this.color,
    this.nextColor,
  });

  final String title;

  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: EdgeInsets.only(
          left: SizeConfig.blockSizeVertical * 25,
          top: SizeConfig.blockSizeHorizontal * 40.0,
          bottom: SizeConfig.blockSizeVertical * 40,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal * 31,
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.normal),
                ),
              ),
              Row(),
            ]),
      ),
    );
  }
}

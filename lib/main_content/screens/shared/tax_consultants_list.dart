import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttextile/main_content/components/top_bar.dart';
import 'package:smarttextile/main_content/screens/shared/tax_consultant.dart';
import 'package:smarttextile/shared/size_config.dart';

class TaxConsultantsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 132,
                      width: double.maxFinite,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ZoomIn(
                        child: Text(
                          "Select Tax-Consultants",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.safeBlockHorizontal * 19,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    FadeInUp(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 170,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xff5BAEB7),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff5BAEB7)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T01.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      100,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Charted Accountants",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        18,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 200,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffEFDA71),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffEFDA71)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T03.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      130,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Subsidy Consultants",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 200,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffBCEA6A),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffBCEA6A)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T05.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      130,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Accountants",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 170,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffE9DFC6),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffE9DFC6)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T07.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      100,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Tax Advisor",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        18,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 10,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 200,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xff82EFB1),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff82EFB1)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(-2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T02.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      130,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Loan Consultants",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 200,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffD085E7),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffD085E7)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(-2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T04.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      130,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Legal Advisor",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 170,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffECB073),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffECB073)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(-2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T06.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      100,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Auditors",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return TaxConsultant();
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height:
                                            SizeConfig.safeBlockVertical * 170,
                                        width: SizeConfig.safeBlockHorizontal *
                                            160,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFD662),
                                          borderRadius: BorderRadius.circular(
                                            SizeConfig.safeBlockHorizontal * 15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffFFD662)
                                                  .withOpacity(0.5),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(-2, 2),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 4.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Image(
                                                  image: AssetImage(
                                                    "assets/images/tax/T08.png",
                                                  ),
                                                  height: SizeConfig
                                                          .safeBlockVertical *
                                                      100,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                child: Text(
                                                  "Sales Tax Consultants",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        19,
                                                    fontFamily: "Segoe UI",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockVertical * 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TopBar(),
          ],
        ),
      ),
    );
  }
}

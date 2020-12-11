import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/screens/shared/single_tax_consultant_detail.dart';
import 'package:smarttextile/shared/size_config.dart';

class TaxConsultant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
          child: Column(
            children: <Widget>[
              GreyHeader(
                name: "Tax Consultant",
                color: Color(0xff03ACB8),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 252,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/03.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 224,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/09.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 196,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/08.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 168,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/07.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 140,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/06.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: SizeConfig.safeBlockHorizontal * 112),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/05.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 84,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/04.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 56,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/tax/03.png",
                              ),
                              radius: SizeConfig.safeBlockHorizontal * 19,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 28,
                          ),
                          CircleAvatar(
                            radius: SizeConfig.safeBlockHorizontal * 22,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: SizeConfig.safeBlockHorizontal * 19,
                              backgroundImage: AssetImage(
                                "assets/images/tax/02.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: SizeConfig.safeBlockHorizontal * 22,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: SizeConfig.safeBlockHorizontal * 19,
                          backgroundImage: AssetImage(
                            "assets/images/tax/01.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SingleTaxConsultantDetailPage();
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 10),
                  width: SizeConfig.safeBlockHorizontal * 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff707070).withOpacity(0.15),
                        blurRadius: SizeConfig.safeBlockHorizontal * 4.0,
                        spreadRadius: SizeConfig.safeBlockHorizontal * 0.7,
                        offset: Offset(0, SizeConfig.safeBlockHorizontal * 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 20,
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 15,
                          vertical: SizeConfig.safeBlockVertical * 10,
                        ),
                        child: CircleAvatar(
                          radius: SizeConfig.safeBlockHorizontal * 35,
                          backgroundImage: AssetImage(
                            "assets/images/tax/01.png",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: SizeConfig.safeBlockHorizontal * 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "4.5",
                                    style: GoogleFonts.muli(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFEB37),
                                    size: SizeConfig.safeBlockHorizontal * 16,
                                  ),
                                ],
                              ),
                              FittedBox(
                                child: Text(
                                  "Paras Gang",
                                  style: GoogleFonts.muli(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "Surat, Gujarat",
                                  style: GoogleFonts.muli(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Add to favourite",
                                    style: GoogleFonts.muli(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 4,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    size: SizeConfig.safeBlockHorizontal * 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smarttextile/main_content/components/top_bar.dart';
import 'package:smarttextile/main_content/models/news.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class GlobalMarkets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 50,
                ),
                Expanded(child: NewsListView()),
              ],
            ),
            TopBar(),
          ],
        ),
      ),
    );
  }
}

class NewsListView extends StatelessWidget {
  List<Color> colors = [
    Color(0xff4EBDEF),
    Color(0xff0051A2),
    Color(0xff132641),
  ];
  List<News> news = [
    News(
        time: "Today  6:00 PM",
        title:
            "Navratri collection is boosing up in the indian market: Says World Market"),
    News(
        time: "Tuesday  5:30 PM",
        title:
            "Global textile market gets all timehigh leverage due to the workers of city Surat, India: Narendra Modi "),
    News(
        time: "Friday  6:00 PM",
        title:
            "Mukesh ambani to start the textile factory in surat and dubai's prince is interested in investing."),
    News(
        time: "Tuesday  5:30 PM",
        title:
            "Global textile market gets all timehigh leverage due to the workers of city Surat, India: Narendra Modi "),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        var color = colors[index % 3];
        var nextColor = colors[(index + 1) % 3];
        return Container(
          decoration: BoxDecoration(
            color: index != (news.length) - 1 ? nextColor : Colors.transparent,
            border: Border(
              top: BorderSide(
                width: 0,
                color: color,
              ),
              bottom: BorderSide(
                width: 0,
                color: nextColor,
              ),
            ),
          ),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              border: Border.all(style: BorderStyle.none),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.safeBlockHorizontal * 30,
                top: SizeConfig.safeBlockVertical * 10,
                bottom: SizeConfig.safeBlockVertical * 20,
                right: SizeConfig.safeBlockHorizontal * 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  index == 0
                      ? SizedBox(
                          height: SizeConfig.safeBlockVertical * 70,
                        )
                      : SizedBox(),
                  Text(
                    news[index].time.toString().toUpperCase(),
                    style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.48),
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.safeBlockHorizontal * 11),
                  ),
                  Text(
                    news[index].title,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: SizeConfig.safeBlockHorizontal * 18),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 8,
                  ),
                  Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal * 25,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: SizeConfig.safeBlockHorizontal * 20.5,
                                child: CircleAvatar(
                                  radius: SizeConfig.safeBlockHorizontal * 18,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: SizeConfig.safeBlockHorizontal * 20.5,
                            child: CircleAvatar(
                              radius: SizeConfig.safeBlockHorizontal * 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 5,
                      ),
                      Text(
                        "Click here for more info",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: SizeConfig.safeBlockHorizontal * 12,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

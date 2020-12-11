import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/Chat/screens/chatscreens/chat_screen.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/components/radial_menu.dart';
import 'package:smarttextile/main_content/models/requirements_model.dart';
import 'package:smarttextile/main_content/provider/circle_provider.dart';
import 'package:smarttextile/main_content/services/api_requirements.dart';

import 'package:smarttextile/shared/size_config.dart';
import 'package:smarttextile/main_content/screens/shared/requirements/post_requirements.dart';

class Requirements extends StatefulWidget {
  @override
  _RequirementsState createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  List<RequirementsModel> requirements = List();
  void getRequirements() async {
    requirements = await ApiRequirements().getRequirements();
    print("Hello");
    setState(() {});
  }

  bool _visibleLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequirements();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PostRequirements();
            }));
          },
          child: Icon(
            Icons.person_add,
          ),
          backgroundColor: Color(0xff62B9BF),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 85,
                ),
                Expanded(
                  child: Container(
                    child: requirements.length != 0
                        ? ListView.builder(
                            itemCount: requirements.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 20,
                                  vertical: SizeConfig.safeBlockVertical * 7,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeConfig.safeBlockVertical * 10,
                                  horizontal:
                                      SizeConfig.safeBlockHorizontal * 15,
                                ),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  //   width: 0.3,
                                  // ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockVertical * 10,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      offset: Offset(
                                        0,
                                        SizeConfig.safeBlockVertical * 2.5,
                                      ),
                                      blurRadius:
                                          SizeConfig.safeBlockVertical * 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Product Category :- ${requirements[index].category}",
                                            style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  15,
                                              fontFamily: "Segoe Ui",
                                            ),
                                          ),
                                          Text(
                                            "Price Range :- ${requirements[index].startingPrice} - ${requirements[index].endingPrice}",
                                            style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  15,
                                              fontFamily: "Segoe Ui",
                                            ),
                                          ),
                                          requirements[index].subCategory != ""
                                              ? Text(
                                                  "Sub Category :- ${requirements[index].subCategory}",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        15,
                                                    fontFamily: "Segoe Ui",
                                                  ),
                                                )
                                              : SizedBox(),
                                          requirements[index].description != ""
                                              ? Text(
                                                  "Description:- ${requirements[index].description}",
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .safeBlockHorizontal *
                                                        15,
                                                    fontFamily: "Segoe Ui",
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 0.5,
                                      height: SizeConfig.safeBlockVertical * 40,
                                      color: Colors.black54,
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.mode_comment,
                                          color: Color(0xff62B9BF),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _visibleLoading = true;
                                          });
                                          User _user = await AuthMethods()
                                              .getUserDetailsById(
                                                  requirements[index].uid);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ChatScreen(
                                              receiver: _user,
                                            );
                                          }));
                                          setState(() {
                                            _visibleLoading = false;
                                          });
                                        })
                                  ],
                                ),
                              );
                            })
                        : Center(
                            child: Container(
                              height: SizeConfig.safeBlockHorizontal * 100,
                              width: SizeConfig.safeBlockHorizontal * 100,
                              child: FlareActor(
                                "assets/images/loader.flr",
                                animation: "Aura",
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
            Container(
              height: SizeConfig.safeBlockVertical * 75,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black.withOpacity(0.16),
                        spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Center(
                child: Text(
                  "Requiremnets",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: SizeConfig.safeBlockHorizontal * 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Radial(),
            Visibility(
              visible: _visibleLoading,
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

import 'package:smarttextile/main_content/screens/shared/favourite/connected_user.dart';
import 'package:smarttextile/main_content/screens/shared/favourite/fav_products.dart';
import 'package:smarttextile/shared/provider_user.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  height: SizeConfig.blockSizeHorizontal * 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xff000000).withOpacity(0.16),
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ]),
                  child: Center(
                    child: Text(
                      "Favourite",
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal * 20,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                Expanded(
                  child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: DefaultTabController(
                        length: 2,
                        child: Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 15,
                            ),
                            constraints: BoxConstraints.expand(height: 50),
                            child: TabBar(
                              tabs: [
                                Tab(text: "Connection Requests"),
                                Tab(text: "Your Connections"),
                              ],
                              indicatorColor: Color(0xff62B9BF),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(
                                children: [
                                  FavProducts(
                                    providerUser: providerUser,
                                  ),
                                  FavUsers(
                                    providerUser: providerUser,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      )),
                )
              ],
            ),
            Radial(),
          ],
        ),
      ),
    );
  }
}

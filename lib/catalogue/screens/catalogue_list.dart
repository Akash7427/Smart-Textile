import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttextile/catalogue/screens/catalogue.dart';
import 'package:smarttextile/catalogue/services/ApiCatalogue.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/components/product_shimmer.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CatalogueSearch extends StatefulWidget {
  
  @override
  _CatalogueSearchState createState() => _CatalogueSearchState();
}

class _CatalogueSearchState extends State<CatalogueSearch> {
  List<Catalogue> cataloguelist = List();

  Future getlist() async{
    cataloguelist = await ApiCatalogue().getAllCataloguelist1();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlist();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 10),
              child: GreyHeader(
                name: "Catalogue",
                color: Color(0xff03ACB8),
                textColor: Color(0xffffffff),
              ),
            ),
            Text(
              "List of Catelogue",
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Segoe UI",
              ),
            ),
            
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            Expanded(
              child: Container(
                  height: SizeConfig.safeBlockVertical * 100,
                  child: cataloguelist.length != 0
                      ? ListView.builder(
                          itemCount: cataloguelist.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 8,
                              ),
                              width: SizeConfig.safeBlockHorizontal * 320,
                              height: SizeConfig.safeBlockVertical * 145,
                              decoration: BoxDecoration(
                                  color: Color(0xff03ACB8),
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockHorizontal * 20,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff000000)
                                            .withOpacity(0.16),
                                        blurRadius: 5.0,
                                        //spreadRadius: 1.0,
                                        offset: Offset(0, 2)),
                                  ]),
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: SizeConfig.safeBlockHorizontal * 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockHorizontal * 20,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        height: SizeConfig.safeBlockVertical *
                                            145,
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                providerUser
                                                    .setFavouriteProducts(
                                                        cataloguelist[index]
                                                            .catId);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffEBEBEB),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(
                                                        SizeConfig
                                                                .safeBlockHorizontal *
                                                            20,
                                                      ),
                                                      bottomRight:
                                                          Radius.circular(
                                                        SizeConfig
                                                                .safeBlockHorizontal *
                                                            20,
                                                      ),
                                                    )),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .safeBlockHorizontal *
                                                        10,
                                                    vertical: SizeConfig
                                                            .safeBlockVertical *
                                                        5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    providerUser.favouriteProducts !=
                                                            null
                                                        ? providerUser
                                                                .favouriteProducts
                                                                .contains(cataloguelist[index].catId)
                                                            ? Icon(
                                                                Icons
                                                                    .favorite,
                                                                color: Color(
                                                                    0xffFF7171),
                                                              )
                                                            : Icon(Icons
                                                                .favorite_border)
                                                        : Icon(Icons
                                                            .favorite_border),
                                                    SizedBox(
                                                      width: 3,
                                                    ),
                                                    Text("Add to Fav."),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Spacer(
                                              flex: 2,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: FittedBox(
                                                  child: Text(
                                                    cataloguelist[index].name,
                                                    style:
                                                        GoogleFonts.raleway(
                                                      fontSize: SizeConfig
                                                              .safeBlockHorizontal *
                                                          18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                ),
                                                child: SmoothStarRating(
                                                  starCount: 5,
                                                  isReadOnly: true,
                                                  rating: 4.5,
                                                  color: Color(0xffFFDF00),
                                                  allowHalfRating: true,
                                                ),
                                              ),
                                            ),
                                            Spacer(
                                              flex: 2,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      10,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      5),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff03ACB8),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(
                                                      SizeConfig
                                                              .safeBlockHorizontal *
                                                          20,
                                                    ),
                                                    topRight: Radius.circular(
                                                      SizeConfig
                                                              .safeBlockHorizontal *
                                                          20,
                                                    ),
                                                  )),
                                              child: Text(
                                                cataloguelist[index].category,
                                                style: TextStyle(
                                                  fontFamily: "Segoe Ui",
                                                  color: Colors.white,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: SizeConfig.safeBlockVertical *
                                          135,
                                      width:
                                          SizeConfig.safeBlockVertical * 90,
                                      margin: EdgeInsets.only(
                                        right:
                                            SizeConfig.safeBlockHorizontal *
                                                10,
                                        top: SizeConfig.safeBlockVertical *
                                            5,
                                        bottom:
                                            SizeConfig.safeBlockVertical *
                                                5,
                                        left:
                                            SizeConfig.safeBlockHorizontal *
                                                5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          SizeConfig.safeBlockHorizontal *
                                              20,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black
                                                .withOpacity(0.16),
                                            blurRadius: 3.0,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                        image: DecorationImage(
                                            image: AssetImage(
                                                    "assets/images/logo.png",
                                                    
                                            ),fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                                baseColor: Colors.grey[300],
                                highlightColor: Colors.grey[100],
                                child: ProductShimmer());
                          })),
            )
          ],
        ),
      ),
    );
  }
}

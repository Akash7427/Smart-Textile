import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/main_content/components/product_shimmer.dart';
import 'package:smarttextile/main_content/screens/shared/products/single_product_details.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:smarttextile/main_content/services/api_favrouite.dart';

class FavProducts extends StatefulWidget {
  final ProviderUser providerUser;
  FavProducts({@required this.providerUser});
  @override
  _FavProductsState createState() => _FavProductsState();
}

class _FavProductsState extends State<FavProducts> {
  void getData() async {
    if (widget.providerUser.favouriteProducts.length == 0) {
      productAvailable = false;
    } else {
      favProducts = await ApiFavourite()
          .getFavProducts(widget.providerUser.favouriteProducts);
    }
    setState(() {});
  }

  bool productAvailable = true;
  List<Product> favProducts = List();
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return Container(
      child: productAvailable == true
          ? favProducts.length != 0
              ? ListView.builder(
                  itemCount: favProducts.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SingleProductDetails(
                            product: favProducts[index],
                          );
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 20,
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
                                  color: Color(0xff000000).withOpacity(0.16),
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
                                  height: SizeConfig.safeBlockVertical * 145,
                                  color: Colors.transparent,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          providerUser.setFavouriteProducts(
                                              favProducts[index].id);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffEBEBEB),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  SizeConfig
                                                          .safeBlockHorizontal *
                                                      20,
                                                ),
                                                bottomRight: Radius.circular(
                                                  SizeConfig
                                                          .safeBlockHorizontal *
                                                      20,
                                                ),
                                              )),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .safeBlockHorizontal *
                                                  10,
                                              vertical:
                                                  SizeConfig.safeBlockVertical *
                                                      5),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              providerUser.favouriteProducts
                                                      .contains(
                                                          favProducts[index].id)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Color(0xffFF7171),
                                                    )
                                                  : Icon(Icons.favorite_border),
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
                                          alignment: Alignment.centerRight,
                                          child: FittedBox(
                                            child: Text(
                                              favProducts[index].name,
                                              style: GoogleFonts.raleway(
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.safeBlockHorizontal *
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
                                            horizontal:
                                                SizeConfig.safeBlockHorizontal *
                                                    10,
                                            vertical:
                                                SizeConfig.safeBlockVertical *
                                                    5),
                                        decoration: BoxDecoration(
                                            color: Color(0xff03ACB8),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                SizeConfig.safeBlockHorizontal *
                                                    20,
                                              ),
                                              topRight: Radius.circular(
                                                SizeConfig.safeBlockHorizontal *
                                                    20,
                                              ),
                                            )),
                                        child: Text(
                                          "₹${favProducts[index].sp * favProducts[index].minOrder}/${favProducts[index].minOrder} ${favProducts[index].unitType}",
                                          style: TextStyle(
                                            fontFamily: "Segoe Ui",
                                            color: Colors.white,
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
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
                                height: SizeConfig.safeBlockVertical * 135,
                                width: SizeConfig.safeBlockVertical * 90,
                                margin: EdgeInsets.only(
                                  right: SizeConfig.safeBlockHorizontal * 10,
                                  top: SizeConfig.safeBlockVertical * 5,
                                  bottom: SizeConfig.safeBlockVertical * 5,
                                  left: SizeConfig.safeBlockHorizontal * 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockHorizontal * 20,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.16),
                                      blurRadius: 3.0,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: favProducts[index].primaryImg ==
                                              null
                                          ? AssetImage("assets/images/logo.png")
                                          : NetworkImage(
                                              favProducts[index].primaryImg),
                                      fit: BoxFit.fitHeight),
                                ),
                              ),
                            ],
                          ),
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
                  },
                )
          : SvgPicture.asset("assets/images/svg/empty.svg"),
      width: SizeConfig.safeBlockHorizontal * 280,
    );
  }
}

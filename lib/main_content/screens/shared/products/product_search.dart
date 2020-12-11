import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/components/product_shimmer.dart';
import 'package:smarttextile/main_content/components/search_bar.dart';
import 'package:smarttextile/main_content/components/supplier_shimmer.dart';
import 'package:smarttextile/main_content/provider/provider_counter.dart';
import 'package:smarttextile/main_content/provider/provider_product_filter.dart';
import 'package:smarttextile/main_content/provider/provider_search.dart';
import 'package:smarttextile/main_content/screens/shared/products/product_filter.dart';
import 'package:smarttextile/main_content/screens/shared/products/single_product_details.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:smarttextile/main_content/services/api_products.dart';

class ProductSearch extends StatelessWidget {
  ApiProducts apiProducts = ApiProducts();
  ProviderSearch providerSearch;
  ProviderProductsFilter providerProductsFilter;
  List<Product> productList = List();
  List<Product> _searchProducts = List();
  List<Product> _filterProducts = List();
  getData() async {
    productList =
        await apiProducts.getProduct(providerProductsFilter.productType);
    providerSearch.setList(productList);
    providerSearch.setFilterList(productList);
    print(productList);
  }

  @override
  Widget build(BuildContext context) {
    ProviderCounter providerCounter = Provider.of<ProviderCounter>(context);
    providerProductsFilter = Provider.of<ProviderProductsFilter>(context);
    providerSearch = Provider.of<ProviderSearch>(context);
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    if (providerCounter.counter == 0) {
      getData();
      providerCounter.setCounter(1);
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.safeBlockVertical * 10),
              child: GreyHeader(
                name: providerProductsFilter.productType,
                color: Color(0xff03ACB8),
                textColor: Color(0xffffffff),
              ),
            ),
            Text(
              "List of Products",
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 15,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Segoe UI",
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
              width: double.maxFinite,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 20),
              child: Row(
                children: <Widget>[
                  SearchBar(
                    onChanged: (string) {
                      _searchProducts = _filterProducts
                          .where((u) => u.name
                              .toLowerCase()
                              .contains(string.trim().toLowerCase()))
                          .toList();
                      providerSearch.setFilterList(_searchProducts);
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 7,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductFilter(
                                provider: providerProductsFilter);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 9),
                      child: Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Segoe UI",
                        ),
                      ),
                    ),
                    color: Color(0xffEBEBEB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.safeBlockHorizontal * 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 10,
            ),
            Expanded(
              child: Container(
                  height: SizeConfig.safeBlockVertical * 100,
                  child: providerSearch.filterList.length != 0
                      ? ListView.builder(
                          itemCount: providerSearch.filterList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ApiProducts().productIncrementCounter(
                                    providerSearch.filterList[index].id);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return SingleProductDetails(
                                    product: providerSearch.filterList[index],
                                  );
                                }));
                              },
                              child: Container(
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
                                                          providerSearch
                                                              .filterList[index]
                                                              .id);
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
                                                                  .contains(providerSearch
                                                                      .filterList[
                                                                          index]
                                                                      .id)
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
                                                      providerSearch
                                                          .filterList[index]
                                                          .name,
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
                                                  "₹${providerSearch.filterList[index].sp * providerSearch.filterList[index].minOrder}/${providerSearch.filterList[index].minOrder} ${providerSearch.filterList[index].unitType}",
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
                                              image: providerSearch
                                                          .filterList[index]
                                                          .primaryImg ==
                                                      null
                                                  ? AssetImage(
                                                      "assets/images/logo.png")
                                                  : NetworkImage(
                                                      providerSearch
                                                          .filterList[index]
                                                          .primaryImg),
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
                          })),
            )
          ],
        ),
      ),
    );
  }
}

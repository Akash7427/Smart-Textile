import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/models/get_list.dart';
import 'package:smarttextile/main_content/provider/provider_supplier_filter_option.dart';
import 'package:smarttextile/main_content/screens/shared/search.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SupplierFilter extends StatelessWidget {
  final onTap;

  SupplierFilter({this.onTap});
  ProviderSupplierFilterOption providerSupplierFilteroption;

  Iterable<Widget> get citiesWidget sync* {
    for (var city in providerSupplierFilteroption.cities) {
      yield FilterChip(
        label: Text(
          city,
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 12,
        ),
        labelStyle: TextStyle(
          fontFamily: "Segoe UI L",
          color: Colors.black,
          fontSize: SizeConfig.safeBlockHorizontal * 14,
        ),
        backgroundColor: Colors.white,
        selectedColor: Color(0xff00CBD2),
        elevation: 5.0,
        selected: providerSupplierFilteroption.filtercity.contains(city),
        onSelected: (bool selected) {
          if (selected) {
            providerSupplierFilteroption.addFlterCity(city);
          } else {
            providerSupplierFilteroption.removeFilterCity(city);
          }
          onTap();
        },
      );
    }
  }

  Iterable<Widget> get subCategoryWidget sync* {
    for (var subCategory in providerSupplierFilteroption.subCategory) {
      yield FilterChip(
        label: FittedBox(
          child: Text(
            subCategory,
          ),
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 12,
        ),
        labelStyle: TextStyle(
          fontFamily: "Segoe UI L",
          color: Colors.black,
          fontSize: SizeConfig.safeBlockHorizontal * 14,
        ),
        backgroundColor: Colors.white,
        selectedColor: Color(0xff00CBD2),
        elevation: 5.0,
        selected: providerSupplierFilteroption.filterSubCategory
            .contains(subCategory),
        onSelected: (bool selected) {
          if (selected) {
            providerSupplierFilteroption.addFilterSubCategory(subCategory);
          } else {
            providerSupplierFilteroption.removeFilterSubCategory(subCategory);
          }
          onTap();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    providerSupplierFilteroption =
        Provider.of<ProviderSupplierFilterOption>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbfbfb),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 10,
              vertical: SizeConfig.safeBlockVertical * 15,
            ),
            child: Column(
              children: <Widget>[
                GreyHeader(
                  name: "Filters",
                  color: Color(0xffEBEBEB),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        onTap();
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 5,
                            horizontal: SizeConfig.safeBlockHorizontal * 8),
                        child: Text(
                          "Done",
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Segoe UI",
                          ),
                        ),
                      ),
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.safeBlockHorizontal * 20),
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        providerSupplierFilteroption.clearFilterCity();
                        providerSupplierFilteroption.clearFilterSubCategory();
                        providerSupplierFilteroption.setRatings(0.0);
                        onTap();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 5,
                            horizontal: SizeConfig.safeBlockHorizontal * 8),
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Segoe UI",
                          ),
                        ),
                      ),
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.safeBlockHorizontal * 20),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select City",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 20,
                      letterSpacing: SizeConfig.safeBlockHorizontal * 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Wrap(
                  children: <Widget>[
                    Wrap(
                      children: citiesWidget.toList(),
                      spacing: SizeConfig.safeBlockHorizontal * 7,
                    ),
                    RaisedButton(
                      elevation: 5.0,
                      onPressed: () {
                        //TODO
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Search(
                                list: GetList().getCityList(),
                                onTap: (city) {
                                  providerSupplierFilteroption.addCity(city);
                                  providerSupplierFilteroption
                                      .addFlterCity(city);
                                  onTap();
                                },
                                name: "City",
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        "+ Add your city",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 12,
                          color: Colors.black,
                          fontFamily: "Segoe UI L",
                        ),
                      ),
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xff00ADD1),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.safeBlockHorizontal * 15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 25,
                ),
                providerSupplierFilteroption.supplierType != "Transporter"
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Sub-Category",
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            color: Colors.black,
                            fontSize: SizeConfig.safeBlockHorizontal * 20,
                            letterSpacing: SizeConfig.safeBlockHorizontal * 0.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : SizedBox(),
                providerSupplierFilteroption.supplierType != "Transporter"
                    ? Wrap(
                        children: <Widget>[
                          Wrap(
                            children: subCategoryWidget.toList(),
                            spacing: SizeConfig.safeBlockHorizontal * 7,
                          ),
                          RaisedButton(
                            elevation: 5.0,
                            onPressed: () {
                              //TODO
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Search(
                                      list: providerSupplierFilteroption
                                                  .categoryType ==
                                              "Saree"
                                          ? GetList().getSareeSubCategoryList()
                                          : providerSupplierFilteroption
                                                      .categoryType ==
                                                  "Dress"
                                              ? GetList()
                                                  .getDressSubCategoryList()
                                              : providerSupplierFilteroption
                                                          .categoryType ==
                                                      "Kurti"
                                                  ? GetList()
                                                      .getKurtiSubCategoryList()
                                                  : providerSupplierFilteroption
                                                              .categoryType ==
                                                          "Fabrics"
                                                      ? GetList()
                                                          .getFabricsSubCategoryList()
                                                      : providerSupplierFilteroption
                                                                  .categoryType ==
                                                              "Ethnic Wear"
                                                          ? GetList()
                                                              .getEthincWearSubCategoryList()
                                                          : GetList()
                                                              .getApperalAndGarmentsSubCategoryList(),
                                      onTap: (subCategory) {
                                        providerSupplierFilteroption
                                            .addSubCategory(subCategory);
                                        providerSupplierFilteroption
                                            .addFilterSubCategory(subCategory);
                                        onTap();
                                      },
                                      name: "Sub-Category",
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "+ Add more",
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                color: Colors.black,
                                fontFamily: "Segoe UI L",
                              ),
                            ),
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xff00ADD1),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  SizeConfig.safeBlockHorizontal * 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ratings",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      color: Colors.black,
                      fontSize: SizeConfig.safeBlockHorizontal * 20,
                      letterSpacing: SizeConfig.safeBlockHorizontal * 0.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SmoothStarRating(
                  rating: providerSupplierFilteroption.ratings,
                  allowHalfRating: false,
                  size: SizeConfig.safeBlockHorizontal * 50,
                  onRated: (rating) {
                    providerSupplierFilteroption.setRatings(rating);
                    onTap();
                  },
                  color: Color(0xffFFF175),
                  borderColor: Color(0xff00ADD1),
                  //filledIconData: Icons.blur_off,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

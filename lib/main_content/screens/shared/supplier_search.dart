import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/components/category_select.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/components/radial.dart';
import 'package:smarttextile/main_content/components/search_bar.dart';
import 'package:smarttextile/main_content/components/single_supplier_list_container.dart';
import 'package:smarttextile/main_content/components/supplier_shimmer.dart';
import 'package:smarttextile/main_content/models/supplier.dart';
import 'package:smarttextile/main_content/provider/provider_search.dart';
import 'package:smarttextile/main_content/provider/provider_supplier_filter_option.dart';
import 'package:smarttextile/main_content/screens/shared/single_supplier_detail_page.dart';
import 'package:smarttextile/main_content/screens/shared/supplier_filter.dart';
import 'package:smarttextile/main_content/services/supplier_services.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';

class SupplierSearch extends StatelessWidget {
  final SupplierService _supplierService = SupplierService();

  List<dynamic> _filterSuppliers = List();
  List<User> _allSupplier = List();
  List<dynamic> _searchSuppliers = List();
  ProviderSupplierFilterOption providerSupplierFilterOption;
  ProviderSearch providerSearch;

  getData() async {
    _filterSuppliers = await _supplierService.getUser(
        providerSupplierFilterOption.supplierType,
        providerSupplierFilterOption.categoryType);
    _searchSuppliers = _filterSuppliers;
    _allSupplier = _filterSuppliers;
    providerSearch.setList(_allSupplier);
    providerSearch.setFilterList(_allSupplier);
    providerSupplierFilterOption.setCounter(1);
  }

  setFilters() {
    if (_allSupplier.length > 0) {
      _searchSuppliers = _filterSuppliers = _allSupplier.where((supplier) {
        var city = true, ratings = false, subCategory = true;
        if (providerSupplierFilterOption.filtercity.length > 0) {
          city = false;
          for (var i in providerSupplierFilterOption.filtercity) {
            if (supplier.city.toLowerCase() == i.toLowerCase()) {
              city = true;
            }
          }
        }
        // if (providerSupplierFilterOption.filterSubCategory.length > 0) {
        //   subCategory = false;
        //   for (var i in providerSupplierFilterOption.filterSubCategory) {

        //   }
        // }

        if (providerSupplierFilterOption.ratings <=
            int.parse(supplier.rating)) {
          ratings = true;
        }
        return city && subCategory && ratings;
      }).toList();
      //
      providerSearch.setList(_searchSuppliers);
      providerSearch.setFilterList(_searchSuppliers);
    }
  }

  @override
  Widget build(BuildContext context) {
    providerSupplierFilterOption =
        Provider.of<ProviderSupplierFilterOption>(context);
    providerSearch = Provider.of<ProviderSearch>(context);
    if (providerSupplierFilterOption.counter == 0) {
      getData();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFBFBFB),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical * 10),
                  child: GreyHeader(
                    name: "${providerSupplierFilterOption.categoryType}",
                    color: Color(0xff03ACB8),
                  ),
                ),
                Text(
                  "List of ${providerSupplierFilterOption.supplierType}",
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
                          _searchSuppliers = _filterSuppliers
                              .where((u) => u.companyName
                                  .toLowerCase()
                                  .contains(string.trim().toLowerCase()))
                              .toList();
                          providerSearch.setFilterList(_searchSuppliers);
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
                                return SupplierFilter(
                                  onTap: setFilters,
                                );
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
                            Radius.circular(
                                SizeConfig.safeBlockHorizontal * 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 18,
                ),
                Expanded(
                  child: Container(
                    height: SizeConfig.safeBlockVertical * 100,
                    child: providerSearch.filterList.length == 0
                        ? ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  child: SupplierShimmer());
                            })
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: providerSearch.filterList.length,
                            itemBuilder: (context, index) {
                              return FadeInLeft(
                                duration: Duration(milliseconds: 500),
                                delay: Duration(milliseconds: index * 50),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return SingleSupplierDetailPage(
                                        supplier:
                                            providerSearch.filterList[index],
                                      );
                                    }));
                                  },
                                  child: SingleSupplierListContainer(
                                    supplier: providerSearch
                                        .filterList[index],
                                    companyName: providerSearch
                                        .filterList[index].companyName,
                                    city: providerSearch.filterList[index].city,
                                    state:
                                        providerSearch.filterList[index].state,
                                    ratings:
                                        providerSearch.filterList[index].rating,
                                    imageUrl:
                                        providerSearch.filterList[index].logo,
                                  ),
                                ),
                              );
                            }),
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

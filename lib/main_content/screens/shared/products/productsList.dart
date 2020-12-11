import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/main_content/components/top_bar.dart';
import 'package:smarttextile/main_content/provider/provider_counter.dart';
import 'package:smarttextile/main_content/provider/provider_product_filter.dart';
import 'package:smarttextile/main_content/provider/provider_search.dart';
import 'package:smarttextile/main_content/screens/shared/products/product_search.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page.toInt();
      });
    });
    SizeConfig().init(context);
    ProviderCounter providerCounter = Provider.of<ProviderCounter>(context);
    ProviderSearch providerSearch = Provider.of<ProviderSearch>(context);
    ProviderProductsFilter providerProductsFilter =
        Provider.of<ProviderProductsFilter>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff005364),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 132,
                  width: double.maxFinite,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Select Product Type",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.safeBlockHorizontal * 19,
                        color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                      //color: Colors.red,
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 20,
                      ),
                      FadeInRight(
                        child: Container(
                          width: double.maxFinite,
                          height: SizeConfig.safeBlockVertical * 300,
                          child: PageView(
                            controller: _pageController,
                            children: <Widget>[
                              ProductTypePageViewContanier(
                                name: "Saree",
                                color: Color(0xffFFC600),
                                image: "assets/images/svg/Saree.svg",
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Saree");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ProductTypePageViewContanier(
                                name: "Dress",
                                color: Color(0xff0088FF),
                                image: "assets/images/svg/dress.svg",
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Dress");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ProductTypePageViewContanier(
                                name: "Kurti",
                                color: Color(0xffB50067),
                                image: "assets/images/svg/kurti.svg",
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Kurti");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ProductTypePageViewContanier(
                                name: "Ethnic Wear",
                                color: Color(0xff030058),
                                image: "assets/images/svg/ethnic.svg",
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Ethnic_Wear");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ProductTypePageViewContanier(
                                name: "Fabrics",
                                color: Color(0xff06B906),
                                image: "assets/images/svg/fabric.svg",
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Fabric");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                              ProductTypePageViewContanier(
                                name: "Apparel and Garments",
                                color: Color(0xffBB0000),
                                image: "assets/images/svg/suit.svg",
                                size: true,
                                onTap: () {
                                  providerCounter.setCounter(0);
                                  providerSearch.setFilterList([]);
                                  providerSearch.setList([]);
                                  providerProductsFilter
                                      .setProductType("Apparel_and_Garments");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductSearch();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 15,
                      ),
                      FadeInRight(
                        child: Container(
                          width: double.maxFinite,
                          height: SizeConfig.safeBlockVertical * 4,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: index == _currentPage
                                      ? SizeConfig.safeBlockHorizontal * 20
                                      : SizeConfig.safeBlockHorizontal * 8,
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 2,
                                    vertical: SizeConfig.safeBlockVertical * 0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index == _currentPage
                                        ? Colors.white
                                        : Color(0xff707070),
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockVertical * 3),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
            TopBar(),
          ],
        ),
      ),
    );
  }
}

class ProductTypePageViewContanier extends StatelessWidget {
  final Color color;
  final name;
  final image;
  final bool size;
  final Function onTap;

  ProductTypePageViewContanier({
    @required this.color,
    @required this.image,
    @required this.name,
    this.size,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.safeBlockVertical * 300,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal * 25),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 310,
                height: SizeConfig.safeBlockVertical * 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffffffff),
                      color,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(
                    SizeConfig.safeBlockVertical * 40,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 20,
                  right: SizeConfig.safeBlockVertical * 10,
                  left: SizeConfig.safeBlockHorizontal * 5,
                ),
                child: SvgPicture.asset(
                  image,
                  height: SizeConfig.safeBlockVertical * 250,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: SizeConfig.safeBlockVertical * 20,
                  right: SizeConfig.safeBlockHorizontal * 15,
                  left: SizeConfig.safeBlockHorizontal * 20,
                ),
                width: SizeConfig.safeBlockHorizontal * 190,
                //color: Colors.red,

                child: Text(
                  name,
                  style: GoogleFonts.muli(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size != null
                        ? SizeConfig.safeBlockHorizontal * 33
                        : SizeConfig.safeBlockHorizontal * 40,
                    shadows: [
                      Shadow(
                        color: Color(0xff000000).withOpacity(0.16),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
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

// Center(
//               child: RaisedButton(
//                 onPressed: () {
// providerCounter.setCounter(0);
// providerSearch.setFilterList([]);
// providerSearch.setList([]);
// Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (context) {
//       return ProductSearch();
//     },
//   ),
// );
//                 },
//                 child: Text("Product"),
//               ),
//             ),

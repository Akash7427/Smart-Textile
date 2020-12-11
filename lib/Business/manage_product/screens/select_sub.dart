import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_apperal.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_dress.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_ethincwear.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_fabric.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_kurti.dart';
import 'package:smarttextile/Business/manage_product/screens/second_category_saree.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class SubCategory extends StatefulWidget {
  final Product product;
  final List<dynamic> productlist;

  const SubCategory({Key key, this.product, this.productlist})
      : super(key: key);
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
              child: GreyHeader(name: widget.product.category),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 80.0, right: 12.0),
              child: ListView.builder(
                itemCount: widget.productlist.length,
                itemBuilder: (context, i) {
                  if (true) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          widget.product != null
                              ? widget.product.category != "Saree"
                                  ? widget.product.category != "Kurti"
                                      ? widget.product.category != "Fabric"
                                          ? widget.product.category != "Dress"
                                              ? widget.product.category !=
                                                      "EthincWear"
                                                  ? widget.product.category !=
                                                          "ApperalAndGarments"
                                                      ? Text("No Match Found")
                                                      : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SecondCategoryApperal(
                                                                    product: widget
                                                                        .product,
                                                                    product1:
                                                                        widget.productlist[
                                                                            i],
                                                                  )))
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SecondCategoryEthinc(
                                                                product: widget
                                                                    .product,
                                                                product1: widget
                                                                    .productlist[i],
                                                              )))
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SecondCategoryDress(
                                                            product:
                                                                widget.product,
                                                            product1: widget
                                                                .productlist[i],
                                                          )))
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SecondCategoryFabric(
                                                        product: widget.product,
                                                        product1: widget
                                                            .productlist[i],
                                                      )))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondCategoryKurti(
                                                    product: widget.product,
                                                    product1:
                                                        widget.productlist[i],
                                                  )))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SecondCategorySaree(
                                                product: widget.product,
                                                product1: widget.productlist[i],
                                              )))
                              : print("Null");
                        },
                        child: Container(
                          width: SizeConfig.safeBlockVertical * 310,
                          height: SizeConfig.safeBlockHorizontal * 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width: SizeConfig.safeBlockVertical * 90,
                                    height: SizeConfig.safeBlockHorizontal * 80,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffEA7133),
                                          ),
                                        ]),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      widget.productlist[i],
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w800),
                                    ),
                                    subtitle: Text(
                                      widget.product.category,
                                      style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  14,
                                          fontFamily: "Segoe UI",
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Radial()
          ],
        ),
      ),
    );
  }
}

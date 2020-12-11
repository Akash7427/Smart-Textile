import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/get_list.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/select_sub.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class Category extends StatefulWidget {
  Product product;

  Category({this.product});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    GreyHeader(
                      name: "Category and Specification",
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Category Search",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.product.category != null
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
                                                                SubCategory(
                                                                  product: widget
                                                                      .product,
                                                                  productlist:
                                                                      GetList()
                                                                          .getApperalAndGarmentsSubCategoryList(),
                                                                )))
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => SubCategory(
                                                            product:
                                                                widget.product,
                                                            productlist: GetList()
                                                                .getEthincWearSubCategoryList())))
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => SubCategory(
                                                        product: widget.product,
                                                        productlist: GetList()
                                                            .getDressSubCategoryList())))
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SubCategory(
                                                    product: widget.product,
                                                    productlist: GetList()
                                                        .getFabricsSubCategoryList())))
                                    : Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(product: widget.product, productlist: GetList().getKurtiSubCategoryList())))
                                : Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategory(product: widget.product, productlist: GetList().getSareeSubCategoryList())))
                            : print("Null");
                      },
                      child: Container(
                        width: SizeConfig.safeBlockVertical * 310,
                        height: SizeConfig.safeBlockHorizontal * 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, top: 12),
                          child: Text(
                            "Search Category",
                            style: TextStyle(
                                color: Color(0xff646464),
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Specification",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal * 15,
                    ),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 0.2,
                      width: SizeConfig.safeBlockVertical * 380,
                      color: Color(0xff707070),
                    ),
                  ],
                )
              ],
            ),
            Radial()
          ],
        ),
      ),
    );
  }
}

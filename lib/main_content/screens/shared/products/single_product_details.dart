import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/main_content/components/grey_header.dart';
import 'package:smarttextile/main_content/screens/shared/products/shopping_cart.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleProductDetails extends StatefulWidget {
  final Product product;
  SingleProductDetails({@required this.product});
  @override
  _SingleProductDetailsState createState() => _SingleProductDetailsState();
}

class _SingleProductDetailsState extends State<SingleProductDetails> {
  int _currentPage = 0;
  List _images = List();
  @override
  void initState() {
    if (widget.product.primaryImg != null) {
      _images.add(widget.product.primaryImg);
      if (widget.product.secondaryImg.length != 0) {
        _images.addAll(widget.product.secondaryImg);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 10,
                            width: double.maxFinite,
                          ),
                          GreyHeader(
                            name: widget.product.name,
                            color: Color(0xffebebeb),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 15,
                            width: double.maxFinite,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * 260,
                            child: _images.length != 0
                                ? CarouselSlider(
                                    items: _images.map((image) {
                                      return Builder(
                                          builder: (BuildContext context) {
                                        return Container(
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  200,
                                          margin: EdgeInsets.symmetric(
                                            horizontal:
                                                SizeConfig.safeBlockHorizontal *
                                                    15,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              SizeConfig.safeBlockVertical * 15,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.16),
                                                offset: Offset(0, 3),
                                                blurRadius: 5,
                                              ),
                                            ],
                                            image: DecorationImage(
                                              image: NetworkImage(image),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      });
                                    }).toList(),
                                    options: CarouselOptions(
                                        height:
                                            SizeConfig.safeBlockVertical * 245,
                                        aspectRatio: 3 / 2,
                                        enlargeCenterPage: true,
                                        onPageChanged: (i, reason) {
                                          setState(() {
                                            _currentPage = i;
                                          });
                                        }),
                                  )
                                : SvgPicture.asset(
                                    "assets/images/svg/empty.svg",
                                    width: SizeConfig.safeBlockHorizontal * 270,
                                  ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 4,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: SizeConfig.safeBlockVertical * 3,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _images.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: index == _currentPage
                                        ? SizeConfig.safeBlockHorizontal * 20
                                        : SizeConfig.safeBlockHorizontal * 8,
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 2,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: index == _currentPage
                                          ? Colors.black
                                          : Color(0xff707070),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.safeBlockVertical * 3),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                            width: double.maxFinite,
                          ),
                          SmoothStarRating(
                            size: SizeConfig.safeBlockVertical * 25,
                            color: Color(0xffFFEB37),
                            allowHalfRating: true,
                            rating: 4.5,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                          ),
                          Row(
                            children: <Widget>[
                              Spacer(),
                              Container(
                                height: SizeConfig.safeBlockVertical * 35,
                                width: SizeConfig.safeBlockHorizontal * 155,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    SizeConfig.safeBlockVertical * 20,
                                  ),
                                  border: Border.all(
                                    color: Color(0xff008B95),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      "Review",
                                      style: TextStyle(
                                        fontFamily: "Segoe UI",
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  providerUser
                                      .setFavouriteProducts(widget.product.id);
                                },
                                child: Container(
                                  height: SizeConfig.safeBlockVertical * 35,
                                  width: SizeConfig.safeBlockHorizontal * 155,
                                  decoration: BoxDecoration(
                                    color:
                                        providerUser.favouriteProducts != null
                                            ? providerUser.favouriteProducts
                                                    .contains(widget.product.id)
                                                ? Color(0xffFF7171)
                                                : Colors.white
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      SizeConfig.safeBlockVertical * 20,
                                    ),
                                    border: Border.all(
                                      color: providerUser.favouriteProducts !=
                                              null
                                          ? providerUser.favouriteProducts
                                                  .contains(widget.product.id)
                                              ? Color(0xffFF7171)
                                              : Color(0xffFF0000)
                                          : Color(0xffFF0000),
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        "Add to Favorite",
                                        style: TextStyle(
                                          fontFamily: "Segoe UI",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 7,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 18,
                              bottom: SizeConfig.safeBlockVertical * 3,
                              right: SizeConfig.safeBlockHorizontal * 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Category : ",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product.category,
                                        style: TextStyle(
                                          fontFamily: "Segoe UI L",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 18,
                              bottom: SizeConfig.safeBlockVertical * 3,
                              right: SizeConfig.safeBlockHorizontal * 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Sub-Category : ",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product.subCategory,
                                        style: TextStyle(
                                          fontFamily: "Segoe UI L",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 18,
                              bottom: SizeConfig.safeBlockVertical * 3,
                              right: SizeConfig.safeBlockHorizontal * 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Seller Name : ",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product.sellerName,
                                        style: TextStyle(
                                          fontFamily: "Segoe UI L",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 18,
                              bottom: SizeConfig.safeBlockVertical * 3,
                              right: SizeConfig.safeBlockHorizontal * 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Seller Address : ",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product.sellerAddress,
                                        style: TextStyle(
                                          fontFamily: "Segoe UI L",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 18,
                              bottom: SizeConfig.safeBlockVertical * 3,
                              right: SizeConfig.safeBlockHorizontal * 5,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                text: TextSpan(
                                    text: "Colours : ",
                                    style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 18,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.product.colour.join(", "),
                                        style: TextStyle(
                                          fontFamily: "Segoe UI L",
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          widget.product.size.length != 0
                              ? Padding(
                                  padding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 18,
                                    bottom: SizeConfig.safeBlockVertical * 3,
                                    right: SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Size : ",
                                          style: TextStyle(
                                            fontFamily: "Segoe UI",
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    18,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: widget.product.size
                                                  .join(", "),
                                              style: TextStyle(
                                                fontFamily: "Segoe UI L",
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal *
                                                    17,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 105,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.safeBlockHorizontal * 10,
                ),
                height: SizeConfig.blockSizeVertical * 100,
                width: SizeConfig.safeBlockHorizontal * 165,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight:
                        Radius.circular(SizeConfig.blockSizeVertical * 100),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff00FF00).withOpacity(0.4),
                      blurRadius: 6,
                      offset: Offset(6, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      child: Text(
                        "M.R.P",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 30,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "${widget.product.sp * widget.product.minOrder}/${widget.product.minOrder} ${widget.product.unitType}",
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 20,
                          fontFamily: "Segoe UI L",
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: SizeConfig.safeBlockVertical * 38,
                      width: SizeConfig.safeBlockHorizontal * 150,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            SizeConfig.safeBlockVertical * 25,
                          ),
                          bottomLeft: Radius.circular(
                            SizeConfig.safeBlockVertical * 25,
                          ),
                        ),
                        border: Border.all(
                          color: Color(0xffFFF56E),
                          width: SizeConfig.safeBlockVertical * 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Negotiate",
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 16,
                            fontFamily: "Segoe UI",
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ShoppingCart(
                            product: widget.product,
                          );
                        }));
                      },
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 38,
                        width: SizeConfig.safeBlockHorizontal * 150,
                        decoration: BoxDecoration(
                          color: Color(0xffFFD500),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              SizeConfig.safeBlockVertical * 25,
                            ),
                            bottomLeft: Radius.circular(
                              SizeConfig.safeBlockVertical * 25,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset: Offset(
                                0,
                                SizeConfig.safeBlockVertical * 2,
                              ),
                              blurRadius: SizeConfig.safeBlockVertical * 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 16,
                              fontFamily: "Segoe UI",
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

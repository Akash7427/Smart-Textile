import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/main_content/screens/shared/products/delivery_information.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/shared/size_config.dart';

class ShoppingCart extends StatefulWidget {
  final Product product;
  ShoppingCart({@required this.product});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  TextEditingController _quantity = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantity.text = widget.product.minOrder.toString();
    _subtotal = widget.product.minOrder * widget.product.sp;
  }

  Order _order = Order();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int _subtotal;
  @override
  Widget build(BuildContext context) {
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: SizeConfig.safeBlockVertical * 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    SizeConfig.safeBlockVertical * 50,
                  ),
                  bottomRight: Radius.circular(
                    SizeConfig.safeBlockVertical * 50,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.16),
                    blurRadius: SizeConfig.safeBlockVertical * 4,
                    offset: Offset(0, SizeConfig.safeBlockVertical * 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    iconSize: SizeConfig.safeBlockHorizontal * 18,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  Text(
                    "Shopping Cart",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Segoe UI",
                      color: Colors.black,
                    ),
                  ),
                  Expanded(flex: 4, child: SizedBox()),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 15,
                        ),
                        height: SizeConfig.safeBlockVertical * 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockVertical * 20,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: SizeConfig.safeBlockVertical * 5,
                              offset: Offset(
                                0,
                                SizeConfig.safeBlockVertical * 2.5,
                              ),
                            ),
                          ],
                          color: Colors.white,
                          image: widget.product.primaryImg != null
                              ? DecorationImage(
                                  image:
                                      NetworkImage(widget.product.primaryImg),
                                  fit: BoxFit.fill,
                                )
                              : DecorationImage(
                                  image: AssetImage("assets/images/logo.png"),
                                ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "QTY : ",
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 23,
                              fontFamily: "Segoe UI L",
                            ),
                          ),
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 100,
                            child: Form(
                              key: _formkey,
                              child: TextFormField(
                                controller: _quantity,
                                validator: (val) {
                                  if (int.parse(val) <
                                      widget.product.minOrder) {
                                    return "${widget.product.minOrder} is minimum order";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() {
                                    _subtotal =
                                        int.parse(val) * widget.product.sp;
                                  });
                                },
                                textAlignVertical: TextAlignVertical.bottom,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 20,
                                  fontFamily: "Segoe UI",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 18,
                          bottom: SizeConfig.safeBlockVertical * 3,
                          right: SizeConfig.safeBlockHorizontal * 5,
                          top: SizeConfig.safeBlockVertical * 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Category : ",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.product.category,
                                  style: TextStyle(
                                    fontFamily: "Segoe UI L",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 18,
                          bottom: SizeConfig.safeBlockVertical * 4,
                          right: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Sub-Category : ",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.product.subCategory,
                                  style: TextStyle(
                                    fontFamily: "Segoe UI L",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.safeBlockHorizontal * 18,
                          bottom: SizeConfig.safeBlockVertical * 4,
                          right: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: "Seller Name : ",
                              style: TextStyle(
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 18,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.product.sellerName,
                                  style: TextStyle(
                                    fontFamily: "Segoe UI L",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5,
                              vertical: SizeConfig.safeBlockVertical * 3,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 15,
                            ),
                            height: SizeConfig.safeBlockVertical * 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockVertical * 25,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: SizeConfig.safeBlockVertical * 4,
                                  offset: Offset(
                                      0, SizeConfig.safeBlockVertical * 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 17,
                                  fontFamily: "Segoe UI",
                                  color: Color(0xffFF6A6A),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5,
                              vertical: SizeConfig.safeBlockVertical * 3,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 15,
                            ),
                            height: SizeConfig.safeBlockVertical * 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                SizeConfig.safeBlockVertical * 25,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.16),
                                  blurRadius: SizeConfig.safeBlockVertical * 4,
                                  offset: Offset(
                                      0, SizeConfig.safeBlockVertical * 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "See more like these",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 17,
                                  fontFamily: "Segoe UI",
                                  color: Color(0xff6A92FF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 15,
                        ),
                        width: SizeConfig.safeBlockHorizontal * 300,
                        height: SizeConfig.safeBlockVertical * 100,
                        decoration: BoxDecoration(
                          color: Color(0xffEFEFEF),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              offset:
                                  Offset(0, SizeConfig.safeBlockVertical * 2),
                              blurRadius: SizeConfig.safeBlockVertical * 4,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "SubTotal (1 item): $_subtotal",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 16,
                                  fontFamily: "Segoe UI"),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_formkey.currentState.validate()) {
                                        _order.quantity = _quantity.text;
                                        _order.productUID = widget.product.id;
                                        _order.price = _subtotal.toString();
                                        DateTime now = DateTime.now();
                                        String formattedDate =
                                            DateFormat('kk:mm:ssEEEdMMM')
                                                .format(now);
                                        _order.orderID =
                                            widget.product.uid + formattedDate;
                                        _order.sellerUID = widget.product.uid;
                                        _order.product = widget.product.name;
                                        _order.category =
                                            widget.product.category;
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DeliveryInformation(
                                            order: _order,
                                            providerUser: providerUser,
                                          );
                                        }));
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal * 20,
                                      ),
                                      height: SizeConfig.safeBlockVertical * 35,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFD500),
                                        borderRadius: BorderRadius.circular(
                                          SizeConfig.safeBlockVertical * 25,
                                        ),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 0.2,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Proceed to Buy",
                                          style: TextStyle(
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  17,
                                              fontFamily: "Segoe UI"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

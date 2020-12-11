import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/category.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List<String> _Products = [
    'Saree',
    'Kurti',
    'Fabric',
    'Dress',
    'EthincWear',
    'ApperalAndGarments'
  ]; // Option 2
  String _selectedProduct;
  Product product = Product();
  var _productName = TextEditingController();
  var _mrp = TextEditingController();
  var _sp = TextEditingController();
  var _unitType = TextEditingController();
  var _minOrder = TextEditingController();
  var _cp = TextEditingController();
  var _des = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      GreyHeader(
                        name: "Add Product",
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Product Details",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.safeBlockHorizontal * 15,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Container(
                        width: SizeConfig.safeBlockVertical * 320,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text('Please choose a Product'),
                            value: _selectedProduct,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedProduct = newValue;
                              });
                            },
                            items: _Products.map((product) {
                              return DropdownMenuItem(
                                child: new Text(product),
                                value: product,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFormField(
                          validator: (value) {
                            return value.trim().length >= 3
                                ? null
                                : "Enter a valid Product Name";
                          },
                          controller: _productName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            hintText: "Product Name",
                            hintStyle: TextStyle(
                                color: Color(0xff646464),
                                fontSize: SizeConfig.safeBlockHorizontal * 10,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                            contentPadding: const EdgeInsets.only(left: 10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 12,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 125,
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length > 0
                                    ? null
                                    : "Enter MRP Price";
                              },
                              controller: _mrp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "MRP Price",
                                hintStyle: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 68,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 125,
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length > 0
                                    ? null
                                    : "Enter Sell Price";
                              },
                              controller: _sp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "Sell Price",
                                hintStyle: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 12,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 125,
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length > 0
                                    ? null
                                    : "Enter Unit Type";
                              },
                              controller: _unitType,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "Unit Type",
                                hintStyle: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 68,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 125,
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length > 0
                                    ? null
                                    : "Enter Minimum Order";
                              },
                              controller: _minOrder,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "Min. Order",
                                hintStyle: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 12,
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockVertical * 125,
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length > 0
                                    ? null
                                    : "Enter Cost Price";
                              },
                              controller: _cp,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                hintText: "Cost Price",
                                hintStyle: TextStyle(
                                    color: Color(0xff646464),
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 10,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                    const EdgeInsets.only(left: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Product Description",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500))),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFormField(
                          controller: _des,
                          validator: (value) {
                            return value.trim().length >= 30
                                ? null
                                : "Minimum length of description should be greater than 30";
                          },
                          maxLines: 8,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: "Enter Description",
                            hintStyle: TextStyle(
                                color: Color(0xff646464),
                                fontSize: SizeConfig.safeBlockHorizontal * 10,
                                fontFamily: "Segoe UI",
                                fontWeight: FontWeight.w400),
                            contentPadding:
                                const EdgeInsets.only(left: 15.0, top: 15.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: Container(
                          height: SizeConfig.safeBlockHorizontal * 33,
                          width: SizeConfig.safeBlockVertical * 122,
                          decoration: BoxDecoration(
                              color: Color(0xff00B6C7),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                product.category = _selectedProduct;
                                product.name = _productName.text.trim();
                                product.mrp = int.parse(_mrp.text.trim());
                                product.sp = int.parse(_sp.text.trim());
                                product.unitType = _unitType.text.trim();
                                product.minOrder =
                                    int.parse(_minOrder.text.trim());
                                product.cp = int.parse(_cp.text.trim());
                                product.description = _des.text.trim();
                                print(product.category);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Category(
                                              product: product,
                                            )));
                              }
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.safeBlockHorizontal * 15,
                                  fontFamily: "Segoe UI",
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Radial()
          ],
        ),
      ),
    );
  }
}

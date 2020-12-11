import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/add_image.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class AddInfo extends StatefulWidget {
  final Product product;

  const AddInfo({Key key, this.product}) : super(key: key);

  @override
  _AddInfoState createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  Product product;

  List<String> _bank = ["Cash", "Bank Tranfer", "Card"]; // Option 2
  String _selectedbank;

  var supply = TextEditingController();
  var delivery = TextEditingController();
  var packing = TextEditingController();
  var cityname = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Form(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: GreyHeader(name: "Add Information"),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Product Additional Information",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 15,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Cash,bank tranfer or credit etc",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      width: SizeConfig.safeBlockVertical * 30,
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
                          hint: Text('Payment terms'),
                          value: _selectedbank,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedbank = newValue;
                            });
                          },
                          items: _bank.map((bank) {
                            return DropdownMenuItem(
                              child: new Text(bank),
                              value: bank,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter a Supply Ability",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        return value.trim().length >= 3
                            ? null
                            : "5000 pcs Per day";
                      },
                      controller: supply,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: "Supply Ability",
                        hintStyle: TextStyle(
                            color: Color(0xff646464),
                            fontSize: SizeConfig.safeBlockHorizontal * 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w300),
                        contentPadding: const EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Enter a Delivery Time",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        return value.trim().length >= 3
                            ? null
                            : "24 hours or 3 days";
                      },
                      controller: delivery,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: "Delivery Time",
                        hintStyle: TextStyle(
                            color: Color(0xff646464),
                            fontSize: SizeConfig.safeBlockHorizontal * 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w300),
                        contentPadding: const EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Packing type box,Seal cover pack",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        return value.trim().length >= 3
                            ? null
                            : "Enter a valid Packing Details";
                      },
                      controller: packing,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: "Packing Details",
                        hintStyle: TextStyle(
                            color: Color(0xff646464),
                            fontSize: SizeConfig.safeBlockHorizontal * 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w300),
                        contentPadding: const EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "eg.City name",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 10,
                              fontFamily: "Segoe UI",
                              fontWeight: FontWeight.w300),
                        )),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        return value.trim().length >= 3
                            ? null
                            : "Enter a valid City Name";
                      },
                      controller: cityname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        hintText: "City Name",
                        hintStyle: TextStyle(
                            color: Color(0xff646464),
                            fontSize: SizeConfig.safeBlockHorizontal * 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w300),
                        contentPadding: const EdgeInsets.only(left: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120, right: 120),
                    child: Container(
                      height: SizeConfig.safeBlockHorizontal * 40,
                      decoration: BoxDecoration(
                          color: Color(0xff00B6C7),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          product.paymentOptions = _selectedbank;
                          product.supply = supply.text.trim();
                          product.deliveryTime = delivery.text.trim();
                          product.packagingDetails = packing.text.trim();
                          product.dispatchLoc = cityname.text.trim();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddImage(
                                        product: product,
                                      )));
                        },
                        child: Text(
                          "Save and Next",
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
            Radial()
          ],
        ),
      ),
    );
  }
}

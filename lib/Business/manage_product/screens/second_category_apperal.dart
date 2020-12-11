import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/screens/add_information.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';

import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class SecondCategoryApperal extends StatefulWidget {
  final Product product;
  final String product1;
  SecondCategoryApperal({this.product1, this.product});
  @override
  _SecondCategoryApperalState createState() => _SecondCategoryApperalState();
}

class _SecondCategoryApperalState extends State<SecondCategoryApperal> {
  Product product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  List<String> _selectedPattern = List();

  //fabric
  int _value1 = 0;
  String _fabric = "";
  //brand
  int _value2 = 0;
  String brand = "";
  //sample
  int _value5 = 0;
  String sample = "";
  //fabric
  void _setvalue1(int value, String name) => setState(() {
        _value1 = value;
        _fabric = name;
      });
  void _setvalue2(int value, String name) => setState(() {
        _value2 = value;
        brand = name;
      });
  void _setvalue5(int value, String name) => setState(() {
        _value5 = value;
        sample = name;
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: GreyHeader(
                    name: "Category and Specification",
                  ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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
                        widget.product1,
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
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Fabric",
                      style: TextStyle(
                          color: Color(0xff002358),
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Cotton");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Cotton",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Linen");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Linen",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 3,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Cotton Blend");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Cotton Blend",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 4,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Polyester");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Polyester",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 5,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Satin");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Satin",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Radio(
                                value: 6,
                                groupValue: _value1,
                                onChanged: (int value) {
                                  _setvalue1(value, "Poplin");
                                },
                                activeColor: Color(0xff66CCCC),
                              ),
                              Text(
                                "Poplin",
                                style: TextStyle(
                                    color: Color(0xff002358),
                                    fontFamily: "Segoe UI",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 7,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Twill");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Twill",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 8,
                              groupValue: _value1,
                              onChanged: (int value) {
                                _setvalue1(value, "Other");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Other",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Container(
                  height: SizeConfig.safeBlockHorizontal * 0.2,
                  width: SizeConfig.safeBlockVertical * 380,
                  color: Color(0xff707070),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Brand",
                      style: TextStyle(
                          color: Color(0xff002358),
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Raymond");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Raymond",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Vimal");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Vimal",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 3,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Siyaram");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Siyaram",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 4,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Gwalior");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Gwalior",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 5,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Grasim");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Grasim",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 6,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Other");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Other",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Container(
                  height: SizeConfig.safeBlockHorizontal * 0.2,
                  width: SizeConfig.safeBlockVertical * 380,
                  color: Color(0xff707070),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pattern",
                      style: TextStyle(
                          color: Color(0xff002358),
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedPattern.contains("Plain"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedPattern.add("Plain");
                            } else {
                              _selectedPattern.remove("Plain");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Plain',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.yellow,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedPattern.contains("Printed"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedPattern.add("Printed");
                            } else {
                              _selectedPattern.remove("Printed");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Printed',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.indigo,
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedPattern.contains("Embroidery"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedPattern.add("Embroidery");
                            } else {
                              _selectedPattern.remove("Embroidery");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Embroidery',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.cyan,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedPattern.contains("Digital Printed"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedPattern.add("Digital Printed");
                            } else {
                              _selectedPattern.remove("Digital Printed");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Digital Printed',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.cyan,
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
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedPattern.contains("Other"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedPattern.add("Other");
                            } else {
                              _selectedPattern.remove("Other");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Other',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Container(
                  height: SizeConfig.safeBlockHorizontal * 0.2,
                  width: SizeConfig.safeBlockVertical * 380,
                  color: Color(0xff707070),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Do you fulfill sample order?",
                      style: TextStyle(
                          color: Color(0xff002358),
                          fontSize: SizeConfig.safeBlockHorizontal * 15,
                          fontFamily: "Segoe UI",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: _value5,
                              onChanged: (int value) {
                                _setvalue5(value, "Yes");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Yes",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: _value5,
                              onChanged: (int value) {
                                _setvalue5(value, "No");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                  color: Color(0xff002358),
                                  fontFamily: "Segoe UI",
                                  fontSize: SizeConfig.safeBlockHorizontal * 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 120, right: 120, bottom: 20, top: 20),
                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 40,
                    decoration: BoxDecoration(
                        color: Color(0xff00B6C7),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        product.fabric = _fabric;
                        product.brand = brand;
                        product.pattern = _selectedPattern;
                        product.sampleOrder = sample;
                        product.subCategory = widget.product1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddInfo(
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
            Radial()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/add_information.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class SecondCategoryFabric extends StatefulWidget {
  final Product product;
  final String product1;
  SecondCategoryFabric({this.product1, this.product});
  @override
  _SecondCategoryFabricState createState() => _SecondCategoryFabricState();
}

class _SecondCategoryFabricState extends State<SecondCategoryFabric> {
  Product product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  List<String> _selectedPattern = List();

  //Width
  int _value1 = 0;
  String width = "";
  //Use
  int _value2 = 0;
  String use = "";
  //material
  int _value3 = 0;
  String material = "";
  //sample
  int _value5 = 0;
  String sample = "";

  //Width
  void _setvalue1(int value, String name) => setState(() {
        _value1 = value;
        width = name;
      });
  //Use
  void _setvalue2(int value, String name) => setState(() {
        _value2 = value;
        use = name;
      });
  //material
  void _setvalue3(int value, String name) => setState(() {
        _value3 = value;
        material = name;
      });
  //sample
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
                      "Width",
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
                                _setvalue1(value, "35-36");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "35-36",
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
                                _setvalue1(value, "45-46");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "44-45",
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
                                _setvalue1(value, "58-60");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "58-60",
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
                                _setvalue1(value, "72");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "72",
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
                                _setvalue1(value, "108");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "108",
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
                                  _setvalue1(value, "Other");
                                },
                                activeColor: Color(0xff66CCCC),
                              ),
                              Text(
                                "Other",
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
                      "Material",
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
                              groupValue: _value3,
                              onChanged: (int value) {
                                _setvalue3(value, "Chiffon");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Chiffon",
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
                              groupValue: _value3,
                              onChanged: (int value) {
                                _setvalue3(value, "Cotton");
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
                              groupValue: _value3,
                              onChanged: (int value) {
                                _setvalue3(value, "Chanderi");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Chanderi",
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
                              groupValue: _value3,
                              onChanged: (int value) {
                                _setvalue1(value, "Brocade");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Brocade",
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
                              groupValue: _value3,
                              onChanged: (int value) {
                                _setvalue1(value, "Silk");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Silk",
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
                                groupValue: _value3,
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
                      "Use",
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
                                _setvalue2(value, "Saree");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Saree",
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
                                _setvalue2(value, "Sherwani");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Sherwani",
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
                                _setvalue2(value, "Suit");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Suit",
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
                                _setvalue2(value, "Kurti");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Kurti",
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
                      ),
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
                        product.width = width;
                        product.material = material;
                        product.sampleOrder = sample;
                        product.use = use;
                        product.pattern = _selectedPattern;
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

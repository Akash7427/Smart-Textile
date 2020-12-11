import 'package:flutter/material.dart';
import 'package:smarttextile/Business/manage_product/product.dart';
import 'package:smarttextile/Business/manage_product/screens/add_information.dart';
import 'package:smarttextile/Business/manage_product/screens/grey_header.dart';
import 'package:smarttextile/Business/manage_product/screens/size_config.dart';
import 'package:smarttextile/main_content/components/radial.dart';

class SecondCategoryDress extends StatefulWidget {
  final Product product;
  final String product1;
  SecondCategoryDress({this.product1, this.product});
  @override
  _SecondCategoryDressState createState() => _SecondCategoryDressState();
}

class _SecondCategoryDressState extends State<SecondCategoryDress> {
  Product product;
  List<String> _selectedOcaasion = List();
  List<String> _selectedColour = List();
  List<String> _selectedPattern = List();
  List<String> _selectedSize = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  //fabric
  int _value2 = 0;
  String _fabric = "";
  //Stitched
  int _value3 = 0;
  String stitched = "";
  //work
  int _value4 = 0;
  String work = "";
  //sample
  int _value5 = 0;
  String sample = "";

  //fabric
  void _setvalue2(int value, String name) => setState(() {
        _value2 = value;
        _fabric = name;
      });
  //stitched
  void _setvalue3(int value, String name) => setState(() {
        _value3 = value;
        stitched = name;
      });
  //work
  void _setvalue4(int value, String name) => setState(() {
        _value4 = value;
        work = name;
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
                      "Occasion",
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
                          value: _selectedOcaasion.contains("Casual Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Casual Wear");
                            } else {
                              _selectedOcaasion.remove("Casual Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Casual Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedOcaasion.contains("Formal Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Formal Wear");
                            } else {
                              _selectedOcaasion.remove("Formal Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Formal Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedOcaasion.contains("Party Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Party Wear");
                            } else {
                              _selectedOcaasion.remove("Party Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Party Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedOcaasion.contains("Wedding Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Wedding Wear");
                            } else {
                              _selectedOcaasion.remove("Wedding Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Wedding Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedOcaasion.contains("Festival Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Festival Wear");
                            } else {
                              _selectedOcaasion.remove("Festival Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Festival Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedOcaasion.contains("Regular Wear"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Regular Wear");
                            } else {
                              _selectedOcaasion.remove("Regular Wear");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Regular Wear',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedOcaasion.contains("Other"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedOcaasion.add("Other");
                            } else {
                              _selectedOcaasion.remove("Other");
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
                          activeColor: Color(0xff66CCCC),
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
                      "Size",
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
                          value: _selectedSize.contains("Small (S)"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Small (S)");
                            } else {
                              _selectedSize.remove("Small (S)");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Small (S)',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedSize.contains("Medium (M)"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Medium (M)");
                            } else {
                              _selectedSize.remove("Medium (M)");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Medium (M)',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedSize.contains("Large (L)"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Large (L)");
                            } else {
                              _selectedSize.remove("Large (L)");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Large (L)',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedSize.contains("XL"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("XL");
                            } else {
                              _selectedSize.remove("XL");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'XL',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedSize.contains("XXL"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("XXL");
                            } else {
                              _selectedSize.remove("XXL");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'XXL',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedSize.contains("Free Size"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Free Size");
                            } else {
                              _selectedSize.remove("Free Size");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Free Size',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedSize.contains("All Size"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("All Size");
                            } else {
                              _selectedSize.remove("All Size");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'All Size',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedSize.contains("Regular"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Regular");
                            } else {
                              _selectedSize.remove("Regular");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Regular',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
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
                          value: _selectedSize.contains("Other"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedSize.add("Other");
                            } else {
                              _selectedSize.remove("Other");
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
                          activeColor: Color(0xff66CCCC),
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
                      "Colour",
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
                          value: _selectedColour.contains("Red"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Red");
                            } else {
                              _selectedColour.remove("Red");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Red',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xff66CCCC),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedColour.contains("Black"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Black");
                            } else {
                              _selectedColour.remove("Black");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Black',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
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
                          value: _selectedColour.contains("Blue"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Blue");
                            } else {
                              _selectedColour.remove("Blue");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Blue',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedColour.contains("Brown"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Brown");
                            } else {
                              _selectedColour.remove("Brown");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Brown',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.brown,
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
                          value: _selectedColour.contains("Green"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Green");
                            } else {
                              _selectedColour.remove("Green");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Green',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.green,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedColour.contains("Orange"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Orange");
                            } else {
                              _selectedColour.remove("Orange");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Orange',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.orange,
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
                          value: _selectedColour.contains("Pink"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Pink");
                            } else {
                              _selectedColour.remove("Pink");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Pink',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.pink,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: new CheckboxListTile(
                          value: _selectedColour.contains("White"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("White");
                            } else {
                              _selectedColour.remove("White");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'White',
                            style: TextStyle(
                                color: Color(0xff002358),
                                fontFamily: "Segoe UI",
                                fontSize: SizeConfig.safeBlockHorizontal * 12,
                                fontWeight: FontWeight.w400),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.black,
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
                          value: _selectedColour.contains("Yellow"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Yellow");
                            } else {
                              _selectedColour.remove("Yellow");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Yellow',
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
                          value: _selectedColour.contains("Navy Blue"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Navy Blue");
                            } else {
                              _selectedColour.remove("Navy Blue");
                            }
                            setState(() {});
                          },
                          title: Text(
                            'Navy Blue',
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
                          value: _selectedColour.contains("Multi Colour"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Multi Colour");
                            } else {
                              _selectedColour.remove("Multi Colour");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Multi Colour',
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
                          value: _selectedColour.contains("Mic Colour"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Mic Colour");
                            } else {
                              _selectedColour.remove("Mic Colour");
                            }
                            setState(() {});
                          },
                          title: new Text(
                            'Mix Colour',
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
                          value: _selectedColour.contains("Other"),
                          onChanged: (bool s) {
                            if (s) {
                              _selectedColour.add("Other");
                            } else {
                              _selectedColour.remove("Other");
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
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Cotton");
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
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Silk");
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
                                _setvalue2(value, "Chiffon");
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
                              value: 4,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Net");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Net",
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
                                _setvalue2(value, "Georgette");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Georgette",
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
                                _setvalue2(value, "Synthetic");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Synthetic",
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
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Welvet");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Welvet",
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
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Satin");
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
                              value: 9,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Rayon");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Rayon",
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
                              value: 10,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Crepe");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Crepe",
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 11,
                              groupValue: _value2,
                              onChanged: (int value) {
                                _setvalue2(value, "Wollen");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Wollen",
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
                              value: 12,
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
                      "Work",
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
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Embroidery Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Embroidery Work",
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
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Mirror Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Mirror Work",
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 3,
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Kundan Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Kundan Work",
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
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Zardosi Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Zardosi Work",
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 5,
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Dubka Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Dubka Work",
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
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Gota Work");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Gota Work",
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
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Radio(
                              value: 7,
                              groupValue: _value4,
                              onChanged: (int value) {
                                _setvalue4(value, "Other");
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
                      "Stitched Type",
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
                                _setvalue3(value, "Stitched");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Stitched",
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
                                _setvalue3(value, "Semi Stitched");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Semi Stitched",
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
                                _setvalue3(value, "Unstitched");
                              },
                              activeColor: Color(0xff66CCCC),
                            ),
                            Text(
                              "Unstitched",
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
                        product.occassion = _selectedOcaasion;
                        product.size = _selectedSize;
                        product.colour = _selectedColour;
                        product.pattern = _selectedPattern;
                        product.fabric = _fabric;
                        product.sampleOrder = sample;
                        product.stichedType = stitched;
                        product.work = work;
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

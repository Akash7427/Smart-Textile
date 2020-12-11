import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/Business/Invoice/api_service.dart';
import 'package:smarttextile/Business/Invoice/driver.dart';
import 'package:smarttextile/Business/Invoice/grey_header.dart';
import 'package:smarttextile/Business/Invoice/size_config.dart';
import 'package:smarttextile/Business/Invoice/transpoter_list.dart';
import 'package:smarttextile/Transporter/screens/transporter_home_page.dart';
import 'package:smarttextile/shared/provider_user.dart';
import 'package:smarttextile/main_content/components/radial.dart';
class TransporterDriverDtls extends StatefulWidget {
  @override
  _TransporterDriverDtlsState createState() => _TransporterDriverDtlsState();
}

class _TransporterDriverDtlsState extends State<TransporterDriverDtls> {
  List<String> _smart = ['Yes', 'No']; // Option 2
  String _selectedsmart;
  var _name = TextEditingController();
  var _mobileno = TextEditingController();
  var _vehicleno = TextEditingController();
  var _username = TextEditingController();
  var _password = TextEditingController();
  Driver _driver = Driver();
  List<String> list = List();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ProviderUser providerUser = Provider.of<ProviderUser>(context);
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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 12,
                      vertical: SizeConfig.safeBlockVertical * 10),
                  child: GreyHeader(name: "Driver Details"),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 12.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Driver have smartphone or not :",
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 12,
                      vertical: SizeConfig.safeBlockVertical * 10),
                  child: Container(
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
                        hint: Text('Please choose'),
                        value: _selectedsmart,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedsmart = newValue;
                          });
                        },
                        items: _smart.map((product) {
                          return DropdownMenuItem(
                            child: new Text(product),
                            value: product,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                _selectedsmart == "Yes"
                    ? Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Textfield(
                            name: _name,
                            textname: "Enter Name",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Mobile No.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Textfield(
                            name: _mobileno,
                            textname: "Enter Mobile No.",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Vehicle No.",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Textfield(
                            name: _vehicleno,
                            textname: "Enter Vehicle No.",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Username",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Textfield(
                            name: _username,
                            textname: "Enter Username",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.safeBlockHorizontal * 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15,
                                    fontFamily: "Segoe UI",
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Textfield(
                            name: _password,
                            textname: "Enter Password",
                          ),
                          Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              color: Color(0xff62B9BF),
                              onPressed: () async {
                                _driver.username=_username.text.trim();
                                _driver.password=_password.text.trim();
                                _driver.phoneNo=_mobileno.text.trim();
                                _driver.name=_name.text.trim();
                                _driver.vehicleNo=_vehicleno.text.trim();
                                _driver.email=providerUser.email;
                                list.add(providerUser.uid);
                                _driver.userId = list;

                                String formattedDate = DateFormat('kk:mm:ssEEEdMMM').format(DateTime.now());
                                String id =providerUser.uid+formattedDate;
                                await ApiService().uploadDriver(_driver, id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TransporterHomePage()));
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    Key key,
    @required TextEditingController name,
    this.textname,
  })  : _name = name,
        super(key: key);

  final TextEditingController _name;
  final String textname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeBlockHorizontal * 12,
          vertical: SizeConfig.safeBlockVertical * 5),
      child: TextFormField(
        validator: (value) {
          return value.trim().length > 0 ? null : "Enter Name";
        },
        controller: _name,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          hintText: textname,
          hintStyle: TextStyle(
              color: Color(0xff646464),
              fontSize: SizeConfig.safeBlockHorizontal * 10,
              fontFamily: "Segoe UI",
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(left: 10.0),
        ),
      ),
    );
  }
}

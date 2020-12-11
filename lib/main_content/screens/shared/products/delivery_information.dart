import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smarttextile/Business/Main/order.dart';
import 'package:smarttextile/Chat/resources/auth_methods.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/login/services/api_service.dart';
import 'package:smarttextile/login/shared/constants.dart';
import 'package:smarttextile/main_content/services/api_orders.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

class DeliveryInformation extends StatefulWidget {
  final ProviderUser providerUser;
  final Order order;
  DeliveryInformation({@required this.order, @required this.providerUser});
  @override
  _DeliveryInformationState createState() => _DeliveryInformationState();
}

class _DeliveryInformationState extends State<DeliveryInformation> {
  var _name = TextEditingController();
  var _companyName = TextEditingController();
  var _address = TextEditingController();
  var _city = TextEditingController();
  var _state = TextEditingController();
  var _pincode = TextEditingController();
  var _country = TextEditingController();
  String _selectedPaymentMethod;
  bool _loadingVisible = false;
  List<String> _paymentMethod = [
    "Cheque",
    "Cash",
    "Card",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.text = widget.providerUser.name;
    _companyName.text = widget.providerUser.companyName;
    _address.text = widget.providerUser.address;
    _city.text = widget.providerUser.city;
    _state.text = widget.providerUser.state;
    _pincode.text = widget.providerUser.pincode;
    _country.text = "India";
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
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
                          "Delivery Information",
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
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 25,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12,
                              ),
                              child: TextFormField(
                                controller: _name,
                                validator: (value) {
                                  return value.trim().length == 0
                                      ? "Enter Your Name"
                                      : null;
                                },
                                textCapitalization: TextCapitalization.words,
                                decoration: kTextField.copyWith(
                                  hintText: "NAME",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.accessibility,
                                      color: Color(0xff828282),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12,
                              ),
                              child: TextFormField(
                                controller: _companyName,
                                validator: (value) {
                                  return value.trim().length == 0
                                      ? "Enter Your Company Name"
                                      : null;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                decoration: kTextField.copyWith(
                                  hintText: "COMPANY NAME",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Icon(
                                      Icons.account_balance,
                                      color: Color(0xff828282),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12,
                              ),
                              child: TextFormField(
                                controller: _address,
                                validator: (value) {
                                  return value.trim().length == 0
                                      ? "Enter Your Company Address"
                                      : null;
                                },
                                textCapitalization:
                                    TextCapitalization.sentences,
                                maxLines: 5,
                                decoration: kTextField.copyWith(
                                  hintText: "ADDRESS",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 78),
                                      child: Icon(
                                        Icons.home,
                                        color: Color(0xff828282),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller: _pincode,
                                      validator: (value) {
                                        return value.trim().length != 6
                                            ? "Enter Valid Pincode"
                                            : null;
                                      },
                                      onChanged: (value) async {},
                                      keyboardType: TextInputType.number,
                                      decoration: kTextField.copyWith(
                                        hintText: "PINCODE",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.radio_button_checked,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _country,
                                      validator: (value) {
                                        return value.trim().length == 0
                                            ? "Enter Your Country Name"
                                            : null;
                                      },
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: kTextField.copyWith(
                                        hintText: "Country",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 12,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: TextFormField(
                                      controller: _city,
                                      validator: (value) {
                                        return value.trim().length == 0
                                            ? "Enter Your City Name"
                                            : null;
                                      },
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: kTextField.copyWith(
                                        hintText: "CITY",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_city,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.safeBlockHorizontal * 10,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _state,
                                      validator: (value) {
                                        return value.trim().length == 0
                                            ? "Enter Your State Name"
                                            : null;
                                      },
                                      textCapitalization:
                                          TextCapitalization.words,
                                      decoration: kTextField.copyWith(
                                        hintText: "State",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_searching,
                                            color: Color(0xff828282),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 3,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 35,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Payment method"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                                vertical: SizeConfig.safeBlockVertical * 4,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Color(0xff707070), width: 0.4),
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockVertical * 25,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Text("Choose Payment Method"),
                                  isExpanded: true,
                                  items: _paymentMethod.map((String category) {
                                    return DropdownMenuItem<String>(
                                        value: category, child: Text(category));
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      this._selectedPaymentMethod = newValue;
                                    });
                                  },
                                  value: _selectedPaymentMethod,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    _name.text = "";
                                    _companyName.text = "";
                                    _address.text = "";
                                    _city.text = "";
                                    _state.text = "";
                                    _pincode.text = "";
                                    _country.text = "";
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 3,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 15,
                                    ),
                                    height: SizeConfig.safeBlockVertical * 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFF6767),
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockVertical * 25,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Reset",
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          fontFamily: "Segoe UI",
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState.validate()) {
                                      print("ddd");
                                      setState(() {
                                        _loadingVisible = true;
                                      });
                                      User _user = await AuthMethods()
                                          .getUserDetailsById(
                                              widget.order.sellerUID);
                                      print(widget.order.sellerUID);
                                      widget.order.sellerAddress =
                                          _user.address;
                                      widget.order.sellerCity = _user.city;
                                      widget.order.sellerGST = _user.gstNum;
                                      widget.order.sellerName =
                                          _user.companyName;
                                      widget.order.sellerPhoneNo =
                                          _user.phoneNo;
                                      widget.order.sellerPincode =
                                          _user.pincode;
                                      widget.order.sellerState = _user.state;
                                      widget.order.buyerAddress = _address.text;
                                      widget.order.buyerCity = _city.text;
                                      widget.order.buyerGST =
                                          widget.providerUser.gstNum;
                                      widget.order.buyerName =
                                          _companyName.text;
                                      widget.order.buyerPhoneNo =
                                          widget.providerUser.phoneNo;
                                      widget.order.buyerPincode = _pincode.text;
                                      widget.order.buyerState = _state.text;
                                      widget.order.buyerUID =
                                          widget.providerUser.uid;
                                      List deviceToken = List();
                                      deviceToken.add(_user.deviceToken);
                                      await ApiOrder().createOrder(
                                          widget.order, deviceToken);
                                      setState(() {
                                        _loadingVisible = false;
                                      });
                                      FlutterToast.showToast(
                                          msg: "Order Placed Succesfully");
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      vertical:
                                          SizeConfig.safeBlockVertical * 3,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal * 15,
                                    ),
                                    height: SizeConfig.safeBlockVertical * 35,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFD500),
                                      borderRadius: BorderRadius.circular(
                                        SizeConfig.safeBlockVertical * 25,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Deliver to this address",
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  17,
                                          fontFamily: "Segoe UI",
                                          color: Colors.black,
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
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _loadingVisible,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black38,
                child: Center(
                  child: Container(
                    height: SizeConfig.safeBlockHorizontal * 120,
                    width: SizeConfig.safeBlockHorizontal * 120,
                    child: FlareActor(
                      "assets/images/loader.flr",
                      animation: "Aura",
                    ),
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

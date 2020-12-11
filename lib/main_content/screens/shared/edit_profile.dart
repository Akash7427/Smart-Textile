import 'dart:io';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:smarttextile/main_content/services/photo.dart';
import 'package:smarttextile/main_content/services/supplier_services.dart';
import 'package:smarttextile/main_content/shared/size_config.dart';
import 'package:smarttextile/shared/provider_user.dart';

class EditProfile extends StatefulWidget {
  final User user;
  EditProfile({this.user});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProviderUser providerUser;
  User _user;
  File _image;
  var _name = TextEditingController();
  var _companyName = TextEditingController();
  var _address = TextEditingController();
  var _pincode = TextEditingController();
  var _city = TextEditingController();
  var _state = TextEditingController();
  var _gstNum = TextEditingController();
  var _phone = TextEditingController();
  var _email = TextEditingController();
  var _website = TextEditingController();
  var _logo = TextEditingController();
  var _country = TextEditingController();
  var _description = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _visibleLoading = false;

  List<File> imagelist = List();
  int counter = 1;
  File _image2, _image1;
  Future chooseFile() async {
    // ignore: deprecated_member_use
    if (_image1 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image1 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  Future chooseFile1() async {
    // ignore: deprecated_member_use
    if (_image2 == null) {
      // ignore: deprecated_member_use
      try {
        // ignore: deprecated_member_use
        await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
          setState(() {
            _image2 = image;
          });
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _name.text = _user.name;
    _companyName.text = _user.companyName;
    _address.text = _user.address;
    _pincode.text = _user.pincode;
    _city.text = _user.city;
    _state.text = _user.state;
    _gstNum.text = _user.gstNum;
    _phone.text = "+91 ${_user.phoneNo.substring(_user.phoneNo.length - 10)}";
    _email.text = _user.email;
    _website.text = _user.website;
    _country.text = "India";
    _description.text = _user.description;
    print(_user.description);
  }

  @override
  Widget build(BuildContext context) {
    providerUser = Provider.of<ProviderUser>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(7.4, -1.185),
              child: SvgPicture.asset(
                "assets/images/svg/edit_profile_leaves.svg",
                height: SizeConfig.safeBlockVertical * 140,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 10,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 20,
                              fontFamily: "Segoe UI"),
                        ),
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.safeBlockHorizontal * 130,
                            height: SizeConfig.safeBlockHorizontal * 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff707070).withOpacity(0.4),
                                  blurRadius:
                                      SizeConfig.safeBlockHorizontal * 5,
                                  offset: Offset(2, 5),
                                ),
                              ],
                              image: DecorationImage(
                                  image: _image == null
                                      ? providerUser.logo == null
                                          ? AssetImage("assets/images/logo.png")
                                          : NetworkImage(providerUser.logo)
                                      : FileImage(_image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10.0, top: 7),
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                onPressed: () async {
                                  _image = await Photo().getPhoto();
                                  setState(() {});
                                },
                                child: Text(
                                  "Update Picture",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 11),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length == 0
                              ? "Enter Your Name"
                              : null;
                        },
                        controller: _name,
                        decoration: kTextField.copyWith(labelText: "Name"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length == 0
                              ? "Enter Your Company Name"
                              : null;
                        },
                        controller: _companyName,
                        decoration:
                            kTextField.copyWith(labelText: "Company Name"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          return value.trim().length == 0
                              ? "Enter Your Company Address"
                              : null;
                        },
                        controller: _address,
                        maxLines: 4,
                        decoration: kTextField.copyWith(
                            hintText: "Address", labelStyle: TextStyle()),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 10,
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length != 6
                                    ? "Enter Valid Pincode"
                                    : null;
                              },
                              controller: _pincode,
                              decoration:
                                  kTextField.copyWith(labelText: "Pincode"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 10,
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length == 0
                                    ? "Enter Your Country Name"
                                    : null;
                              },
                              controller: _country,
                              decoration:
                                  kTextField.copyWith(labelText: "Country"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 10,
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length == 0
                                    ? "Enter your city name"
                                    : null;
                              },
                              controller: _city,
                              decoration:
                                  kTextField.copyWith(labelText: "City"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 10,
                                vertical: SizeConfig.safeBlockVertical * 5),
                            child: TextFormField(
                              validator: (value) {
                                return value.trim().length == 0
                                    ? "Enter your State name"
                                    : null;
                              },
                              controller: _state,
                              decoration:
                                  kTextField.copyWith(labelText: "State"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          Pattern pattern =
                              r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value.toUpperCase())) {
                            return "Enter a Valid GST number";
                          } else {
                            return null;
                          }
                        },
                        controller: _gstNum,
                        decoration:
                            kTextField.copyWith(labelText: "GST-Number"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          Pattern pattern = r'^[+]*[0-9 ]*[789]\d{9}$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value.trim())) {
                            return "Enter a Valid Phone number";
                          } else {
                            return null;
                          }
                        },
                        controller: _phone,
                        decoration: kTextField.copyWith(labelText: "Ph-number"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value.trim()))
                            return 'Enter Valid Email';
                          else
                            return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        decoration: kTextField.copyWith(labelText: "Email-id"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        controller: _website,
                        decoration: kTextField.copyWith(labelText: "Website"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 10,
                          vertical: SizeConfig.safeBlockVertical * 5),
                      child: TextFormField(
                        maxLines: 4,
                        controller: _description,
                        decoration:
                            kTextField.copyWith(labelText: "Description"),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 10,
                          ),
                          height: SizeConfig.safeBlockVertical * 50,
                          width: SizeConfig.safeBlockVertical * 50,
                          child: GestureDetector(
                            onTap: () async {
                              // ignore: deprecated_member_use
                              if (counter == 1) {
                                chooseFile();
                                counter = counter + 1;
                              } else {
                                chooseFile1();
                              }
                            },
                            child: Image(
                                image: AssetImage(
                                    "assets/images/business/image1.png")),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              height: SizeConfig.safeBlockVertical * 150,
                              width: double.maxFinite,
                              //color: Colors.red,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: counter,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: <Widget>[
                                        _image1 != null
                                            ? Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  vertical: SizeConfig
                                                          .safeBlockVertical *
                                                      10,
                                                ),
                                                height: SizeConfig
                                                        .safeBlockVertical *
                                                    150,
                                                width: SizeConfig
                                                        .safeBlockHorizontal *
                                                    130,
                                                //color: Colors.green,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            _image1.path),
                                                        fit: BoxFit.fill)),
                                              )
                                            : Container(),
                                        _image1 != null
                                            ? _image2 != null
                                                ? Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                      horizontal: SizeConfig
                                                              .safeBlockHorizontal *
                                                          5,
                                                      vertical: SizeConfig
                                                              .safeBlockVertical *
                                                          10,
                                                    ),
                                                    height: SizeConfig
                                                            .safeBlockVertical *
                                                        150,
                                                    width: SizeConfig
                                                            .safeBlockHorizontal *
                                                        130,
                                                    //color: Colors.green,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                _image2.path),
                                                            fit: BoxFit.fill)),
                                                  )
                                                : Container()
                                            : Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/business/image1.png"),
                                                        fit: BoxFit.fill)),
                                              ),
                                      ],
                                    );
                                  })),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 70,
                                vertical: SizeConfig.safeBlockVertical * 10),
                            child: FlatButton(
                              color: Color(0xff00B6C7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _visibleLoading = true;
                                  });
                                  providerUser.setName(_name.text);
                                  providerUser
                                      .setCompanyName(_companyName.text);
                                  providerUser.setAddress(_address.text);
                                  providerUser.setPincode(_pincode.text);
                                  providerUser.setCity(_city.text);
                                  providerUser.setState(_state.text);
                                  providerUser.setGst(_gstNum.text);
                                  providerUser.setPhoneNumber(_phone.text);
                                  providerUser.setEmail(_email.text);
                                  providerUser.setWebsite(_website.text);
                                  providerUser
                                      .setDescription(_description.text);

                                  if (_image != null) {
                                    providerUser.setlogo(
                                        await Photo().uploadPhoto(_image));
                                  }
                                  await SupplierService()
                                      .updateUser(providerUser.user);
                                  Navigator.pop(context);
                                  setState(() {
                                    _visibleLoading = false;
                                  });
                                  FlutterToast.showToast(
                                      msg: "Profile Updated Successfully");
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.safeBlockVertical * 5),
                                child: Text(
                                  "Save Changes",
                                  style: TextStyle(
                                      fontFamily: "Segoe UI",
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 20),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _visibleLoading,
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

const kTextField = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 17,
  ),
  contentPadding: EdgeInsets.all(15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: Color(0xffC9C9C9), width: 0.5),
  ),
);

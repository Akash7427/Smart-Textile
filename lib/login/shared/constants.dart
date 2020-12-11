import 'package:flutter/material.dart';
import 'package:smarttextile/shared/size_config.dart';

const kTextField = InputDecoration(
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 17,
  ),
  contentPadding: EdgeInsets.all(15),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Color(0xff66CCCC), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: Color(0xffC9C9C9), width: 2.0),
  ),
);

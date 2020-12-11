import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smarttextile/Chat/constants/strings.dart';
import 'package:smarttextile/Chat/enum/user_state.dart';
import 'package:smarttextile/Chat/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smarttextile/login/models/user.dart';
import 'package:http/http.dart' as http;

class AuthMethods {
  static final Firestore _firestore = Firestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  static final Firestore firestore = Firestore.instance;

  static final CollectionReference _userCollection =
      _firestore.collection(USERS_COLLECTION);

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<User> getUserDetailsById(String id) async {
    try {
      http.Response response = await http.get(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/read/$id");
      if (response.statusCode == 200) {
        if(response.body.isNotEmpty){
        var body = jsonDecode(response.body);
        User user = User.fromJson(body);
        return user;
        }
        
        
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<User>> fetchAllUsers(FirebaseUser currentUser) async {
    List<User> userList = List<User>();

    try {
      http.Response response = await http.get(
          "https://us-central1-smarttextile-137.cloudfunctions.net/app/users/read");
      if (response.statusCode == 200) {
        List body = jsonDecode(response.body);
        userList = body.map((e) => User.fromJson(e)).toList();
        return userList;
      } else {
        return userList;
      }
    } catch (e) {
      print(e);
      return userList;
    }
  }

  void setUserState({@required String userId, @required UserState userState}) {
    int stateNum = Utils.stateToNum(userState);

    try {
      _userCollection.document(userId).updateData({
      "chat_state": stateNum,
    });
    } catch (e) {
      print(e);
    }
  }

  Stream<DocumentSnapshot> getUserStream({@required String uid}) =>
      _userCollection.document(uid).snapshots();
}

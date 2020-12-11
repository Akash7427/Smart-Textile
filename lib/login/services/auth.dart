import 'package:firebase_auth/firebase_auth.dart';

class Authemtication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEmailandPassword(String email, String password) async {
    try {
      print("Register");
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future loginWithEmailandPassword(String email, String password) async {
    try {
      FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user.uid;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

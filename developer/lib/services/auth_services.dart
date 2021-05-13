import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:developer/models/option_model.dart';
import 'package:developer/models/warehouse.dart';
import 'package:developer/screens/home.dart';
import 'package:developer/screens/log_screen.dart';
import 'package:developer/screens/sigu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  static final FacebookLogin facebookLogin = FacebookLogin();

  // signUp
  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser signedInUser = authResult.user;
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'name': name,
          'email': email,
          'profileImageUrl': '',
        });

        Navigator.pushReplacementNamed(context, HomePage.id);
        print(name);
        print(email);
      }
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

//signOut
  static void logout(BuildContext context) {
    facebookLogin.logOut();
    _auth.signOut();
    Navigator.pushReplacementNamed(context, Sigu.id);
  }

// login
  static void login(context, String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        print(user);
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
    } catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

  // Reset Password
  static void sendPasswordResetEmail(context, String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

  Future<void> fblogout() async {}
}

// Navigator.pushReplacementNamed( context, HomePage.id, arguments: {"name": name, "email": email}

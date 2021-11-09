import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseManager {
  static late FirebaseApp firebaseApp;
  static late FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static init() async {
    firebaseApp = await Firebase.initializeApp();
    firebaseAuth = FirebaseAuth.instance;

    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint(user.toString());
        debugPrint('User is signed in!');
      }
    });
  }
}

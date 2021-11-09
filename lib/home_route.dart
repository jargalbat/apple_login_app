import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_manager.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase authentication'),
      ),
      body: Column(
        children: [
          /// Button Apple
          TextButton(
            onPressed: _onPressedButtonApple,
            child: const Text('Sign in with Apple'),
          ),

          /// Button Google
          ElevatedButton(
            onPressed: _onPressedSignInWithGoogle,
            child: const Text('Sign in with Google'),
          ),

          /// Button Facebook
          OutlinedButton(
            onPressed: _onPressedButtonFacebook,
            child: const Text('Sign in with Facebook'),
          ),
        ],
      ),
    );
  }

  _onPressedButtonApple() {
    //
  }

  _onPressedSignInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseManager.firebaseAuth.signInWithCredential(credential);
    debugPrint(userCredential.toString());
  }

  _onPressedButtonFacebook() {
    //
  }
}

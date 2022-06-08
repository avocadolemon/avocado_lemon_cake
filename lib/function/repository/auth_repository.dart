import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthRepository with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create an account with email and password
  Future<void> createWithEmailAndPwd(
    String userSignUpEmail,
    String userSignUpPassword,
    BuildContext context,
    String name,
    String age,
    String sex,
  ) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    try {
      if (isConnected == true) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
                email: userSignUpEmail, password: userSignUpPassword);
        await sendEmailVerification(context);
        await _db.collection("UserData").doc(userCredential.user!.uid).set({
          "userId": userCredential.user!.uid,
          "name": name,
          "age": age,
          "sex": sex,
          "email": userSignUpEmail,
          "registrationTime": DateTime.now(),
        }).then((value) {
          Navigator.pushReplacementNamed(context, '/homeWrapper');
          showSnackBar(context, "Yay! Signed up Successfully 🤩");
        });
      } else {
        showSnackBar(context, "Oops! No network connection");
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      showSnackBar(context, "${e.message} 😞");
    }
    notifyListeners();
  }

  // Verification method
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    notifyListeners();
  }

  //Sign In method
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    try {
      if (isConnected == true) {
        //  && !_auth.currentUser!.emailVerified
        // await sendEmailVerification(context);
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          Navigator.pushReplacementNamed(context, '/homeWrapper');
          return value;
        });
      } else {
        showSnackBar(context, "Oops! No network connection");
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      showSnackBar(context, "${e.message} 😞");
    }
    notifyListeners();
  }

//Google signin method
  Future<void> signInWithGmail(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
      // Create a niw credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      await _db.collection("UserData").doc(user!.uid).set({
        "userId": userCredential.user!.uid,
        "name": user.displayName,
        "age": "age",
        "sex": "sex",
        "email": user.email,
        "registrationTime": DateTime.now(),
      }).then((value) {
        Navigator.pushReplacementNamed(context, '/homeWrapper');
        showSnackBar(context, "Yay! Signed up Successfully 🤩");
        return value;
      });
    }
    notifyListeners();
  }

//Facebook signing in
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential faceBookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final UserCredential userCredential =
          await _auth.signInWithCredential(faceBookAuthCredential);
      final User? user = userCredential.user;

      await _db.collection("UserData").doc(user!.uid).set({
        "userId": userCredential.user!.uid,
        "name": user.displayName,
        "age": "age",
        "sex": "sex",
        "email": user.email,
        "registrationTime": DateTime.now(),
      }).then((value) {
        Navigator.pushReplacementNamed(context, '/homeWrapper');
        showSnackBar(context, "Yay! Signed up Successfully 🤩");
        return value;
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
    notifyListeners();
  }

  Future<void> signInWithApple() async {}

  //Sign out method
  Future<void> signOut(BuildContext context) async {
    FirebaseAuth.instance.signOut().then(
      (value) {
        Navigator.pushReplacementNamed(context, '/login');
        showSnackBar(context, "Signed out");
      },
    );
    notifyListeners();
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

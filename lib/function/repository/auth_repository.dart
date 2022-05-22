import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class AuthRepository {
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
          "password": userSignUpPassword,
          "registrationTime": DateTime.now(),
        }).then((value) {
          Navigator.pushReplacementNamed(context, '/homeWrapper');
          showSnackBar(context, "Yay! Signed up Successfully 🤩");
        });
      } else {
        showSnackBar(context, "Oops! No network connection");
      }
    } catch (e) {
      log(e.toString());
      showSnackBar(context, "Oops! An error occured.. 😞");
    }
  }

  // Verification method
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Sign In method
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    try {
      if (isConnected == true && !_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          Navigator.pushReplacementNamed(context, '/homeWrapper');
          return value;
        });
      } else {
        showSnackBar(context, "Oops! No network connection");
      }
    } catch (e) {
      log(e.toString());
      showSnackBar(context,
          "We cannot find an account with this email and password. Please check your details 😞");
    }
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
      await _auth.signInWithCredential(credential).then((value) async {
        Navigator.pushReplacementNamed(context, '/homeWrapper');
        showSnackBar(context, "Yay! Signed up Successfully 🤩");
        return value;
      });
    }
  }

  Future<void> signInWithFacebook() async {}
  Future<void> signInWithApple() async {}

  //Sign out method
  Future<void> signOut(BuildContext context) {
    return FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushReplacementNamed(context, '/login');
      showSnackBar(context, "Signed out");
    });
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userName;
  String profilePhoto;
  String email;
  String uid;
  User({
    required this.userName,
    required this.profilePhoto,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'profilephoto': profilePhoto,
        'email': email,
        'uid': uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return User(
        userName: snapShot['username'],
        profilePhoto: snapShot['profilephoto'],
        email: snapShot['email'],
        uid: snapShot['uid']);
  }
}

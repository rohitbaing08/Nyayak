import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool flag = true;
  late var userData;
  late User? currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<dynamic> fetchUserDetails(String? email) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('user');
    final docSnapshot = await users.where('email', isEqualTo: email).get();

    if (docSnapshot.docs.isNotEmpty) {
      final userDoc = docSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    } else {
      print('No user found with this email in Firestore.');
    }
  }
}

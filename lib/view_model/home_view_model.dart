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
    final usersdocSnapshot = await users.where('email', isEqualTo: email).get();

    final CollectionReference lawyers =
        FirebaseFirestore.instance.collection('lawyer');
    final lawyerdocSnapshot =
        await lawyers.where('email', isEqualTo: email).get();

    if (usersdocSnapshot.docs.isNotEmpty) {
      final userDoc = usersdocSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    } else {
      final userDoc = lawyerdocSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    }
  }
}

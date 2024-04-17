import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool flag = true;
  late var userData;
  List mainList = [];
  List displayList = [];
  FirebaseAuth auth = FirebaseAuth.instance;

  editList(String val) {
    displayList = mainList
        .where((ele) =>
            ele.name.toString().toLowerCase().contains(val.toLowerCase()))
        .toList();
    notifyListeners();
  }

  filterByType(String val) {
    displayList = mainList
        .where((element) =>
            element.provider.toString().toLowerCase() == val.toLowerCase())
        .toList();
    notifyListeners();
  }

  filterByLocation(String val) {
    displayList = mainList
        .where((element) =>
            element.location.toString().toLowerCase() == val.toLowerCase())
        .toList();
    notifyListeners();
  }

  Future<dynamic> fetchLawyers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('lawyer').get();
      List<LawyerModel> lawyers = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return LawyerModel.fromJson(data);
      }).toList();

      return lawyers;
    } catch (e) {
      print('Error fetching lawyers: $e');
      return []; // Return an empty list if there's an error
    }
  }

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
      userData = userDoc.data();
      // Contains user data
      return userData;
    } else {
      final userDoc = lawyerdocSnapshot.docs.first;
      userData = userDoc.data(); // Contains user data
      return userData;
    }
  }
}

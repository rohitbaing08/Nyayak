import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/model/lawyer_model.dart';
import 'package:nyayak/model/user_model.dart';
import 'package:nyayak/res/routes_constant.dart';

class AuthViewModel extends ChangeNotifier {
  bool loginFlag = false;
  bool registerClientFlag = false;
  bool registerLawyerFlag = false;
  late LawyerModel lawyer;

  intermidiateData(
    String email,
    String password,
    String name,
    String gender,
    String DOB,
    String contact,
  ) {
    lawyer = LawyerModel(
        id: '',
        name: name,
        email: email,
        password: password,
        gender: gender,
        DOB: DOB,
        contact: contact,
        provider: '',
        experience: '',
        location: '',
        licenseNo: '');
  }

  registerLawyer(
      String email,
      String password,
      String name,
      String gender,
      String DOB,
      String contact,
      String provider,
      String experience,
      String location,
      String licenseNo) async {
    try {
      registerLawyerFlag = true;
      notifyListeners();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        LawyerModel dataToSave = LawyerModel(
            id: value.user!.uid,
            name: name,
            email: email,
            password: password,
            gender: gender,
            DOB: DOB,
            contact: contact,
            provider: provider,
            experience: experience,
            location: location,
            licenseNo: licenseNo);
        FirebaseFirestore.instance
            .collection('lawyer')
            .add(dataToSave.toJson())
            .then((value) => router.go('/'));
      });
      registerLawyerFlag = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  registerClient(String email, String password, String name, String gender,
      String DOB, String contact) async {
    try {
      registerClientFlag = true;
      notifyListeners();
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        UserModel dataToSave = UserModel(
            id: value.user!.uid,
            name: name,
            email: email,
            password: password,
            gender: gender,
            DOB: DOB,
            contact: contact);
        FirebaseFirestore.instance
            .collection('user')
            .add(dataToSave.toJson())
            .then((value) => router.go('/'));
      });
      registerClientFlag = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password) async {
    try {
      loginFlag = true;
      notifyListeners();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      loginFlag = false;
      notifyListeners();
      router.go('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for this email.');
      } else {
        print(e.message);
      }
    }
  }
}

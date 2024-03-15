import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String gender;
  final String DOB;
  final String contact;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.DOB,
    required this.contact,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    // Convert the document snapshot data to a map
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    // Extract data from the map and create a UserModel instance
    return UserModel(
      name: data['name'],
      email: data['email'],
      password: data['password'],
      gender: data['gender'],
      DOB: data['DOB']
          .toDate(), // Assuming 'DOB' is stored as a Firestore Timestamp
      contact: data['contact'],
      id: data['id'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      DOB: json['DOB'],
      contact: json['contact'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'DOB': DOB,
      'contact': contact,
    };
  }
}

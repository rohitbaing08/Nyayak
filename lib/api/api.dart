// get current user
// get lawyer data
// add cases
// add lawyer
// add client

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserToFirestore(
  String name,
  String email,
  String contactNumber,
  String gender,
  DateTime dob,
) async {
  // Get a Firestore instance
  final firestore = FirebaseFirestore.instance;

  // Prepare a collection reference (replace 'users' with your actual collection name)
  final collectionRef = firestore.collection('users');

  // Create a document with specific fields
  final userData = {
    'name': name,
    'email': email,
    'contactNumber': contactNumber,
    'gender': gender,
    'dob': dob, // Assuming dob is a DateTime object
  };

  // Add the document with the user data
  await collectionRef.add(userData);

  print('Successfully added user to Firestore');
}

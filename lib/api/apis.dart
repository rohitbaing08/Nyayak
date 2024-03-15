// get lawyers data
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Future<List<Map<String, dynamic>>> getLawyers() async {
//   // Get a Firebase Function instance (assuming a function named 'getLawyers')
//   final httpsCallable = FirebaseFunctions.instance.httpsCallable('getLawyers');

//   // Call the function with user credentials (if applicable based on security rules)
//   final user = FirebaseAuth.instance.currentUser;
//   final response = await httpsCallable(
//     data: user?.uid, // Pass user ID if necessary for authorization
//   );

//   // Handle the response
//   if (response.data['success']) {
//     final lawyerData = response.data['data'] as List;
//     return lawyerData.cast<Map<String, dynamic>>();
//   } else {
//     // Handle error scenario (e.g., permission denied)
//     throw Exception('Failed to get lawyers data');
//   }
// }



// add lawyers data
// get community post

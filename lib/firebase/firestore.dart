import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> addUser(String email, String id) async {
  await Firebase.initializeApp();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var post = ({'email': email, 'type': 'cliente'});
  await users.doc(id).set(post);
  print("User's added");
}

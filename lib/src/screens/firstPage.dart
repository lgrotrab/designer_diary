import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              auth.signOut();
              Navigator.pop(context);
            },
            child: Text('Logout')),
      ),
    );
  }
}

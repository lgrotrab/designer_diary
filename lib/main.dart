import 'package:designer_diary/firebase/Post_Firebase.dart';
import 'package:designer_diary/firebase/authentication.dart';
import 'package:designer_diary/screens/FeedScreen.dart';
import 'package:flutter/material.dart';
import 'screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
  getPost();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designer Diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedScreen(),
    );
  }
}

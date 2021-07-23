import 'package:designer_diary/src/firebase/firestore.dart';
import 'package:designer_diary/src/screens/feedScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _signIn(context);
                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(primary: Colors.black),
              ),
              ElevatedButton(
                  onPressed: () {
                    _signUp(context);
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(primary: Colors.orange))
            ],
          )
        ],
      ),
    );
  }

  void _signUp(BuildContext context) {
    try {
      auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        addUser(value.user!.email!, value.user!.uid);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedScreen()),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _signIn(BuildContext context) {
    try {
      auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        emailController.text = '';
        passwordController.text = '';
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedScreen()),
        );
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('User doesnt exist');
      } else if (error.code == 'wrong-password') {
        print('Password doenst existe');
      }
    } catch (error) {
      print(error);
    }
  }
}

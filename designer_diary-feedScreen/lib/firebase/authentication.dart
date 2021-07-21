import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth authentication = FirebaseAuth.instance;

FirebaseApp designerDiary = Firebase.app('designer-diary');

void signIn() async {
  await Firebase.initializeApp();
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "teste@gmail.com",
      password: "123456",
    );
    print(userCredential);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

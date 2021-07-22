import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designer_diary/model/post.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseApp design = Firebase.app('designer-diary');

Future<List<post>> getPost() async {
  final List<post> postList = [];
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.collection('posts').get().then(
        (snapshot) => snapshot.docs.forEach((i) {
          print(i.data()['title']);
          post newPost = post(
              title: i.data()['title'],
              description: i.data()['description'],
              mainImage: i.data()['main_image'],
              profilePicture: i.data()['profile_picture'],
              username: i.data()['username']);
          postList.add(newPost);
        }),
      );
  return postList;
}

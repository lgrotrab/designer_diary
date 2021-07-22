import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designer_diary/src/model/post.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseApp design = Firebase.app('designer-diary');

Future<List<Post>> getPosts() async {
  final List<Post> postList = [];
  await FirebaseFirestore.instance.collection('posts').get().then(
        (snapshot) => snapshot.docs.forEach((i) {
          Post newPost = Post(
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

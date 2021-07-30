import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designer_diary/src/model/post.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseApp design = Firebase.app('designer-diary');

late QuerySnapshot collectionState;
final List<Post> postList = [];

Future<List<Post>> getPosts() async {
  await FirebaseFirestore.instance
      .collection('posts')
      .limit(2)
      .get()
      .then((snapshot) {
    collectionState = snapshot;
    snapshot.docs.forEach((i) {
      Post newPost = Post.fromMap(i.data());
      postList.add(newPost);
    });
  });
  return postList;
}

Future<List<Post>> getMorePosts() async {
  late QueryDocumentSnapshot<Object?> lastVisible;
  if (collectionState.docs.isNotEmpty) {
    lastVisible = collectionState.docs[collectionState.docs.length - 1];
  } else {
    return postList;
  }
  FirebaseFirestore.instance
      .collection('posts')
      .startAfterDocument(lastVisible)
      .limit(1)
      .get()
      .then((snapshot) {
    snapshot.docs.forEach((i) {
      Post newPost = Post.fromMap(i.data());
      collectionState = snapshot;
      postList.add(newPost);
    });
  });
  return postList;
}

void emptyPosts() {
  postList.clear();
  print("Lista limpa");
}

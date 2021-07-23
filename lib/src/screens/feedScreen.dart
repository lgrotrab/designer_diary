import 'package:designer_diary/src/firebase/post_Firebase.dart';
import 'package:designer_diary/src/model/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<List<Post>> initialValue = getPosts();
  late ScrollController con;
  bool getPostIsComplete = false;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    con = ScrollController();
    con.addListener(() {
      if (con.position.pixels == con.position.maxScrollExtent) {
        if (getPostIsComplete == false)
          setState(() {
            getMorePosts().whenComplete(() => getPostIsComplete = true);
            Future.delayed(Duration(seconds: 1));
          });
        if (getPostIsComplete == true) {
          Future.delayed(Duration(seconds: 3));
        }
        getPostIsComplete = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          auth.signOut();
          emptyPosts();
          Navigator.pop(context);
        },
        child: Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: FutureBuilder<List<Post>>(
        future: initialValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Post>? posts = snapshot.data;
            return ListView.builder(
                controller: con,
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  final Post teste = posts[index];
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: Text(
                            teste.title,
                            style: TextStyle(fontSize: 30, color: Colors.black),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Image(
                          image: NetworkImage(teste.mainImage),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(teste.profilePicture),
                                ),
                              ),
                              Text(
                                teste.username,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          teste.description,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

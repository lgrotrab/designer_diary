import 'package:designer_diary/src/firebase/Post_Firebase.dart';
import 'package:designer_diary/src/model/post.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Post>? posts = snapshot.data;
            return ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  final Post teste = posts[index];
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
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
          return Text('Teste');
        },
      ),
    );
  }
}

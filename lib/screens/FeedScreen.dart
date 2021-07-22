import 'package:designer_diary/firebase/Post_Firebase.dart';
import 'package:designer_diary/model/post.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<post>>(
        future: getPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<post>? posts = snapshot.data;
            return ListView.builder(
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  final post Teste = posts[index];
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          Teste.title,
                          style: TextStyle(fontSize: 30, color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                        Image(
                          image: NetworkImage(Teste.mainImage),
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(Teste.profilePicture),
                            ),
                            Text(
                              Teste.username,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Text(
                          Teste.description,
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

  Container FeedPost() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            'Teste design',
            style: TextStyle(fontSize: 30, color: Colors.black),
            textAlign: TextAlign.start,
          ),
          Image(
            image: NetworkImage(
                'https://image.freepik.com/vetores-gratis/papel-de-parede-geometrico-de-design-grafico_52683-34399.jpg'),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.ytimg.com/vi/pabPiAsu5Ug/hqdefault.jpg'),
              ),
              Text(
                'Ualsalsqui',
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

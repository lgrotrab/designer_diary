import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {

  @override
    _LoginScreenState createState() =>
}

Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Insira aqui o seu Email',
        style: TextStyle(color: Colors.black38, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration( 
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2),
            )
          ]
        ),
        height: 60,
        child: TextField(keyboardType: TextInputType.emailAddress,
        style: TextStyle(color:Colors.black87),
        decoration: InputDecoration(border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(Icons.email, color: Colors.black54),hintText: 'Email', hintStyle: TextStyle(color: Colors.black38 )),
        ),
      )
    ],
  )
}
class _LoginScreenState extends State<LoginScreen> {

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle> (
        value: SystemUiOverlayStyle.light
        child: GestureDetector(
          child: Stack( children: <Widget> [Container(
          height: double.infinity ,
          width: double.infinity ,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x99f0eef0),Color(0xccf0eef0),Color(0xfff0eef0),] )
          ),
          child: Column (mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(
            'Email',
            style: TextStyle(color: Colors.black, fontSize: 40,fontWeight: FontWeight.bold),
          ), SizedBox(height: 50,), buildEmail()],),
        )],),),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_criteria/password_criteria.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: PasswordCriteria(title: 'Flutter Demo Home Page'),
    );
  }
}

class PasswordCriteria extends StatefulWidget {
  @override
  PasswordCriteriaPageState createState() => PasswordCriteriaPageState();

  PasswordCriteria({Key key, this.title}) : super(key: key);
  final String title;
}

class PasswordCriteriaPageState extends State<PasswordCriteria> {
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Password Crtiteria"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                   //PasswordStrengthPage(value);
                },
              ),
            ),
            Container(
              child: PasswordStrengthPage(password),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



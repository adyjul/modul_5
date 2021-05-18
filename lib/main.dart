import 'package:belajar/collection_user.dart';
import 'package:belajar/post_result_model.dart';
import 'package:belajar/user_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User userData = null;
  String users = "Belum ada";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Belajar CRUD'))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(users),
              RaisedButton(
                onPressed: () {
                  UserData.connectToAPI("1").then((value){
                    users = '';
                    for(int i = 1;i<value.length;i++){
                      users = users + "["+value[i].name+"]";
                      setState((){});
                    }
                  });                 
                },
                child: Text('Post'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

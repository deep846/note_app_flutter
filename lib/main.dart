import 'package:flutter/material.dart';
import 'package:keep_note_clone/home.dart';
import 'package:keep_note_clone/login.dart';
import 'package:keep_note_clone/servises/login_info.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async{
    await LocalDataSaver.getLogData().then((value){
      setState((){
        isLogIn = value!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Note Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogIn ? Home(): Login(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_quiz/screen/screen_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Quiz APP', home: HomeScreen());
  }
}

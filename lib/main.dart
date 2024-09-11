import 'package:flutter/material.dart';
import 'package:retos/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RETOS',
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.grey              
      ),
    );
  }
}
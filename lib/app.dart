import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybk/home.dart';

class YbkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "亦播客",
      theme: new ThemeData(primaryColor: Colors.black),
      home: new Home(),
    );
  }
}



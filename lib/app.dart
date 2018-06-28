import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ybk/home.dart';

class YbkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "亦播客",
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.pink.shade400,
        platform: TargetPlatform.iOS,
      ),
      home: Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onlinedata/home.dart';
import 'package:onlinedata/add/dropdown.dart';

import 'axax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XYZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


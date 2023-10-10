import 'package:flutter/material.dart';

import 'appbar/first_appbar.dart';
import 'appbar/fourth_appbar.dart';
import 'appbar/second_appbar.dart';
import 'appbar/third_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ThirdAppbar();
  }
}

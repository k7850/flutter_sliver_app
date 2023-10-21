import 'package:flutter/material.dart';
import 'package:flutter_sliver_app/appbar/my_home_page.dart';
import 'package:flutter_sliver_app/appbar/my_third_sliver.dart';

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
    // return MyThirdSliver(); // 앱바 크기조절가능, 조절하면 모양도 변경 가능
    return MyHomePage();
    // return FirstAppbar();
    // return SecondAppbar();
    // return ThirdAppbar();
    // return FourthAppbar();
  }
}

import 'package:flutter/material.dart';
import 'package:task/view/pages/api_example.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomBarIndex = 0;
  List pages = [const MyHomePage(), const ApiExample()];

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

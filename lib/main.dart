import 'package:flutter/material.dart';
import 'package:mhh/pages/home.dart';

void main() {
  runApp(const BPRecApp());
}

class BPRecApp extends StatelessWidget {
  const BPRecApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Pressure Recordings',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomeScreen(),
    );
  }
}

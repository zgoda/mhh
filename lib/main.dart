import 'package:flutter/material.dart';
import 'package:mhh/pages/home.dart';
import 'package:mhh/pages/newrecording.dart';

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
      routes: <String, WidgetBuilder>{
        '/record/new': (BuildContext context) => const RecordingCreateScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
      },
    );
  }
}

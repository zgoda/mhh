import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mhh/const.dart';
import 'package:mhh/pages/home.dart';
import 'package:mhh/pages/newrecording.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(recordBoxName);
  runApp(const BPRecApp());
}

class BPRecApp extends StatelessWidget {
  const BPRecApp({super.key});

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

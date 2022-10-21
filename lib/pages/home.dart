import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          tooltip: 'New blood pressure recording',
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('New BP recording'),
            ),
          ),
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Blood Pressure Recordings'),
        ),
        body: const Center(
          child: Text('BP Records'),
        ));
  }
}

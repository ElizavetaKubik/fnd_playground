import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(hintText: 'Enter your name'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Press me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets/user_profile.dart';

import 'custom_child_examples.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        body: Example(),
      ),
    );
  }
}

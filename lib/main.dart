import 'package:flutter/material.dart';

import 'animation_curved_demo.dart';

void main() {
  runApp(const MyApp());
}

//sdfsdfsdfsdfsdfsdf
class MyApp extends StatelessWidget {//ssdfsdfsdfsdfs
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimationCurvedDemo(),
    );
  }
}
/// hellooo
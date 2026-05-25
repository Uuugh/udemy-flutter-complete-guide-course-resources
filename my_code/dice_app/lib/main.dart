import 'package:flutter/material.dart';
import 'package:dice_app/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('First App')),
        // body: GradientContainer(
        //   colorsList: [
        //     const Color.fromARGB(255, 197, 110, 11),
        //     const Color.fromARGB(255, 12, 2, 75),
        //   ],
        // ),
        body: const GradientContainer.purple(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterinaja/apps/examples/examples_widget.dart';

void main() {
  //runApp(const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutterin Aja',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const RoostFormPage(),
      //home: const TextInputControlDemo(),
      home: const BottomNavBarDemo(),
    );
  }
}

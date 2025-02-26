import 'package:flutter/material.dart';
import 'package:flutterinaja/apps/examples/form_page.dart';
import 'package:flutterinaja/apps/examples/text_input_control_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const TextInputControlDemo(),
    );
  }
}

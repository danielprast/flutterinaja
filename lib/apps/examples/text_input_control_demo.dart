import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputControlDemo extends StatefulWidget {
  const TextInputControlDemo({super.key});

  @override
  State<TextInputControlDemo> createState() => _TextInputControlDemoState();
}

class _TextInputControlDemoState extends State<TextInputControlDemo> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            GestureDetector(
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    color: Colors.yellow,
                    height: 100,
                    width: 100,
                  ),
                  Spacer(),
                ],
              ),
              onTap: () {
                focusNode.unfocus();
              },
            ),
            SafeArea(
              child: Column(
                children: [
                  TextField(
                    focusNode: focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp(r'[+0]')),
                    ],
                    decoration: InputDecoration(
                      labelText: 'WhatsApp Number',
                      border: InputBorder.none,
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: const Text('+62'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

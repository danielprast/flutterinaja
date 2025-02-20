import 'package:flutter/material.dart';
import 'package:flutterinaja/apps/examples/form_overview.dart';

class RoostFormPage extends StatefulWidget {
  //
  const RoostFormPage({super.key});

  @override
  State<RoostFormPage> createState() => _RoostFormPageState();
}

class _RoostFormPageState extends State<RoostFormPage> {
  //
  final textEditingController = TextEditingController();
  late FocusNode formFocusNode;

  @override
  void initState() {
    super.initState();
    formFocusNode = FocusNode();
    textEditingController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    formFocusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: () {
          formFocusNode.requestFocus();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              Column(
                spacing: 16.0,
                children: [
                  Expanded(child: Container()),
                  // TextField(
                  //   autofocus: false,
                  //   focusNode: formFocusNode,
                  //   controller: textEditingController,
                  //   decoration: InputDecoration(
                  //     border: UnderlineInputBorder(),
                  //     hintText: 'Masukan text...',
                  //   ),
                  // ),
                  // TextFormField(
                  //   focusNode: formFocusNode,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(16),
                  //         topRight: Radius.circular(16),
                  //       ),
                  //     ),
                  //     hintText: 'Masukkan data...',
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FormOverview(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Text('Submit Form Data'),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _printLatestValue() {
    final text = textEditingController.text;
    print('Text did change: $text (${text.characters.length})');
  }
}

abstract class RootResponder {
  void dismissForm({BuildContext? context});
}

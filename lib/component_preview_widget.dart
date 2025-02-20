import 'package:flutter/material.dart';

class ComponentPreview extends StatelessWidget {
  const ComponentPreview({
    super.key,
    this.backgroundColor = Colors.white,
    required this.content,
  });

  final Widget content;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(child: Container()),
              content,
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class ScaffoldPreview extends ComponentPreview {
  //
  const ScaffoldPreview({
    super.key,
    required super.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Expanded(child: Container()),
            content,
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

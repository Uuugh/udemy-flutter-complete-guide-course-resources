import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(style: TextStyle(fontSize: 25, color: textColor), text),
    );
  }
}

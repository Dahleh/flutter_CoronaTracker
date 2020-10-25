import 'package:flutter/material.dart';

class DialogText extends StatefulWidget {
  DialogText({this.text, this.fontSize, this.fontWeight});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  _DialogTextState createState() => _DialogTextState();
}

class _DialogTextState extends State<DialogText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}

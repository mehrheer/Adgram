import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final String hintText;
  final bool obscureText;
  final Function onChanged;
  InputTextField({this.hintText, @required this.obscureText, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(fontSize: 20.0),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}

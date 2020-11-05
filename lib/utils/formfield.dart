import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function validator;
  final Function onSaved;
  final TextEditingController controller;

  MyTextFormField(
      {this.hintText,
      this.labelText,
      this.validator,
      this.onSaved,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(),
            hintText: hintText,
            hintStyle:
                TextStyle(fontFamily: 'Ubuntu', fontStyle: FontStyle.italic),
            contentPadding: EdgeInsets.all(15.0),
            //filled: true,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
          validator: validator,
          onSaved: onSaved,
          controller: controller,
          keyboardType: TextInputType.text,
          maxLength: 40,
          cursorColor: Colors.white24,
        ),
      ),
    );
  }
}

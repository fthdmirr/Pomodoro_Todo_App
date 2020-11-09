import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HabitNameInput extends StatelessWidget {
  

  TextEditingController controller = TextEditingController();

  HabitNameInput({this.controller});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _screenHeight / 3,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "Yapılacak alışkanlık",
            hintStyle: TextStyle(
                fontFamily: 'Ubuntu',
                fontStyle: FontStyle.italic,
                fontSize: _screenHeight / 35,
                color: Colors.grey),
          ),
          validator: (String value) {
            if (value.length < 2) {
              return 'En az 2 harf giriniz';
            } else
              return null;
          },
          onSaved: (String value) {
            controller.text = value;
          },
        ),
      ),
    );
  }
}

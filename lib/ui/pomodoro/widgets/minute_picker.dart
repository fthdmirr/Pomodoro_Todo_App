/*import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';

class TimerPicker extends StatelessWidget {
  bool isTime = false;

  Duration pickedMinute;

  TimerPicker({@required this.pickedMinute, this.isTime});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final TextStyle _textStyle =
        TextStyle(fontSize: _screenHeight / 35, fontFamily: 'Ubuntu');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            isTime = false;
          },
          child: Container(
            width: _screenHeight / 8,
            height: _screenHeight / 15,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              '25:00',
              style: _textStyle,
            )),
          ),
        ),
        InkWell(
          onTap: () async {
            isTime = true;
              pickedMinute = await showDurationPicker(
                context: context, initialTime: Duration(minutes: 0));
          },
          child: Container(
            width: _screenHeight / 8,
            height: _screenHeight / 15,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              'Manuel',
              style: _textStyle,
            )),
          ),
        ),
      ],
    );
  }
}*/

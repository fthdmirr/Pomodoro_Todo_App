/*import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TourPicker extends StatefulWidget {
  int currentPick = 5;
  TourPicker(this.currentPick);
  @override
  _TourPickerState createState() => _TourPickerState();
}

class _TourPickerState extends State<TourPicker> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          RaisedButton(onPressed: () => _showDialog(), child: Text("Tur seç")),
    );
  }

  void _showDialog() {
    showDialog<int>(
      context: context,
      builder: (context) {
        return NumberPickerDialog.integer(
            title: Text("Tur sayısı"),
            minValue: 1,
            maxValue: 12,
            initialIntegerValue: 5);
      },
    ).then((int value) {
      if (value != null) {
        widget.currentPick = value;
      }
    });
  }
}*/

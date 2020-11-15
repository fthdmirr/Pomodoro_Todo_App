import 'package:flutter/material.dart';

class TitleAndIcon extends StatelessWidget {
  final String pickedTitle;
  final String pickedFrequence;
  TitleAndIcon(this.pickedTitle, this.pickedFrequence);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          pickedTitle,
          style: TextStyle(color: Colors.white, fontSize: _screenHeight / 36),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              pickedFrequence,
              style:
                  TextStyle(fontSize: _screenHeight / 52, color: Colors.white),
            ),
            SizedBox(
              width: _screenHeight / 100,
            ),
            Icon(
              Icons.cached,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

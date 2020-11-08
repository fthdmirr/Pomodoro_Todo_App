import 'package:flutter/material.dart';

class DaysAndDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: _screenHeight / 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          /*habitDay = DateTime.now().day + index;
          habitDateTime = DateFormat.E('tr_TR')
              .format(DateTime.now().add(Duration(days: index)));*/

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: _screenHeight / 80,
              ),
              Text(
                "habitTime",
                style: TextStyle(
                    fontSize: _screenHeight / 60, color: Colors.black54),
              ),
              SizedBox(
                height: _screenHeight / 80,
                width: _screenHeight / 12,
              ),
              Expanded(
                  child: InkWell(
                onDoubleTap: () {},
                child: Container(
                  width: _screenHeight / 19,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: _screenHeight / 50,
                      color: Color(0xffF95A5A),
                    ),
                    shape: BoxShape.circle,
                    color: Color(0xffF95A5A),
                  ),
                  child: Center(
                    child: Text(
                      "habitDay",
                      style: TextStyle(
                          fontSize: _screenHeight / 60, color: Colors.white30),
                    ),
                  ),
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}

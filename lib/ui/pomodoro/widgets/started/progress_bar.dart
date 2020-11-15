import 'package:flutter/material.dart';

class PomodoroProgressBar extends StatefulWidget {
  @override
  _PomodoroProgressBarState createState() => _PomodoroProgressBarState();
}

const TWO_PI = 3.14 * 2;

class _PomodoroProgressBarState extends State<PomodoroProgressBar> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xffF95A5A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Color(0xffF95A5A),
              height: _screenHeight / 3,
              width: _screenHeight / 3,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return SweepGradient(
                          startAngle: 0.0,
                          endAngle: TWO_PI,
                          stops: [0.0, 0.0],
                          center: Alignment.center,
                          colors: [
                            Colors.red,
                            Colors.white,
                          ]).createShader(rect);
                    },
                    child: Container(
                      height: _screenHeight / 2.5,
                      width: _screenHeight / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: _screenHeight / 3 - 50,
                      width: _screenHeight / 3 - 50,
                      decoration: BoxDecoration(
                        color: Color(0xffF95A5A),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text("25:00",
                            style: TextStyle(
                                fontSize: _screenHeight / 15,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

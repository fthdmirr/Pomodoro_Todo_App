import 'package:flutter/material.dart';

import 'widgets/started/pomodoro_started.dart';

class PomodoroMain extends StatefulWidget {
  @override
  _PomodoroMainState createState() => _PomodoroMainState();
}

class _PomodoroMainState extends State<PomodoroMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Pomodoro",
          style: TextStyle(
              fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: PomodoroStarted(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/ui/pomodoro/widgets/running/progress_bar_running.dart';


class PomodoroRunning extends StatefulWidget {
  @override
  _PomodoroRunningState createState() => _PomodoroRunningState();
}

class _PomodoroRunningState extends State<PomodoroRunning> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Pomodoro",
            style: TextStyle(
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Color(0xffF95A5A),
          child: ProgressBarRun(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:flutter_habifa_v2/ui/pomodoro/widgets/running/pomodoro_running.dart';
import 'package:flutter_habifa_v2/ui/pomodoro/widgets/started/progress_bar.dart';
import 'package:nice_button/nice_button.dart';
import 'package:screen/screen.dart';

class PomodoroStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

    return Container(
      color: Color(0xffF95A5A),
      child: Column(
        children: [
          SizedBox(
            height: _screenHeight / 20,
          ),
          /*TimerPicker(
            pickedMinute: _pickedDuration,
            isTime: _isTime,
          ),*/
          SizedBox(
            height: _screenHeight / 20,
          ),
          Hero(tag: 'progress', child: PomodoroProgressBar()),
          SizedBox(
            height: _screenHeight / 10,
          ),
          NiceButton(
            width: _screenHeight / 5,
            elevation: 8.0,
            radius: _screenHeight / 20,
            text: "Başla",
            background: null,
            gradientColors: [secondColor, firstColor],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PomodoroRunning(),
                  ));
              BlocProvider.of<PomodoroBloc>(context)
                  .add(PomodoroStartedEvent(duration: 1500, tour: 1));
              Screen.keepOn(true);
            },
          ),
          SizedBox(
            height: _screenHeight / 20,
          ),
        ],
      ),
    );
  }
}

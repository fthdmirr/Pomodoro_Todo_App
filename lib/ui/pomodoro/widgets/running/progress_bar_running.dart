import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:flutter_habifa_v2/ui/pomodoro/pomodoro_actions.dart';

class ProgressBarRun extends StatefulWidget {
  @override
  _ProgressBarRunState createState() => _ProgressBarRunState();
}

class _ProgressBarRunState extends State<ProgressBarRun> {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    CountDownController _controller = CountDownController();
    return Column(
      children: [
        Container(
          color: Color(0xffF95A5A),
          child: Column(
            children: [
              Center(
                child: BlocBuilder<PomodoroBloc, PomodoroState>(
                  builder: (context, state) {
                    return CircularCountDownTimer(
                      duration: state.duration,
                      controller: _controller,
                      width: _screenWidth / 1.5,
                      height: _screenHeight / 1.8,
                      color: Colors.white,
                      fillColor: Colors.red,
                      backgroundColor: null,
                      strokeWidth: _screenHeight / 35,
                      textStyle: TextStyle(
                          fontSize: _screenHeight / 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      isReverse: true,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                    );
                  },
                ),
              ),
              BlocBuilder<PomodoroBloc, PomodoroState>(
                builder: (context, state) {
                  return Text(
                    state.tour.toString() + ".Tur",
                    style: TextStyle(
                        fontSize: _screenHeight / 20, color: Colors.white),
                  );
                },
              ),
              SizedBox(height: _screenWidth / 10),
              BlocBuilder<PomodoroBloc, PomodoroState>(
                buildWhen: (previous, current) =>
                    current.runtimeType != previous.runtimeType,
                builder: (context, state) {
                  return PomodoroActions(_controller);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

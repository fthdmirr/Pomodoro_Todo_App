import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:flutter_habifa_v2/ui/pomodoro/pomodoro_actions.dart';

class ProgressBarRun extends StatefulWidget {
  @override
  _ProgressBarRunState createState() => _ProgressBarRunState();
}

class _ProgressBarRunState extends State<ProgressBarRun>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1500));
    animationController.forward(from: animationController.value);
  }

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    const TWO_PI = 3.14 * 2;
    return Column(
      children: [
        Container(
          color: Color(0xffF95A5A),
          child: Column(
            children: [
              SizedBox(
                height: _screenHeight / 8,
              ),
              Center(
                child: BlocBuilder<PomodoroBloc, PomodoroState>(
                  builder: (context, state) {
                    final String minutesStr = ((state.duration / 60) % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');
                    final String secondsStr = (state.duration % 60)
                        .floor()
                        .toString()
                        .padLeft(2, '0');

                    return AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) => Container(
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
                                            stops: [
                                              animationController.value,
                                              animationController.value
                                            ],
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
                                            shape: BoxShape.circle,
                                            color: Colors.white),
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
                                          child: Text('$minutesStr:$secondsStr',
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
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: _screenHeight / 8,
              ),
              BlocBuilder<PomodoroBloc, PomodoroState>(
                builder: (context, state) {
                  return Text(
                    state.tour.toString() + ".Tur",
                    style: TextStyle(
                        fontSize: _screenHeight / 15, color: Colors.white),
                  );
                },
              ),
              SizedBox(height: _screenWidth / 10),
              BlocBuilder<PomodoroBloc, PomodoroState>(
                buildWhen: (previous, current) =>
                    current.runtimeType != previous.runtimeType,
                builder: (context, state) {
                  return PomodoroActions(animationController);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/pomodoro_bloc/pomodoro_bloc.dart';
import 'package:flutter_habifa_v2/utils/pomodoro_alert.dart';

// ignore: must_be_immutable
class PomodoroActions extends StatelessWidget {
  CountDownController _controller = CountDownController();
  PomodoroActions(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActions(
          pomodoroBloc: BlocProvider.of<PomodoroBloc>(context),
          context: context,
          controller: _controller),
    );
  }

  List<Widget> _mapStateToActions(
      {PomodoroBloc pomodoroBloc,
      BuildContext context,
      CountDownController controller}) {
    final PomodoroState currentState = pomodoroBloc.state;

    if (currentState is PomodoroRunningState) {
      return [
        FloatingActionButton(
            child: Icon(Icons.pause),
            onPressed: () {
              pomodoroBloc.add(PomodoroPausedEvent());
              controller.pause();
            })
      ];
    }
    if (currentState is PomodoroPausedState) {
      return [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          label: Text("Bitir"),
        ),
        FloatingActionButton.extended(
          onPressed: () {
            pomodoroBloc.add(PomodoroResumeEvent());
            controller.resume();
          },
          icon: Icon(Icons.play_arrow),
          label: Text("Devam"),
        ),
      ];
    }
    if (currentState is PomodoroBreakPausedState) {
      return [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            _pomodoroAlertDialog(context, currentState);
            
          },
          icon: Icon(Icons.arrow_back_ios),
          label: Text("Bitir"),
        ),
        FloatingActionButton.extended(
          onPressed: () {
            pomodoroBloc.add(PomodoroResumeEvent());
            controller.resume();
          },
          icon: Icon(Icons.play_arrow),
          label: Text("Devam"),
        ),
      ];
    }

    if (currentState is PomodoroComplatedState) {
      return [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            _pomodoroAlertDialog(context, currentState);
          },
          icon: Icon(Icons.arrow_back_ios),
          label: Text("Bitir"),
        ),
        FloatingActionButton.extended(
          onPressed: () {
            pomodoroBloc.add(PomodoroBreakEvent(duration: 300));
            controller.restart();
          },
          icon: Icon(Icons.play_arrow),
          label: Text("Ara"),
        ),
      ];
    }
    if (currentState is PomodoroBreakRunningState) {
      return [
        FloatingActionButton(
          onPressed: () {
            pomodoroBloc.add(PomodoroPausedEvent());
            controller.pause();
          },
          child: Icon(Icons.pause),
        )
      ];
    }
    if (currentState is PomodoroBreakComplatedState) {
      return [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
            _pomodoroAlertDialog(context, currentState);
          },
          icon: Icon(Icons.arrow_back_ios),
          label: Text("Bitir"),
        ),
        FloatingActionButton.extended(
          onPressed: () {
            pomodoroBloc.add(
                PomodoroStartedEvent(duration: 1500, tour: currentState.tour));
            controller.restart();
          },
          icon: Icon(Icons.play_arrow),
          label: Text("Tur atla"),
        ),
      ];
    }

    return [];
  }

  void _pomodoroAlertDialog(
      BuildContext context,currentState) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PomodoroAlert(
            alertTitle: richTitle("Tebrikler"),
            alertSubtitle: richSubtitle(
                currentState.tour.toString() + " " + "tur tamamladınız"),
            alertType: PomodoroAlertType.SUCCESS,
            actions: <Widget>[
              FlatButton(
                child: Text("Tamam"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("İptal"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

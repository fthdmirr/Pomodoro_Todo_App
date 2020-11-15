part of 'pomodoro_bloc.dart';

abstract class PomodoroEvent extends Equatable {
  const PomodoroEvent();

  @override
  List<Object> get props => [];
}

class PomodoroStartedEvent extends PomodoroEvent {
  final int duration;
  final int tour;

  const PomodoroStartedEvent({@required this.duration, @required this.tour});
  @override
  List<Object> get props => [tour];
}

class PomodoroPausedEvent extends PomodoroEvent {}

class PomodoroResumeEvent extends PomodoroEvent {}


class PomodoroBreakEvent extends PomodoroEvent {
  final int duration;
  const PomodoroBreakEvent({@required this.duration});
}

class PomodoroTickedEvent extends PomodoroEvent {
  final int duration;
  final int tour;
  const PomodoroTickedEvent({@required this.duration, @required this.tour});
  @override
  List<Object> get props => [duration];
}

class PomodoroBreakTickedEvent extends PomodoroEvent {
  final int duration;
  final int tour;
  const PomodoroBreakTickedEvent(
      {@required this.duration, @required this.tour});
  @override
  List<Object> get props => [duration];
}

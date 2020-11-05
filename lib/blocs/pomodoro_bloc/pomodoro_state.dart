part of 'pomodoro_bloc.dart';

abstract class PomodoroState extends Equatable {
  final int duration;
  final int tour;
  const PomodoroState(this.duration, this.tour);

  @override
  List<Object> get props => [duration, tour];
}

class PomodoroInitialState extends PomodoroState {
  PomodoroInitialState(int duration, int tour) : super(duration, tour);
}

class PomodoroPausedState extends PomodoroState {
  PomodoroPausedState(int duration, int tour) : super(duration, tour);
}

class PomodoroResumeState extends PomodoroState {
  PomodoroResumeState(int duration, int tour) : super(duration, tour);
}

class PomodoroRunningState extends PomodoroState {
  PomodoroRunningState(int duration, int tour) : super(duration, tour);
}

class PomodoroBreakRunningState extends PomodoroState {
  PomodoroBreakRunningState(int duration, int tour) : super(duration, tour);
}

class PomodoroBreakPausedState extends PomodoroState {
  PomodoroBreakPausedState(int duration, int tour) : super(duration, tour);
}

class PomodoroBreakResumeState extends PomodoroState {
  PomodoroBreakResumeState(int duration, int tour) : super(duration, tour);
}

class PomodoroBreakComplatedState extends PomodoroState {
  PomodoroBreakComplatedState({int duration, int tour}) : super(0, tour);
}

class PomodoroComplatedState extends PomodoroState {
  PomodoroComplatedState({int duration, int tour}) : super(0, tour);
}

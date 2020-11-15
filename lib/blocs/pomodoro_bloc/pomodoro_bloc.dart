import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/utils/pomodoro_ticker.dart';
import 'package:vibration/vibration.dart';

part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  final Ticker _ticker;
  static const int _duration = 1500;
  static const int _tour = 0;

  StreamSubscription<int> _tickerSubscription;

  PomodoroBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker,
        super(PomodoroInitialState(_duration, _tour));

  @override
  Stream<PomodoroState> mapEventToState(
    PomodoroEvent event,
  ) async* {
    if (event is PomodoroStartedEvent) {
      yield* _mapPomodoroStartedToState(event);
    }
    if (event is PomodoroPausedEvent) {
      yield* _mapPomodoroPausedToState(event);
    }
    if (event is PomodoroResumeEvent) {
      yield* _mapPomodoroResumeToState(event);
    }
    if (event is PomodoroBreakEvent) {
      yield* _mapPomodoroBreakToState(event);
    }
    if (event is PomodoroTickedEvent) {
      yield* _mapPomodoroTickedToState(event);
    }
    if (event is PomodoroBreakTickedEvent) {
      yield* _mapPomodoroBreakTicketToState(event);
    }
  }

  Stream<PomodoroState> _mapPomodoroStartedToState(
      PomodoroStartedEvent event) async* {
    yield PomodoroRunningState(event.duration, state.tour + 1);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen(
        (duration) =>
            add(PomodoroTickedEvent(duration: duration, tour: state.tour)));
  }

  Stream<PomodoroState> _mapPomodoroPausedToState(
      PomodoroPausedEvent event) async* {
    if (state is PomodoroRunningState) {
      _tickerSubscription?.pause();
      yield PomodoroPausedState(state.duration, state.tour);
    }
    if (state is PomodoroBreakRunningState) {
      _tickerSubscription?.pause();
      yield PomodoroBreakPausedState(state.duration, state.tour);
    }
  }

  Stream<PomodoroState> _mapPomodoroResumeToState(
      PomodoroResumeEvent event) async* {
    if (state is PomodoroPausedState) {
      _tickerSubscription?.resume();
      yield PomodoroRunningState(state.duration, state.tour);
    }
    if (state is PomodoroBreakPausedState) {
      _tickerSubscription?.resume();
      yield PomodoroBreakRunningState(state.duration, state.tour);
    }
  }

  Stream<PomodoroState> _mapPomodoroBreakToState(
      PomodoroBreakEvent event) async* {
    yield PomodoroBreakRunningState(event.duration, state.tour);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen(
        (duration) => add(
            PomodoroBreakTickedEvent(duration: duration, tour: state.tour)));
  }

  Stream<PomodoroState> _mapPomodoroTickedToState(
      PomodoroTickedEvent event) async* {
    if (event.duration > 0) {
      yield PomodoroRunningState(event.duration, event.tour);
    } else {
      yield PomodoroComplatedState(tour: state.tour);
      Vibration.vibrate(duration: 1500);
    }
  }

  Stream<PomodoroState> _mapPomodoroBreakTicketToState(
      PomodoroBreakTickedEvent event) async* {
    if (event.duration > 0) {
      yield PomodoroBreakRunningState(event.duration, state.tour);
    } else {
      yield PomodoroBreakComplatedState(tour: state.tour);
      Vibration.vibrate(duration: 1000);
    }
  }

}

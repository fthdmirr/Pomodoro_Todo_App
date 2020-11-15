import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/model/habit_models.dart';
import 'package:flutter_habifa_v2/repository/habit_repo.dart';

part 'habit_event.dart';
part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final HabitRepository habitRepository;
  HabitBloc({@required this.habitRepository}) : super(HabitLoadedState());

  @override
  Stream<HabitState> mapEventToState(
    HabitEvent event,
  ) async* {
    if (event is HabitLoadedEvent) {
      yield* _mapHabitLoadedToState();
    }
    if (event is HabitAddedEvent) {
      yield* _mapHabitAddedToState(event);
    }

    if (event is HabitDeleteEvent) {
      yield* _mapHabitDeleteToState(event);
    }
    if (event is HabitUpdatedEvent) {
      yield* _mapHabitUpdateToState(event);
    }
  }

  Stream<HabitState> _mapHabitLoadedToState() async* {
    if (state is HabitLoadedState) {
      try {
        final List<Habit> habitList = await habitRepository.getAllHabits();
        yield HabitLoadedState(habitList);
        print("getirilen:" + habitList.toList().toString());
      } catch (e) {
        print("HabitBringError: " + e.toString());
        yield HabitErrorState();
      }
    }
  }

  Stream<HabitState> _mapHabitAddedToState(HabitAddedEvent event) async* {
    if (state is HabitLoadedState) {
      try {
        await habitRepository.insertHabit(event.habitList);
        final List<Habit> habitList = await habitRepository.getAllHabits();
        yield HabitLoadedState(habitList);
      } catch (e) {
        yield HabitErrorState();
        print("HabitAddError" + e.toString());
      }
    }
  }

  Stream<HabitState> _mapHabitDeleteToState(HabitDeleteEvent event) async* {
    if (state is HabitLoadedState) {
      try {
        await habitRepository.deleteHabit(event.habitList.habitID);
        final List<Habit> habitList = await habitRepository.getAllHabits();
        yield HabitLoadedState(habitList);
      } catch (e) {
        print("HabitDeleteState" + e.toString());
        yield HabitErrorState();
      }
    }
  }

  Stream<HabitState> _mapHabitUpdateToState(HabitUpdatedEvent event) async* {
    if (state is HabitLoadedState) {
      try {
        await habitRepository.updateHabit(event.habitList);
        final List<Habit> habitList = await habitRepository.getAllHabits();
        yield HabitLoadedState(habitList);
      } catch (e) {
        print(e.toString());
        yield HabitErrorState();
      }
    }
  }
}

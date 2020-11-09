part of 'habit_bloc.dart';

abstract class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object> get props => [];
}

class HabitLoadedEvent extends HabitEvent {}

class HabitAddedEvent extends HabitEvent {
  final Habit habitList;

  const HabitAddedEvent({this.habitList});

  @override
  List<Object> get props => [habitList];
}

class HabitDeleteEvent extends HabitEvent {
  final Habit habitList;

  const HabitDeleteEvent({this.habitList});

  @override
  List<Object> get props => [habitList];
}

part of 'habit_bloc.dart';

abstract class HabitState extends Equatable {
  const HabitState();

  @override
  List<Object> get props => [];
}

class HabitLoadedState extends HabitState {
  final List<Habit> habitList;
  const HabitLoadedState([this.habitList=const[]]);

  @override
  List<Object> get props => [habitList];
}

class HabitErrorState extends HabitState{}

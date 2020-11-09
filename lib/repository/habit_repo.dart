import 'package:flutter_habifa_v2/model/habit_models.dart';
import 'package:flutter_habifa_v2/utils/database_helper.dart';

class HabitRepository {
  final _habitRepo = DBHelper();

  Future getAllHabits() async => await _habitRepo.bringHabitMap();

  Future insertHabit(Habit habit) async => await _habitRepo.addHabit(habit);

  Future deleteHabit(int id) async => await _habitRepo.deleteHabit(id);
}

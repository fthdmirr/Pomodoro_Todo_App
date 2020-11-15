import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/habit_tracker_bloc/habit_bloc/habit_bloc.dart';
import 'package:flutter_habifa_v2/model/habit_models.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/days_date.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/title_icon.dart';

class HabitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<HabitBloc, HabitState>(builder: (context, state) {
      if (state is HabitLoadedState) {
        List<Habit> habitList = state.habitList;
        return ListView.builder(
          itemCount: state.habitList.length,
          itemBuilder: (context, index) {
            print(state.habitList.toList());
            return state.habitList.length != 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _screenHeight / 5.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TitleAndIcon(habitList[index].habitName,
                                    habitList[index].habitFrequenceName)),
                            Center(child: DaysAndDate()),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text("Alışkanlık yok"),
                  );
          },
        );
      } else if (state is HabitErrorState) {
        return Center(child: Text("Beklenmedik bir hata oluştu"));
      } else
        return null;
    });
  }
}

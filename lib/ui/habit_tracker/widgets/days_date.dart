import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/habit_tracker_bloc/habit_bloc/habit_bloc.dart';
import 'package:flutter_habifa_v2/model/habit_models.dart';
import 'package:intl/intl.dart';

class DaysAndDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: _screenHeight / 10,
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) {
            if (state is HabitLoadedState) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    var habitDay = DateTime.now().day + index;
                    var habitDateTime = DateFormat.E('tr_TR')
                        .format(DateTime.now().add(Duration(days: index)));
                    List<Habit> habitList = state.habitList;
                    
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: _screenHeight / 80,
                        ),
                        Text(
                          habitDateTime,
                          style: TextStyle(
                              fontSize: _screenHeight / 60,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: _screenHeight / 80,
                          width: _screenHeight / 12,
                        ),
                        Expanded(
                            child: habitList[index].isComplated == 0
                                ? InkWell(
                                    onDoubleTap: () {
                                      if (habitList[index].isComplated == 0) {
                                        habitList[index].isComplated = 1;
                                      } else {
                                        habitList[index].isComplated = 0;
                                      }
                                      BlocProvider.of<HabitBloc>(context).add(
                                        HabitUpdatedEvent(
                                          habitList: Habit.withID(
                                              habitList[index].habitID,
                                              habitList[index].habitName,
                                              habitList[index].habitFrequenceID,
                                              habitList[index].isComplated,
                                              habitList[index]
                                                  .habitFrequenceName),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: _screenHeight / 15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: _screenHeight / 50,
                                          color: Color(0xffF95A5A),
                                        ),
                                        shape: BoxShape.circle,
                                        color: Color(0xffF95A5A),
                                      ),
                                      child: Center(
                                        child: Text(
                                          habitDay.toString(),
                                          style: TextStyle(
                                              fontSize: _screenHeight / 60,
                                              color: Colors.white30),
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onDoubleTap: () {
                                      if (habitList[index].isComplated == 0) {
                                        habitList[index].isComplated = 1;
                                      } else {
                                        habitList[index].isComplated = 0;
                                      }
                                      BlocProvider.of<HabitBloc>(context).add(
                                        HabitUpdatedEvent(
                                          habitList: Habit.withID(
                                              habitList[index].habitID,
                                              habitList[index].habitName,
                                              habitList[index].habitFrequenceID,
                                              habitList[index].isComplated,
                                              habitList[index]
                                                  .habitFrequenceName),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: _screenHeight / 19,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/checked.png")),
                                        border: Border.all(
                                          width: _screenHeight / 50,
                                          color: Color(0xffF95A5A),
                                        ),
                                        shape: BoxShape.circle,
                                        color: Color(0xffF95A5A),
                                      ),
                                    ),
                                  ))
                      ],
                    );
                  });
            } else {
              Center(
                child: Text("Beklenmedik bir hata oluştu"),
              );
            }
          },
        ));
  }
}

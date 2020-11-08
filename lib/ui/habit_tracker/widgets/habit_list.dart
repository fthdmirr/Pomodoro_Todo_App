import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/days_date.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/title_icon.dart';

class HabitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: _screenHeight / 5.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TitleAndIcon()),
                  Center(
                    child: DaysAndDate()
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

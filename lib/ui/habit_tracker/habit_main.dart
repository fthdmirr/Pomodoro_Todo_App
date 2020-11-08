import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/habit_list.dart';

class HabitMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF95A5A),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Alışkanlıklar",
          style: TextStyle(
              fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, fontSize: 35),
        ),
        actions: [
          IconButton(
            iconSize: _screenHeight / 20,
            color: Colors.black54,
            icon: Icon(Icons.add),
            onPressed: () {
              //_showDialog();
            },
          )
        ],
        centerTitle: true,
      ),
      body: HabitList(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/add/frequence_pick.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/add/name_input.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class HabitAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    var _formKey;
    TextEditingController _controller = TextEditingController();
    TextStyle _textStyle = TextStyle(
        color: Colors.blueGrey,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.bold,
        fontSize: 30);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Alışkanlık Ekle",
          style: TextStyle(
              fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
            circleColors: [Colors.white, Colors.orange, Colors.redAccent],
            iconTheme: IconThemeData(color: Color(0xffF95A5A)),
            activeIconTheme: IconThemeData(opacity: 2.0),
            backgroundColor: Color(0xffF95A5A),
            titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
            activeTitleStyle: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            actionButtonDetails: SCActionButtonDetails(
                icon: Icon(Icons.keyboard_arrow_up),
                color: Colors.red,
                elevation: 0),
            elevation: 0,
            items: [],
            circleItems: [
              SCItem(
                  icon: Icon(
                    Icons.add,
                    size: 50,
                  ),
                  onPressed: () {
                   //BlocProvider.of<HabitBloc>(context).add();
                  }),
              SCItem(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            bnbHeight: 100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _screenHeight / 20,
              ),
              Text(
                "Alışkanlık",
                style: _textStyle,
              ),
              SizedBox(
                height: _screenHeight / 200,
              ),
              HabitNameInput(
                controller: _controller,
              ),
              SizedBox(
                height: _screenHeight / 50,
              ),
              Text(
                "Tekrar",
                style: _textStyle,
              ),
              FrequencePick(),
              SizedBox(
                height: _screenHeight / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

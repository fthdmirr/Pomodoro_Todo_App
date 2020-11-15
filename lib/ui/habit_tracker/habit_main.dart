import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/habit_tracker_bloc/frequence_bloc/frequence_bloc.dart';
import 'package:flutter_habifa_v2/blocs/habit_tracker_bloc/habit_bloc/habit_bloc.dart';
import 'package:flutter_habifa_v2/model/frequence_models.dart';
import 'package:flutter_habifa_v2/model/habit_models.dart';
import 'package:flutter_habifa_v2/ui/habit_tracker/widgets/habit_list.dart';
import 'package:intl/intl.dart';

class HabitMain extends StatefulWidget {
  @override
  _HabitMainState createState() => _HabitMainState();
}

class _HabitMainState extends State<HabitMain> {
  final _formKey = GlobalKey<FormState>();

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
              BlocProvider.of<FrequenceBloc>(context)
                  .add(FrequenceLoadedEvent());
              _showDialog(context);
            },
          )
        ],
        centerTitle: true,
      ),
      body: HabitList(),
    );
  }

  _showDialog(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController controller = TextEditingController();
    Frequence _pickedFrequence;
    int frequenceID = 1;

    TextStyle _textStyle = TextStyle(
        color: Colors.blueGrey,
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.bold,
        fontSize: _screenHeight / 35);
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SimpleDialog(
            title: Text(
              "Alışkanlık Ekle",
              style:
                  TextStyle(color: Colors.orange, fontSize: _screenHeight / 25),
            ),
            children: [
              Form(
                key: _formKey,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: _screenHeight / 3.5,
                          child: TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Yapılacak alışkanlık",
                              hintStyle: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontStyle: FontStyle.italic,
                                  fontSize: _screenHeight / 35,
                                  color: Colors.grey),
                            ),
                            validator: (String value) {
                              if (value.length < 2) {
                                return 'En az 2 harf giriniz';
                              } else
                                return null;
                            },
                            onSaved: (String value) {
                              controller.text = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _screenHeight / 50,
                      ),
                      Text(
                        "Tekrar",
                        style: _textStyle,
                      ),
                      BlocBuilder<FrequenceBloc, FrequenceState>(
                          builder: (context, state) {
                        if (state is FrequenceLoadedState) {
                          return state.frequence != null
                              ? Container(
                                  height: _screenHeight / 15,
                                  width: _screenHeight / 5,
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<Frequence>(
                                    value: _pickedFrequence,
                                    hint: Text(
                                      "Seç",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    items:
                                        _createFrequenceItems(state, context),
                                    onChanged: (Frequence value) {
                                      setState(() {
                                        _pickedFrequence = value;
                                        frequenceID = value.frequenceID;
                                      });
                                    },
                                  )),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        } else {
                          return Text("...");
                        }
                      }),
                      SizedBox(
                        height: _screenHeight / 20,
                      ),
                      RaisedButton(
                        color: Colors.amber,
                        child: Text("Kaydet"),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            final newList = Habit(
                                habitFrequenceName:
                                    _pickedFrequence.frequenceName,
                                habitName:
                                    toBeginningOfSentenceCase(controller.text),
                                habitFrequenceID: _pickedFrequence.frequenceID,
                                isComplated: 0);
                            BlocProvider.of<HabitBloc>(context)
                                .add(HabitAddedEvent(habitList: newList));
                            if (newList.habitID != 0) {
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<DropdownMenuItem> _createFrequenceItems(
      FrequenceLoadedState state, BuildContext context) {
    return state.frequence.map((value) {
      return DropdownMenuItem(
        value: value,
        child: Text(value.frequenceName, style: TextStyle(fontSize: 25)),
      );
    }).toList();
  }
}

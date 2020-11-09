import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/habit_tracker_bloc/frequence_bloc/frequence_bloc.dart';
import 'package:flutter_habifa_v2/model/frequence_models.dart';

class FrequencePick extends StatefulWidget {
  Frequence pickedFrequence;
  FrequencePick({this.pickedFrequence});
  @override
  _FrequencePickState createState() => _FrequencePickState();
}

class _FrequencePickState extends State<FrequencePick> {
  int frequenceID = 1;

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<FrequenceBloc, FrequenceState>(
        builder: (context, state) {
      if (state is FrequenceLoadedState) {
        return state.frequence != null
            ? Container(
                height: _screenHeight / 15,
                width: _screenHeight / 5,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<Frequence>(
                  value: widget.pickedFrequence,
                  hint: Text(
                    "Seç",
                    style: TextStyle(fontSize: 25),
                  ),
                  items: _createFrequenceItems(state, context),
                  onChanged: (Frequence value) {
                    setState(() {
                      widget.pickedFrequence = value;
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
    });
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/tobuy_bloc/tobuy_bloc.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    // ignore: missing_return
    return BlocBuilder<TobuyBloc, TobuyState>(builder: (context, state) {
      if (state is TobuyLoadedState) {
        return state.tobuyList.length != 0
            ? ListView.builder(
                itemCount: state.tobuyList.length,
                itemBuilder: (context, index) {
                  return state.tobuyList[index].isComplate == 1
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: _screenHeight / 11.5,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey[200], width: 0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                color: Colors.white,
                                child: ListTile(
                                  leading: Container(
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Icon(
                                          Icons.done,
                                          size: 26.0,
                                          color: Colors.indigoAccent,
                                        )),
                                  ),
                                  title: Text(
                                    state.tobuyList[index].tobuyName,
                                    style: TextStyle(
                                      fontSize: _screenHeight / 43,
                                      fontFamily: 'RobotoMono',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle:
                                      Text(state.tobuyList[index].tobuyDate),
                                )),
                          ),
                        )
                      : null;
                },
              )
            : Center(
                child: Text("Geçmişin Temiz"),
              );
      } else if (state is TobuyErrorState) {
        return Center(
          child: Text("Beklenmedik bir hata oluştu"),
        );
      }
    });
  }
}

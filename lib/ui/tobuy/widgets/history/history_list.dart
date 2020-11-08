import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/tobuy_bloc/tobuy_bloc.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    final DismissDirection _dismissDirection = DismissDirection.horizontal;
    List<TobuyListModel> tobuyHistoryList;
    // ignore: missing_return
    return BlocBuilder<TobuyBloc, TobuyState>(builder: (context, state) {
      if (state is TobuyLoadedState) {
        return state.tobuyList.length != 0
            ? ListView.builder(
                itemCount: state.tobuyList.length,
                itemBuilder: (context, index) {
                  tobuyHistoryList = state.tobuyList;
                  if (state.tobuyList[index].isComplate != 0) {
                    return Dismissible(
                      background: Container(
                        height: _screenHeight / 15,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Siliniyor",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        color: Colors.redAccent,
                      ),
                      key: ObjectKey(tobuyHistoryList),
                      direction: _dismissDirection,
                      onDismissed: (direction) {
                        BlocProvider.of<TobuyBloc>(context).add(
                            TobuyDeletedEvent(TobuyListModel.withID(
                                tobuyHistoryList[index].tobuyID,
                                tobuyHistoryList[index].tobuyName,
                                tobuyHistoryList[index].isComplate,
                                tobuyHistoryList[index].tobuyDate,
                                tobuyHistoryList[index].tobuyDeleteDate)));
                      },
                      child: Padding(
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
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 0,
                    );
                  }
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

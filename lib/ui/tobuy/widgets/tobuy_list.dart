import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/tobuy_bloc/tobuy_bloc.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:flutter_habifa_v2/ui/tobuy/widgets/add/add_screen.dart';

class TobuyList extends StatefulWidget {
  @override
  _TobuyListState createState() => _TobuyListState();
}

class _TobuyListState extends State<TobuyList> {
  List<TobuyListModel> tobuyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TobuyAddScreen(),
        Expanded(
          child: Container(
              color: Color(0xffF95A5A),
              child:
                  BlocBuilder<TobuyBloc, TobuyState>(builder: (context, state) {
                if (state is TobuyLoadedState) {
                  return state.tobuyList.length != 0
                      ? _listWidget(state, context)
                      : _emptyPart(context);
                } else if (state is TobuyErrorState) {
                  return Center(child: Text("Beklenmedik bir hata oluştu"));
                } else {
                  return Center(child: Text("else"));
                }
              })),
        ),
      ],
    );
  }

  Widget _emptyPart(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: _screenHeight / 12,
        ),
        Center(
          child: Text(
            " Bugünki\n işlerini \n hemen \n ekle",
            style: TextStyle(
                color: Colors.white,
                fontSize: _screenHeight / 15,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _listWidget(TobuyLoadedState state, BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    List<TobuyListModel> tobuyList = state.tobuyList;
    return ListView.builder(
      itemCount: state.tobuyList.length,
      itemBuilder: (context, index) {
        return tobuyList[index].isComplate != tobuyList[index].tobuyDeleteDate
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: _screenHeight / 11.5,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey[200], width: 0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            if (state.tobuyList[index].isComplate == 1) {
                              state.tobuyList[index].isComplate = 0;
                              BlocProvider.of<TobuyBloc>(context).add(
                                  TobuyUpdatedEvent(TobuyListModel.withID(
                                      tobuyList[index].tobuyID,
                                      tobuyList[index].tobuyName,
                                      tobuyList[index].isComplate,
                                      tobuyList[index].tobuyDate,
                                      tobuyList[index].tobuyDeleteDate)));
                            } else {
                              state.tobuyList[index].isComplate = 1;
                              BlocProvider.of<TobuyBloc>(context).add(
                                  TobuyUpdatedEvent(TobuyListModel.withID(
                                      tobuyList[index].tobuyID,
                                      tobuyList[index].tobuyName,
                                      tobuyList[index].isComplate,
                                      tobuyList[index].tobuyDate,
                                      tobuyList[index].tobuyDeleteDate)));
                            }
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: state.tobuyList[index].isComplate == 1
                                  ? Icon(
                                      Icons.done,
                                      size: 26.0,
                                      color: Colors.indigoAccent,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      size: _screenHeight / 25,
                                      color: Colors.tealAccent,
                                    ),
                            ),
                          ),
                        ),
                        title: Text(
                          state.tobuyList[index].tobuyName,
                          style: TextStyle(
                              fontSize: _screenHeight / 43,
                              fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w500,
                              decoration: state.tobuyList[index].isComplate == 1
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      )),
                ),
              )
            : tobuyList.removeAt(index);
      },
    );
  }
}

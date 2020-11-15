import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/tobuy_bloc/tobuy_bloc.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:flutter_habifa_v2/ui/tobuy/widgets/add/add_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

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
                  return state.tobuyList.length > 0
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
            " Yapılacak\n işlerini \n hemen \n ekle",
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
    var complatedDate = DateFormat('dd-MM-yyyy-kk:mm').format(DateTime.now());
    return ListView.builder(
        itemCount: tobuyList.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: Visibility(
                visible: tobuyList[index].isComplate == 1 ? false : true,
                child: Container(
                  height: _screenHeight / 11.5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[200], width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.white,
                    child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actions: [
                          IconSlideAction(
                            caption: 'Tamam',
                            color: Colors.green,
                            icon: Icons.done,
                            onTap: () {
                              tobuyList[index].tobuyDate = complatedDate;
                              tobuyList[index].isComplate = 1;
                              BlocProvider.of<TobuyBloc>(context)
                                  .add(TobuyUpdatedEvent(TobuyListModel.withID(
                                tobuyList[index].tobuyID,
                                tobuyList[index].tobuyName,
                                tobuyList[index].isComplate,
                                tobuyList[index].tobuyDate,
                              )));
                            },
                          ),
                          IconSlideAction(
                            caption: 'Sil',
                            color: Colors.red,
                            icon: Icons.close,
                            onTap: () {
                              BlocProvider.of<TobuyBloc>(context)
                                  .add(TobuyDeletedEvent(TobuyListModel.withID(
                                tobuyList[index].tobuyID,
                                tobuyList[index].tobuyName,
                                tobuyList[index].isComplate,
                                tobuyList[index].tobuyDate,
                              )));
                            },
                          )
                        ],
                        child: ListTile(
                          leading: Container(
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.done_all,
                                    size: 26.0,
                                    color: Colors.indigoAccent,
                                  ))),
                          title: Text(state.tobuyList[index].tobuyName,
                              style: TextStyle(
                                fontSize: _screenHeight / 43,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w500,
                              )),
                        )),
                  ),
                ),
              ));
        });
  }
}

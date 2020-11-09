import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_habifa_v2/blocs/tobuy_bloc/tobuy_bloc.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:flutter_habifa_v2/utils/formfield.dart';
import 'package:intl/intl.dart';

import 'package:nice_button/NiceButton.dart';

class TobuyAddScreen extends StatefulWidget {
  @override
  _TobuyAddScreenState createState() => _TobuyAddScreenState();
}

class _TobuyAddScreenState extends State<TobuyAddScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _textFormController = TextEditingController();

  String formattedDate = DateFormat('dd-MM-yyyy-kk:mm').format(DateTime.now());

  String formattedDeleteDate = DateFormat('dd-MM-yyyy-kk:mm')
      .format(DateTime.now().add(Duration(days: 1)));

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Color(0xffF95A5A),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                controller: _textFormController,
                hintText: "Yapılacak işi giriniz",
                validator: (String value) {
                  if (value.length < 2) {
                    return 'En az 2 harf giriniz';
                  }
                },
                onSaved: (String value) {
                  _textFormController.text = value;
                },
              ),
              NiceButton(
                background: null,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(DateTime.now().toString());
                    _formKey.currentState.save();
                    final newList = TobuyListModel(
                        tobuyName:
                            toBeginningOfSentenceCase(_textFormController.text),
                        isComplate: 0,
                        tobuyDate: formattedDate,
                        tobuyDeleteDate: formattedDeleteDate);

                    BlocProvider.of<TobuyBloc>(context).add(
                      TobuyAddedEvent(newList),
                    );
                    if (newList.tobuyID != 0) {
                      _formKey.currentState.reset();
                    }
                  } else
                    return null;
                },
                width: screenHeight / 5,
                fontSize: screenHeight / 30,
                elevation: 5,
                radius: screenHeight / 30,
                text: "Ekle",
                textColor: Color(0xffF95A5A),
                gradientColors: [Colors.white, Colors.white],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_habifa_v2/ui/tobuy/widgets/history/history_list.dart';


class TobuyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffF95A5A),
        title: Text(
          "Yapılan İşler",
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              fontSize: _screenHeight / 26),
        ),
      ),
      body: HistoryList(),
    );
  }
}

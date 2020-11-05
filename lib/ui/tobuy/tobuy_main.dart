import 'package:flutter/material.dart';


import 'package:flutter_habifa_v2/ui/tobuy/widgets/tobuy_list.dart';

class ToBuyMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffF95A5A),
        title: Text(
          "Yapılacaklar Listesi",
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              fontSize: screenHeight / 26),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(
                  Icons.restore,
                  size: screenHeight / 25,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => /*TobuyHistory()*/ null));
                },
              ),
            ],
          )
        ],
      ),
      body: TobuyList(),
    );
  }
}

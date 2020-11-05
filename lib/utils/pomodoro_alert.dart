import 'dart:ui';

import 'package:flutter/material.dart';

class PomodoroAlert extends StatefulWidget {
  final Text alertTitle;

  final Text alertSubtitle;

  final int alertType;

  final List<Widget> actions;

  final double blurValue;

  final double backgroundOpacity;

  final Icon dialogIcon;

  PomodoroAlert({
    Key key,
    @required this.alertTitle,
    @required this.alertSubtitle,
    @required this.alertType,
    this.actions,
    this.blurValue,
    this.backgroundOpacity,
    this.dialogIcon,
  }) : super(key: key);

  createState() => _PomodoroAlertState();
}

class _PomodoroAlertState extends State<PomodoroAlert> {
  Map<int, AssetImage> _typeAsset = {
    PomodoroAlertType.SUCCESS:
        AssetImage("assets/images/checked2.png"),
  };

  Map<int, Color> _typeColor = {
    PomodoroAlertType.SUCCESS: Colors.green,
  };

  double deviceWidth;
  double deviceHeight;
  double dialogHeight;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;
    deviceHeight = orientation == Orientation.portrait
        ? screenSize.height
        : screenSize.width;
    dialogHeight = deviceHeight * (0.45);

    return MediaQuery(
      data: MediaQueryData(),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.blurValue != null ? widget.blurValue : 3.0,
          sigmaY: widget.blurValue != null ? widget.blurValue : 3.0,
        ),
        child: Container(
          height: deviceHeight,
          color: Colors.white.withOpacity(widget.backgroundOpacity != null
              ? widget.backgroundOpacity
              : 0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: dialogHeight - 70,
                      child: Container(
                        height: dialogHeight,
                        width: deviceWidth * 0.9,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: dialogHeight / 10),
                              widget.dialogIcon != null
                                  ? widget.dialogIcon
                                  : _defaultIcon(),
                              SizedBox(height: dialogHeight / 20),
                              widget.alertTitle,
                              SizedBox(height: dialogHeight / 20),
                              widget.alertSubtitle,
                              SizedBox(height: dialogHeight / 10),
                              widget.actions != null &&
                                      widget.actions.isNotEmpty
                                  ? _buildActions()
                                  : _defaultAction(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildActions() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions,
      ),
    );
  }

  Image _defaultIcon() {
    return Image(
      image: _typeAsset[widget.alertType],
      width: deviceHeight / 10,
      height: deviceHeight / 10,
    );
  }

  Container _defaultAction(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        elevation: 2.0,
        color: _typeColor[widget.alertType],
        child: Text(
          "GOT IT",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

Text richTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 25),
  );
}

Text richSubtitle(String subtitle) {
  return Text(
    subtitle,
    style: TextStyle(
      fontSize: 20.0,
      color: Colors.grey,
    ),
  );
}

class PomodoroAlertType {
  static const int SUCCESS = 1;
}

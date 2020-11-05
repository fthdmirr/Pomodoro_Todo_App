class TobuyListModel {
  int tobuyID;
  String tobuyName;
  int isComplate = 0;

  TobuyListModel({
    this.tobuyName,
    this.isComplate,
  });

  TobuyListModel.withID(
    this.tobuyID,
    this.tobuyName,
    this.isComplate,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['tobuyID'] = tobuyID;
    map['tobuyName'] = tobuyName;
    map['isComplate'] = isComplate;

    return map;
  }

  TobuyListModel.fromMap(Map<String, dynamic> map) {
    this.tobuyID = map['tobuyID'];
    this.tobuyName = map['tobuyName'];
    this.isComplate = map['isComplate'];
  }
}

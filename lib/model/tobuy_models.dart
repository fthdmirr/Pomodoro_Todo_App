class TobuyListModel {
  int tobuyID;
  String tobuyName;
  int isComplate = 0;
  String tobuyDate;

  TobuyListModel({
    this.tobuyName,
    this.isComplate,
    this.tobuyDate,
  });

  TobuyListModel.withID(
    this.tobuyID,
    this.tobuyName,
    this.isComplate,
    this.tobuyDate,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['tobuyID'] = tobuyID;
    map['tobuyName'] = tobuyName;
    map['isComplate'] = isComplate;
    map['tobuyDate'] = tobuyDate;

    return map;
  }

  TobuyListModel.fromMap(Map<String, dynamic> map) {
    this.tobuyID = map['tobuyID'];
    this.tobuyName = map['tobuyName'];
    this.isComplate = map['isComplate'];
    this.tobuyDate = map['tobuyDate'];
  }
}

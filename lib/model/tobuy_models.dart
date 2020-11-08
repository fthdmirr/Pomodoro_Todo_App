class TobuyListModel {
  int tobuyID;
  String tobuyName;
  int isComplate = 0;
  String tobuyDate;
  String tobuyDeleteDate;

  TobuyListModel({
    this.tobuyName,
    this.isComplate,
    this.tobuyDate,
    this.tobuyDeleteDate,
  });

  TobuyListModel.withID(
    this.tobuyID,
    this.tobuyName,
    this.isComplate,
    this.tobuyDate,
    this.tobuyDeleteDate,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['tobuyID'] = tobuyID;
    map['tobuyName'] = tobuyName;
    map['isComplate'] = isComplate;
    map['tobuyDate'] = tobuyDate;
    map['tobuyDeleteDate'] = tobuyDeleteDate;

    return map;
  }

  TobuyListModel.fromMap(Map<String, dynamic> map) {
    this.tobuyID = map['tobuyID'];
    this.tobuyName = map['tobuyName'];
    this.isComplate = map['isComplate'];
    this.tobuyDate = map['tobuyDate'];
    this.tobuyDeleteDate = map['tobuyDeleteDate'];
  }
}

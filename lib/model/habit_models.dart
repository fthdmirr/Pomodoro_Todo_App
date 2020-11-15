class Habit {
  int habitID;
  String habitName;
  int habitFrequenceID;
  String habitFrequenceName;
  int isComplated = 0;

  Habit({
    this.habitName,
    this.habitFrequenceID,
    this.isComplated,
    this.habitFrequenceName,
  });
  Habit.withID(
    this.habitID,
    this.habitName,
    this.habitFrequenceID,
    this.isComplated,
    this.habitFrequenceName,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['habitID'] = habitID;
    map['habitName'] = habitName;
    map['habitFrequenceID'] = habitFrequenceID;
    map['habitFrequenceName'] = habitFrequenceName;
    map['isComplated'] = isComplated;

    return map;
  }

  Habit.fromMap(Map<String, dynamic> map) {
    this.habitID = map['habitID'];
    this.habitName = map['habitName'];
    this.habitFrequenceID = map['habitFrequenceID'];
    this.habitFrequenceName = map['habitFrequenceName'];
    this.isComplated = map['isComplated'];
  }
}

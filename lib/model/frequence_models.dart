class Frequence {
  int frequenceID;
  String frequenceName;

  Frequence(
    this.frequenceName,
  );
  Frequence.withID(this.frequenceID, this.frequenceName);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['frequenceID'] = frequenceID;
    map['frequenceName'] = frequenceName;

    return map;
  }

  Frequence.fromMap(Map<String, dynamic> map) {
    this.frequenceID = map['frequenceID'];
    this.frequenceName = map['frequenceName'];
  }
}
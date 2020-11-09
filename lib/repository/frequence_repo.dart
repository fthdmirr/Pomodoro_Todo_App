import 'package:flutter_habifa_v2/model/frequence_models.dart';
import 'package:flutter_habifa_v2/utils/database_helper.dart';

class FrequenceRepository {
  final _frequenceRepo = DBHelper();

  Future getAllFrequences() async => await _frequenceRepo.bringFrequenceMap();

  Future insertFrequence(Frequence frequence) async =>
      await _frequenceRepo.addFrequence(frequence);
}

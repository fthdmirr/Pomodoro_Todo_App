
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:flutter_habifa_v2/utils/database_helper.dart';

class TobuyRepository {
  final _tobuyRepo = DBHelper();

  Future getAllTobuys() async =>await _tobuyRepo.bringTobuyMapList();

  Future insertTobuy(TobuyListModel tobuyListModel) async =>
      await _tobuyRepo.addTobuyList(tobuyListModel);

  Future updateTobuy(TobuyListModel tobuyListModel) async =>
      await _tobuyRepo.updateTobuyList(tobuyListModel);

  Future deleteTobuy(int id) async =>await _tobuyRepo.deleteTobuyList(id);
}

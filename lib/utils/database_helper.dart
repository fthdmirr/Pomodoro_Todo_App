import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_habifa_v2/model/tobuy_models.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DBHelper {
  static DBHelper _dbHelper;
  static Database _database;

  DBHelper._internal();

  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._internal();
      return _dbHelper;
    } else
      return _dbHelper;
  }

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else
      return _database;
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "habifaDB.db");

    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets/db", "habifa.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes);
    } else {
      print("Opening existing database");
    }
    _database = await openDatabase(
      path,
    );

    return _database;
  }

  Future<List<Map<String, dynamic>>> bringTobuyList() async {
    var db = await _getDatabase();
    var result = await db.query("tobuyList", orderBy: 'tobuyID DESC');
    return result;
  }

  Future<List<TobuyListModel>> bringTobuyMapList() async {
    var bringTobuyMap = await bringTobuyList();
    var tobuyList = List<TobuyListModel>();
    debugPrint(bringTobuyMap.toString());
    for (Map map in bringTobuyMap) {
      tobuyList.add(TobuyListModel.fromMap(map));
    }

    return tobuyList;
  }

  Future<int> addTobuyList(TobuyListModel tobuyList) async {
    var db = await _getDatabase();

    var result = await db.insert('tobuyList', tobuyList.toMap());
    return result;
  }

  Future<int> updateTobuyList(TobuyListModel tobuyList) async {
    var db = await _getDatabase();
    var result = await db.update('tobuyList', tobuyList.toMap(),
        where: 'tobuyID=?', whereArgs: [tobuyList.tobuyID]);
    return result;
  }

  Future<int> deleteTobuyList(int tobuyID) async {
    var db = await _getDatabase();
    var result =
        await db.delete('tobuyList', where: 'tobuyID=?', whereArgs: [tobuyID]);
    return result;
  }
}

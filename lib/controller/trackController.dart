import 'package:HealthTracker/model/trackModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class TrackController {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "track.db");

    var mydb = await openDatabase(path, version: 26, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE track(id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,heart_beat TEXT NOT NULL,blood_pressure	TEXT NOT NULL,suger TEXT NOT NULL,temp TEXT NOT NULL)');
  }
  Future<int> insertdb(Map<String, dynamic> data) async {
    Database? db_clint = await db;
    var result = db_clint!.insert("track", data);
    return result;
  }

  Future<TrackModel?> getSingleRowDB(int id) async {
    Database? db_client = await db;
    var result = await db_client!.query('track', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      var row = result.first;
      return TrackModel(
        id: row['id'],
        heart_beat: row['heart_beat'],
        blood_pressure: row['blood_pressure'],
        suger: row['suger'],
        temp: row['temp'],
      );
    }
    return null;
  }


  Future<List<TrackModel?>> getDB() async {
    List<TrackModel?> list = [];
    Database? db_clint = await db;
    var result = await db_clint!.query('todo');
    for (var i in result) {
      list.add(TrackModel(
        id: i["id"],
        heart_beat: i["heart_beat"],
        blood_pressure: i["blood_pressure"],
        suger: i["suger"],
        temp: i["temp"],
      ));
    }
    return list;
  }
}

import 'package:flutter/foundation.dart';
import 'package:m_core/m_core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

///
/// Created by handy on 09/08/22
/// Macbook Pro Retina 2015.
/// handikadwiputradev@gmail.com
///

class DatabaseHelper {

  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDB();
    return _database;
  }

  static const String _tblWeather = 'weather';

  Future<Database?> _initDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, ConfigApp.tagMasterData);
    var todoDatabase = openDatabase(dbPath, version: 1, onCreate: _createDB);
    return todoDatabase;
  }

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute (''' 
          CREATE TABLE IF NOT EXISTS $_tblWeather (
              id INTEGER PRIMARY KEY NOT NULL,
              city TEXT NOT NULL,
              latitude TEXT NOT NULL,
              longitude TEXT NOT NULL,
              temperature TEXT NULL,
              description TEXT,
              );
              ''');
    } catch (e, s) {
      if (kDebugMode) {
        print('catch table $_tblWeather :${e.toString()}');
        print(s);
      }
    }
  }

  //  TODO HANDY : DATA Weather (10 Agustus 2022)
  Future<void> insertWeather (WeatherTable weatherTable) async {
    final db = await database;
    await db!.insert(_tblWeather, weatherTable.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteDataWeather() async {
    final db = await database;
    await db!.delete(_tblWeather);
  }

  Future<List<Map<String,dynamic>>> getDataWeather() async {
    final db = await database;
    final List<Map<String,dynamic>> results = await db!.query(_tblWeather,limit: 1,distinct: true);
    return results;
  }


}
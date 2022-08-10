import 'package:flutter/foundation.dart';
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
    String dbPath = join(databasesPath, 'MasterWeather');
    var todoDatabase = openDatabase(dbPath, version: 1, onCreate: _createDB);
    return todoDatabase;
  }

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute (''' 
          CREATE TABLE IF NOT EXISTS $_tblWeather (
              id INTEGER PRIMARY KEY NOT NULL,
              city TEXT NOT NULL,
              country TEXT NOT NULL,
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

}
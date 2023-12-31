import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLite {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'currency.db');
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "currency"(
     "id"  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
     "name" TEXT NOT NULL,
     "code" TEXT NOT NULL,
     "name_plural" TEXT ,
     "symbol_native" TEXT NOT NULL,
     "symbol" TEXT,
     "decimal_digits" REAL,
     "rounding" REAL
    )
    ''');
    debugPrint('======== Create Table ========');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    debugPrint('=========== upgraded ===========');
  }

  Future<List<Map<String,dynamic>>> readData(String sql) async {
    try {
      Database? myDB = await db;
      List<Map<String, dynamic>> response = await myDB.rawQuery(sql);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  insertData(String sql) async {
    try {
      Database? myDB = await db;
      int response = await myDB.rawInsert(sql);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  updateData(String sql) async {
    try {
      Database? myDB = await db;
      int response = await myDB.rawUpdate(sql);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  deleteData(String sql) async {
    try {
      Database? myDB = await db;
      int response = await myDB.rawDelete(sql);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

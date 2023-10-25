import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'contact1.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        'CREATE TABLE "contactApp" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,"name" Text NOT NULL, "number" Text NOT NULL ,"image" Text NOT NULL)');
    batch.commit();
    print('onCreate=================================');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('_onUpgrade=================================');
  }


  Future<List<Map>?> read() async {
    Database? myDb = await db;
    List<Map>? response = await myDb?.query("contactApp");
    return response;
  }

  insert({
    required String name,
    required String number,
    required String image,
  }) async {
    Database? myDb = await db;
    int? response = await myDb?.insert(
      "contactApp",
      {
        'name': name,
        'number': number,
        'image': image,
      },
    );
    return response;
  }

  delete(int id) async {
    Database? myDb = await db;
    int? response = await myDb?.delete("contactApp", where: 'id =$id');
    return response;
  }

  update({required int id,  required String name,
    required String number,
    required String image,}) async {
    Database? myDb = await db;
    int? response = await myDb?.update("contactApp",      {
      'name': name,
      'number': number,
      'image': image,
    },where: 'id =$id');
    return response;
  }


  deleteMyDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'contact1.db');
    await deleteDatabase(path);
  }

}

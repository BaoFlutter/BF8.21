import 'dart:io';


import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:widget_flutter/models/information.dart';

class InformationDatabase {
  final String DB_NAME = "information.db";
  final String TABLE = "information";
  final String ID = "id";
  final String USER_NAME = "user_name";
  final String AGE = "age";


  static final InformationDatabase _instance = InformationDatabase._();
  static Database? _database;

  InformationDatabase._();

  factory InformationDatabase() {
    return _instance;
  }

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();
    return _database;
  }
/*
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/dicts", DB_NAME));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }
    // open the database
    var db = await openDatabase(path, readOnly: true);
    return db;
  }

 */


   // Dùng cho tự tạo database , không có database sẵn trong assets
  Future<Database> init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, DB_NAME);

    var database = openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }


  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $TABLE(
        $ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $USER_NAME TEXT,
        $AGE INTEGER)
    ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addInfor(Information infor) async {
    var client = await db;
    return client!.insert(TABLE, infor.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Information?> fetchInfor(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$ID = ?', whereArgs: [id]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return Information.fromJson(maps.first);
    }
    return null;
  }

  Future<Information?> fetchNameByName(String infor) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
    client!.query(TABLE, where: '$USER_NAME = ?', whereArgs: [infor]);

    var maps = await futureMaps;
    if (maps.length != 0) {
      return Information.fromJson(maps.first);
    }
    return null;
  }


  Future<List<Information>> fetchAll() async {
    var client = await db;
    var res = await client!.query(TABLE);
    if (res.isNotEmpty) {
      var infors = res.map((wordMap) => Information.fromJson(wordMap)).toList();
      return infors;
    }
    return [];
  }

  Future<int> updateInfor(Information infor) async {
    var client = await db;
    return client!.update(TABLE, infor.toJson(),
        where: '$ID = ?', whereArgs: [infor.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> removeInfor(int id) async {
    var client = await db;
    return client!.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client!.close();
  }


}
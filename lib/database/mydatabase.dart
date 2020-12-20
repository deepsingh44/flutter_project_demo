import 'dart:io';

import 'package:expense_project_flutter/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static const DATABASE_NAME = "office.db";
  static const TABLE_NAME = "user";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PASS = "pass";
  static const DATABASE_VERSION = 1;

  MyDatabase._();

  static MyDatabase myDatabase = MyDatabase._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);
    return await openDatabase(path,
        version: 1, onOpen: (db) {}, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE_NAME ("
        "$NAME TEXT,"
        "$EMAIL TEXT primary key,"
        "$PASS TEXT)");
  }

  Future<int> insert(User user) async {
    // Get a reference to the database.
    final Database db = await database;
    return await db.insert(
      '$TABLE_NAME',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> update(User user) async {
    // Get a reference to the database.
    final db = await database;
    await db.update(
      '$TABLE_NAME',
      user.toMap(),
      where: "$EMAIL = ?",
      whereArgs: [user.email],
    );
  }

  Future<int> delete(String email) async {
    // Get a reference to the database.
    final db = await database;
    await db.delete(
      '$TABLE_NAME',
      where: "$EMAIL = ?",
      whereArgs: [email],
    );
  }

  Future<User> login(String email, String pass) async {
    final db = await database;
    var res=await db.query('$TABLE_NAME',where:'$EMAIL=? and $PASS=?',whereArgs:[email,pass]);
    if (res.length > 0) {
      return User.fromMap(res.first);
    }
    return null;
  }
}
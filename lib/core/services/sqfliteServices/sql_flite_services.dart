import 'dart:io';

import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

import 'package:synchronized/synchronized.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  //Database yapısı singleton yapıldı
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  //---------------------------------

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;
    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          var path = join(databasesPath, 'appDB.db');
          var file = new File(path);

          // check if file exists
          if (!await file.exists()) {
            // Copy from asset
            ByteData data = await rootBundle.load(join("assets", 'edufly.db'));
            List<int> bytes =
                data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            await new File(path).writeAsBytes(bytes);
          }
          // open the database
          _db = await openDatabase(path);
        }
      });
    }

    return _db;
  }

  saveUser(MyUser user) async {
    var db = await _getDatabase();

    await db.insert(
        "users",  {
      "userId": user.userId,
      "userName": user.userName,
      "userEmail": user.userEmail,
      "quarterId": user.quarterId,
      "identificationNumber":user.identificationNumber,
      "isAdmin": user.isAdmin ? 1 : 0,
      "quarterName" : user.quarterName,
      "imageUrl" : user.imageUrl,
    });
  }

  Future<Validate> currentUser() async {
    var db = await _getDatabase();
    List<Map<String, dynamic>> _result = await db.query("users");
    return Validate(data: {
      "userId": _result[0]["userId"],
      "userName": _result[0]["userName"],
      "userEmail": _result[0]["userEmail"],
      "quarterId": _result[0]["quarterId"],
      "identificationNumber": _result[0]["identificationNumber"],
      "isAdmin": _result[0]["isAdmin"] == 0 ? true : false,
      "quarterName": _result[0]["quarterName"],
      "imageUrl" : _result[0]["imageUrl"]
    }, message: "Başarılı", success: true);
  }
}

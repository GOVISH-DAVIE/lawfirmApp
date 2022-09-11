import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:hrm_employee/models/chekoutModel.dart';
import 'package:hrm_employee/models/user.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqlite3/sqlite3.dart';

class DB {
  Database? db;

  DB() {
    init();
  }
  init() async {
    Database _db = await openDatabase(
      'my_db.db',
    );
    db = _db;
  }

  // CheckingData? checkin({GeoData? position}) {
  //   DateTime _now = DateTime.now();
  //   debugPrint(_now.toIso8601String());
  //   Map data = {
  //     'latitude': position?.latitude,
  //     'longitude': position?.longitude,
  //     'checkin': _now.toUtc().toString(),
  //     'checkout': null
  //   };
  //   debugPrint(jsonEncode(data));
  //   CheckingData? _chekingData = fetchAllCheckin();
  //   if (_chekingData == null) {
  //     final stmt = db.prepare('INSERT INTO checkout (ddata) VALUES (?)');
  //     stmt.execute([jsonEncode(data)]);
  //     stmt.dispose();
  //     debugPrint('checkin');
  //   }

  //   return fetchAllCheckin();
  // }

  Future<bool> createUser(User user, id) async {
    Map u = user.toJson();
    await db?.execute('''
    CREATE TABLE if not exists user (
      id INTEGER NOT NULL PRIMARY KEY,
      ddata TEXT NOT NULL
    );
  ''');

    final stmt = db?.insert('user', {'ddata': jsonEncode(u)});
    print('user created');
    return true;
  }

  Future<bool> addUser(User user) {
    print(user.toJson());
    Future l = (createUser(user, user.userId));
    return l.then((value) => value);
  }

  Future<List> getUser() async {
    await init();
    if ((await db!
            .query('sqlite_master', where: 'name = ?', whereArgs: ['user']))
        .isEmpty) {
      await db?.execute('''
    CREATE TABLE if not exists user (
      id INTEGER NOT NULL PRIMARY KEY,
      ddata TEXT NOT NULL
    );
  ''');
    }
    var resultSet = await (db?.query('user', limit: 1, orderBy: 'id'));
    return resultSet!.toList();

    // return (User.fromJson(jsonDecode(resultSet![0]['ddata'])));
    // return jsonDecode(resultSet.rows);
  }

  // CheckingData? checkout() {
  //   DateTime _now = DateTime.now();
  //   CheckingData? _chekingData = fetchAllCheckin();
  //   // print(_chekingData?.latitude);
  //   Map data = {
  //     'latitude': _chekingData?.latitude,
  //     'longitude': _chekingData?.longitude,
  //     'checkin': _chekingData?.checkin,
  //     'checkout': _now.toUtc().toString(),
  //   };
  //   final stmt = db.prepare('UPDATE checkout SET ddata = ? WHERE id = 1');
  //   stmt.execute([jsonEncode(data)]);
  //   stmt.dispose();
  //   return fetchAllCheckin();
  // }

  // CheckingData? fetchAllCheckin() {
  //   final ResultSet resultSet = db.select('SELECT * FROM checkout');

  //   return (resultSet.isEmpty)
  //       ? null
  //       : CheckingData.fromJson(jsonDecode(resultSet[0]['ddata']));
  // }

  // deleteAllCheckin() {
  //   final ResultSet resultSet = db.select('SELECT * FROM checkout');
  //   resultSet.forEach((element) {
  //     db.select('DELETE  FROM checkout WHERE id=?', [element['id']]);
  //   });

  //   // return (resultSet.isEmpty) ? null : CheckingData.fromJson(resultSet[0]);
  // }

}

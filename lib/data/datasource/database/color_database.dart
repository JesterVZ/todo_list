import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/const/App.dart';
import 'package:todo_list/data/datasource/database/db_const.dart';

abstract interface class ColorDataBase {
  Future getAllColors();
  Future insertColor(Entity color);
  Future deleteColor();
}

class ColorDataBaseImpl with DbProvider implements ColorDataBase {
  @override
  Future deleteColor() {
    // TODO: implement deleteColor
    throw UnimplementedError();
  }

  @override
  Future<DbEntity> getAllColors() async {
    final db = await database;
    return db.query(DbProvider.colorsTableName);
  }

  @override
  Future insertColor(Entity color) async {
    final db = await database;
    await db.transaction((txn) async {
      final id = await txn.insert(DbProvider.colorsTableName, color,
          conflictAlgorithm: ConflictAlgorithm.replace);
      final results = await txn
          .query(DbProvider.colorsTableName, where: 'id = ?', whereArgs: [id]);
      var entity = results.first;
    });
  }
}

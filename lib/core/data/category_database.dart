import 'package:sqflite/sqflite.dart';
import 'package:todo_list/core/data/db_const.dart';

abstract interface class CategoryDataBase {
  Future getAllCategories();
  Future getTasksCountForCategory(int categoryId);
  Future insertCategory(Entity model);
  Future editCategory(Entity model);
  Future deleteCategory(int categoryId);
}

class CategoryDatabaseImpl with DbProvider implements CategoryDataBase {
  @override
  Future<DbEntity> getAllCategories() async {
    final db = await database;
    return db.query(DbProvider.categoriesTableName);
  }

  @override
  Future insertCategory(Entity model) async {
    final db = await database;
    await db.transaction((txn) async {
      final id = await txn.insert(DbProvider.categoriesTableName, model,
          conflictAlgorithm: ConflictAlgorithm.replace);
      await txn
          .query(DbProvider.colorsTableName, where: 'id = ?', whereArgs: [id]);
    });
  }

  @override
  Future deleteCategory(int categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future editCategory(Entity model) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }
  
  @override
  Future getTasksCountForCategory(int categoryId) async {
    final db = await database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ${DbProvider.tasksTableName} WHERE category_id = $categoryId')); 
  }
  
}

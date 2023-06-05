import 'package:todo_list/domain/model/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

typedef CategoryListEntity = List<CategoryEntityDB>;
typedef CategoryEntityDB = Map<String, dynamic>;

abstract class TaskDatabase {
  Future getAllCategories();
  Future insertCategory(CategoryModel model);
  Future editCategory(CategoryModel model);
  Future deleteCategory();
}

class TaskDatabaseImpl implements TaskDatabase {
  static Database? _database;
  static const _databaseName = 'tasks_database.db';
  static const _categoriesTableName = 'categories_table';
  static const _databaseVersion = 1;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<CategoryListEntity> getAllCategories() async {
    final db = await database;
    return db.query(_categoriesTableName);
  }

  @override
  Future insertCategory(CategoryModel model) async {
    final db = await database;
  }

  @override
  Future deleteCategory() {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future editCategory(CategoryModel model) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $_categoriesTableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
}

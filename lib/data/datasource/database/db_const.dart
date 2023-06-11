import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

typedef DbEntity = List<Entity>;
typedef Entity = Map<String, dynamic>;
mixin DbProvider {
  static const databaseName = 'tasks_database.db';
  static const categoriesTableName = 'categories_table';
  static const colorsTableName = 'colors_table';
  static const databaseVersion = 1;
  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      return openDatabase(
        join(await getDatabasesPath(), databaseName),
        onCreate: (db, _) async {
          await db.execute('''
          CREATE TABLE IF NOT EXISTS $categoriesTableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            name TEXT NOT NULL
          )
          
        ''');
          await db.execute(''' 
        CREATE TABLE IF NOT EXISTS $colorsTableName(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            value TEXT NOT NULL
          )
        ''');
        },
        version: databaseVersion,
      );
    } catch (e) {
      rethrow;
    }
  }
}

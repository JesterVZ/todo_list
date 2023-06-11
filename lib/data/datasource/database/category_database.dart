import 'package:todo_list/data/datasource/database/db_const.dart';
import 'package:todo_list/domain/model/category_model.dart';

abstract interface class CategoryDataBase {
  Future getAllCategories();
  Future insertCategory(CategoryModel model);
  Future editCategory(CategoryModel model);
  Future deleteCategory();
}

class CategoryDatabaseImpl with DbProvider implements CategoryDataBase {
  @override
  Future<DbEntity> getAllCategories() async {
    final db = await database;
    return db.query(DbProvider.categoriesTableName);
  }

  @override
  Future insertCategory(CategoryModel model) async {
    //final db = await database;
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
}

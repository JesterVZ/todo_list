import 'package:todo_list/domain/model/category_model.dart';

abstract class TaskDatabase {
  Future getAllCategories();
  Future insertCategory(CategoryModel model);
}

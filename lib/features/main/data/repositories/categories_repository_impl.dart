
import 'package:dartz/dartz.dart';
import 'package:todo_list/core/data/category_database.dart';
import 'package:todo_list/core/utils/error/failure.dart';
import 'package:todo_list/features/new_category/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';



class CategoriesRepositoryImpl implements GetCategoriesRepository {
  final CategoryDataBase _taskDatabase;
  final CategotyMapper _categoryMapper;
  CategoriesRepositoryImpl(this._taskDatabase, this._categoryMapper);


  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    final categoryListMap = await _taskDatabase.getAllCategories();
    final categoryList = _categoryMapper.transformToModel(categoryListMap);
    for(int i = 0; i < categoryList.length; i++){
      categoryList[i].count = await _taskDatabase.getTasksCountForCategory(categoryList[i].id!);
    }
    return Right(categoryList);
  }

}

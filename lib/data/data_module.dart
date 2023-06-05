import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/data/datasource/database/task_database.dart';
import 'package:todo_list/data/mapper/categories_mapper.dart';
import 'package:todo_list/data/repositories/categories_repository_impl.dart';
import 'package:todo_list/domain/repository/category/categories_repository.dart';

final dataBaseProvider = Provider<TaskDatabase>((_) => TaskDatabaseImpl());

final categoryListMapperProvider =
    Provider<CategotyListMapper>((_) => CategotyListMapperImpl());

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) =>
    CategoriesRepositoryImpl(
        ref.watch(dataBaseProvider), ref.watch(categoryListMapperProvider)));

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/data/category_database.dart';
import 'package:todo_list/core/data/color_database.dart';
import 'package:todo_list/features/new_category/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/new_category/data/mapper/color_mapper.dart';
import 'package:todo_list/features/main/data/repositories/categories_repository_impl.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';
import 'package:todo_list/features/new_category/data/repository/new_category_repository_impl.dart';
import 'package:todo_list/features/new_category/domain/repository/new_categry_repository.dart';


final dataBaseProvider =
    Provider<CategoryDataBase>((_) => CategoryDatabaseImpl());
final colorDataBaseProvider =
    Provider<ColorDataBase>((_) => ColorDataBaseImpl());
final categoryListMapperProvider =
    Provider<CategotyMapper>((_) => CategotyMapperImpl());
final colorMapperProvider = Provider<ColorMapper>((_) => ColorMapperImpl());

final categoriesRepositoryProvider = Provider<GetCategoriesRepository>((ref) =>
    CategoriesRepositoryImpl(
        ref.watch(dataBaseProvider),
        ref.watch(categoryListMapperProvider)));
final newCategoryRepositoryProvider = Provider<NewCategoryRepository>((ref) => NewCategoryRepositoryImpl(ref.watch(dataBaseProvider), ref.watch(colorDataBaseProvider), ref.watch(categoryListMapperProvider), ref.watch(colorMapperProvider)));
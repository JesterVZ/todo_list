import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/features/main/data/datasource/database/category_database.dart';
import 'package:todo_list/features/main/data/datasource/database/color_database.dart';
import 'package:todo_list/features/main/data/mapper/categories_mapper.dart';
import 'package:todo_list/features/main/data/mapper/color_mapper.dart';
import 'package:todo_list/features/main/data/repositories/categories_repository_impl.dart';
import 'package:todo_list/features/main/domain/repository/category/categories_repository.dart';


final dataBaseProvider =
    Provider<CategoryDataBase>((_) => CategoryDatabaseImpl());
final colorDataBaseProvider =
    Provider<ColorDataBase>((_) => ColorDataBaseImpl());
final categoryListMapperProvider =
    Provider<CategotyMapper>((_) => CategotyMapperImpl());
final colorMapperProvider = Provider<ColorMapper>((_) => ColorMapperImpl());

final categoriesRepositoryProvider = Provider<CategoriesRepository>((ref) =>
    CategoriesRepositoryImpl(
        ref.watch(dataBaseProvider),
        ref.watch(colorDataBaseProvider),
        ref.watch(colorMapperProvider),
        ref.watch(categoryListMapperProvider)));

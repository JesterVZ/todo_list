import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/data/data_module.dart';
import 'package:todo_list/domain/usecase/add_category_usecase.dart';
import 'package:todo_list/domain/usecase/add_color_usecase.dart';
import 'package:todo_list/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/domain/usecase/get_colors_usecase.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final getcategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
    (ref) => GetCategoriesUseCaseImpl(ref.watch(categoriesRepositoryProvider)));
final getColorsUseCaseProvider = Provider<GetColorsUseCase>(
    (ref) => GetColorsUseCaseImpl(ref.watch(categoriesRepositoryProvider)));
final addColorUseCaseProvider = Provider<AddColorUseCase>(
    (ref) => AddColorUseCaseImpl(ref.watch(categoriesRepositoryProvider)));
final addCaregoryUseCaseProvider = Provider<AddCategoryUseCase>(
    (ref) => AddCategoryUseCaseImpl(ref.watch(categoriesRepositoryProvider)));

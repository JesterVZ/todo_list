import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain/data_module.dart';
import 'package:todo_list/features/new_category/domain/usecase/add_category_usecase.dart';
import 'package:todo_list/features/main/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/features/new_category/domain/usecase/add_color_usecase.dart';
import 'package:todo_list/features/new_category/domain/usecase/get_colors_usecase.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final getcategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
    (ref) => GetCategoriesUseCaseImpl(ref.watch(categoriesRepositoryProvider)));
final getColorsUseCaseProvider = Provider<GetColorsUseCase>(
    (ref) => GetColorsUseCaseImpl(ref.watch(newCategoryRepositoryProvider)));
final addColorUseCaseProvider = Provider<AddColorUseCase>(
    (ref) => AddColorUseCaseImpl(ref.watch(newCategoryRepositoryProvider)));
final addCaregoryUseCaseProvider = Provider<AddCategoryUseCase>(
    (ref) => AddCategoryUseCaseImpl(ref.watch(newCategoryRepositoryProvider)));

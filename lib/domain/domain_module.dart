import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/data/data_module.dart';
import 'package:todo_list/domain/usecase/get_categories_usecase.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final getcategoriesUseCaseProvider = Provider<GetCategoriesUseCase>(
    (ref) => GetCategoriesUseCaseImpl(ref.watch(categoriesRepositoryProvider)));

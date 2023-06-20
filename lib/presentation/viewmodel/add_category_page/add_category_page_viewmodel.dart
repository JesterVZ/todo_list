import 'package:flutter/material.dart' as material;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/domain/domain_module.dart';
import 'package:todo_list/domain/model/category_model.dart';
import 'package:todo_list/domain/usecase/add_category_usecase.dart';
import 'package:todo_list/presentation/state/state.dart';

final addCategoryPageViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<AddCategoryPageViewModel, State<dynamic>>(
        (ref) =>
            AddCategoryPageViewModel(ref.watch(addCaregoryUseCaseProvider)));

class AddCategoryPageViewModel extends StateNotifier<State<dynamic>> {
  final AddCategoryUseCase _useCase;
  AddCategoryPageViewModel(this._useCase) : super(const State.init());

  CategoryModel? currentCategoryModel;
  late material.Color selectedColor;

  addCategory(String name) async {
    try {
      state = const State.loading();
      currentCategoryModel =
          CategoryModel(id: null, name: name, count: 0, color: selectedColor);
      await _useCase.call(currentCategoryModel!);
      state = const State.success(true);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}

import 'package:flutter/material.dart' as material;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain_module.dart';
import 'package:todo_list/features/domain/model/category_model.dart';
import 'package:todo_list/features/domain/usecase/add_category_usecase.dart';
import 'package:todo_list/features/presentation/viewmodel/add_category_page/color_picker_viewmodel.dart';
import 'package:todo_list/features/presentation/viewmodel/main_page_viewmodel.dart';

final addCategoryPageViewModelStateNotifierProvider =
    Provider.autoDispose<AddCategoryPageViewModel>((ref) =>
        AddCategoryPageViewModel(
            ref.watch(addCaregoryUseCaseProvider),
            ref.watch(colorPickerViewModelStateNotifierProvider.notifier),
            ref.watch(mainPageViewModelStateNotifierProvider.notifier)));

class AddCategoryPageViewModel {
  final AddCategoryUseCase _useCase;
  AddCategoryPageViewModel(
      this._useCase, this._colorPickerViewModel, this._mainPageViewModel);

  final ColorPickerViewModel _colorPickerViewModel;
  final MainPageViewModel _mainPageViewModel;
  CategoryModel? currentCategoryModel;
  material.Color? selectedColor;
  var _title = '';

  String appBarTitle() => 'Новая категория';

  String? categotyNameValudate() {
    if (_title.isEmpty) {
      return 'Введите название';
    }
    return null;
  }

  setTitle(String title) => _title = title;

  addCategory() async {
    currentCategoryModel = CategoryModel(
        id: null,
        name: _title,
        count: 0,
        color: _colorPickerViewModel.selectedColor);
    await _useCase.call(currentCategoryModel!);
    _mainPageViewModel.getCategories();
  }
}

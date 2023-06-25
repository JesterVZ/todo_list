import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain_module.dart';
import 'package:todo_list/core/presentation/state/state.dart';
import 'package:todo_list/features/main/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';

final categoriesPageViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<CategoriesPageViewModel, State<List<CategoryModel>>>(
        (ref) {
  return CategoriesPageViewModel(ref.watch(getcategoriesUseCaseProvider));
});

class CategoriesPageViewModel extends StateNotifier<State<List<CategoryModel>>> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoriesPageViewModel(this._getCategoriesUseCase) : super(const State.init()) {
    getCategories();
  }

  getCategories() async {
    try {
      state = const State.loading();
      final categories = await _getCategoriesUseCase.call();
      categories.fold((failure) {
        state = State.error(Exception());
      }, (result) {
        state = State.success(result);
      });
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}

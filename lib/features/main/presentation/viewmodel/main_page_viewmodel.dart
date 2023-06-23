import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain_module.dart';
import 'package:todo_list/core/presentation/state/state.dart';
import 'package:todo_list/features/main/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/features/new_category/data/entities/category_list.dart';

final mainPageViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<MainPageViewModel, State<CategoryList>>(
        (ref) {
  return MainPageViewModel(ref.watch(getcategoriesUseCaseProvider));
});

class MainPageViewModel extends StateNotifier<State<CategoryList>> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  MainPageViewModel(this._getCategoriesUseCase) : super(const State.init()) {
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

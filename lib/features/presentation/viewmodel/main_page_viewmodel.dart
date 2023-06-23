import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/domain_module.dart';
import 'package:todo_list/features/data/entities/category_list.dart';
import 'package:todo_list/features/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/features/presentation/state/state.dart';
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

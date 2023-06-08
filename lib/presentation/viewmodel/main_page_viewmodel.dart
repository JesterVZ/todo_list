import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/data/entities/category_list.dart';
import 'package:todo_list/domain/domain_module.dart';
import 'package:todo_list/domain/usecase/get_categories_usecase.dart';
import 'package:todo_list/presentation/state/state.dart';

final mainPageViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<MainPageViewModel, State<CategoryList>>(
        (ref) {
  return MainPageViewModel(ref.watch(getcategoriesUseCaseProvider));
});

class MainPageViewModel extends StateNotifier<State<CategoryList>> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  MainPageViewModel(this._getCategoriesUseCase) : super(const State.init()) {
    _getCategories();
  }

  _getCategories() async {
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

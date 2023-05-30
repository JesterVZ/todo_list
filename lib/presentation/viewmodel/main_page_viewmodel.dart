import 'package:todo_list/data/data_module.dart';
import 'package:todo_list/data/entities/category_entity.dart';
import 'package:todo_list/domain/usecase/get_categories_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/presentation/state/state.dart';

final mainPageViewModeltateNotifierProvider = StateNotifierProvider.autoDispose<
    MainPageViewModel, State<List<CategoryEntity>>>((ref) {
  return MainPageViewModel(ref.watch(getcategoriesUseCaseProvider));
});

class MainPageViewModel extends StateNotifier<State<List<CategoryEntity>>> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  MainPageViewModel(this._getCategoriesUseCase) : super(const State.init()) {
    _getCategories();
  }

  _getCategories() async {
    try {
      state = const State.loading();
      final categories = await _getCategoriesUseCase.call();
      state = State.success(categories);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}

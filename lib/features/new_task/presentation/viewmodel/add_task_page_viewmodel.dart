import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/presentation/state/state.dart';

final addTaskPageViewModelStateNotifierProvider =
    Provider.autoDispose<AddTaskViewModel>((ref) => AddTaskViewModel());

class AddTaskViewModel extends StateNotifier<State> {
  AddTaskViewModel() : super(const State.init());
  String _title = '';
  String _description = '';
  DateTime? _endDate;


  String appBarTitle() => 'Новая задача';

  set setTitle(String val) => _title = val;

  set setDescription(String val) => _description = val;

  set setEndDate(DateTime? val) => _endDate = val; 

  get getEndDate => _endDate;

  String? taskTitleValudate() {
    if (_title.isEmpty) {
      return 'Введите название';
    }
    return null;
  }
  String? taskDescriptionValudate() {
    if (_description.isEmpty) {
      return 'Введите описание';
    }
    return null;
  }
}

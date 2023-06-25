import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/core/presentation/state/state.dart';

class TaskListViewModel extends StateNotifier<State>{
  TaskListViewModel(super.state);
  
  getCategotiesWithCount(){
    state = const State.loading();
    
  }
}
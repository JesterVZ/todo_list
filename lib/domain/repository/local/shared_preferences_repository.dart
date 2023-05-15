import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/data/entities/task_entity.dart';

abstract class SharedPreferencesRepository{
  Future<List<TaskEntity>?> getTasks();
  void saveTasks(Iterable<TaskEntity> tasks);
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository{
  static const _keyTask = 'task';
  @override
  Future<List<TaskEntity>?> getTasks() async {
    var pref = await SharedPreferences.getInstance();
    if(pref.containsKey(_keyTask)){
      var value = pref.getString(_keyTask);
      if(value != null){
        return jsonDecode(value);
      }
    }
    return Future.value(null);
  }

  @override
  void saveTasks(Iterable<TaskEntity> tasks) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(_keyTask, jsonEncode(tasks));
  }

}
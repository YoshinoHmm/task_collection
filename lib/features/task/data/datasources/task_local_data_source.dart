import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';

abstract class TaskLocalDataSource {
  Future<List<Task>> getTasks();
  Future<void> saveTasks(List<Task> tasks);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<Task>> getTasks() async {
    final jsonString = sharedPreferences.getString('tasks');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> saveTasks(List<Task> tasks) async {
    final jsonString = json.encode(tasks.map((task) => task.toJson()).toList());
    await sharedPreferences.setString('tasks', jsonString);
  }
}

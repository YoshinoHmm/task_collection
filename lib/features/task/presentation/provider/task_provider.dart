import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';
import 'dart:convert';

class TaskProvider with ChangeNotifier {
  late SharedPreferences _prefs;
  List<Task> _tasks = [];

  TaskProvider() {
    _init();
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
    _loadTasks();
  }

  List<Task> get tasks => _tasks;

  Future<void> _loadTasks() async {
    final jsonString = _prefs.getString('tasks');
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      _tasks = jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      _tasks = [];
    }
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasks();
  }

  Future<void> updateTask(int index, Task task) async {
    _tasks[index] = task;
    await _saveTasks();
  }

  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await _saveTasks();
  }

  Future<List<Task>> searchTask(String query) async {
    final searchedTasks =
        _tasks.where((task) => task.title.contains(query)).toList();
    return searchedTasks;
  }

  Future<void> toggleTaskCompletion(int index) async {
    _tasks[index] =
        _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
    await _saveTasks();
  }

  Future<void> _saveTasks() async {
    final jsonString =
        json.encode(_tasks.map((task) => task.toJson()).toList());
    await _prefs.setString('tasks', jsonString);
    notifyListeners();
  }
}

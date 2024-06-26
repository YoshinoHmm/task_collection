import 'package:task_collection/features/task/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(int index, Task task);
  Future<void> deleteTask(int index);
}

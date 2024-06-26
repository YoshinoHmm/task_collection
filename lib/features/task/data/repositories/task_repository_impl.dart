import 'package:task_collection/features/task/data/datasources/task_local_data_source.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';
import 'package:task_collection/features/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Task>> getTasks() async {
    return await localDataSource.getTasks();
  }

  @override
  Future<void> addTask(Task task) async {
    final tasks = await localDataSource.getTasks();
    tasks.add(task);
    await localDataSource.saveTasks(tasks);
  }

  @override
  Future<void> updateTask(int index, Task task) async {
    final tasks = await localDataSource.getTasks();
    tasks[index] = task;
    await localDataSource.saveTasks(tasks);
  }

  @override
  Future<void> deleteTask(int index) async {
    final tasks = await localDataSource.getTasks();
    tasks.removeAt(index);
    await localDataSource.saveTasks(tasks);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';
import 'package:task_collection/features/task/presentation/provider/task_provider.dart';
import 'package:task_collection/features/task/presentation/router/app_router.gr.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  final int index;

  const TaskItemWidget({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Dismissible(
      key: Key(index.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        Provider.of<TaskProvider>(context, listen: false).deleteTask(index);
      },
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            taskProvider.toggleTaskCompletion(index);
          },
        ),
        onTap: () {
          AutoRouter.of(context).push(TaskEditRoute(task: task, index: index));
        },
      ),
    );
  }
}

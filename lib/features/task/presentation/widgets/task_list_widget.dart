import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_collection/features/task/presentation/provider/task_provider.dart';
import 'package:task_collection/features/task/presentation/widgets/task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return taskProvider.tasks.isNotEmpty
        ? ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return TaskItemWidget(task: task, index: index);
            },
          )
        : const Center(
            child: Text('No tasks available'),
          );
  }
}

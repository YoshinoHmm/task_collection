import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';
import 'package:task_collection/features/task/presentation/provider/task_provider.dart';

@RoutePage()
class TaskEditPage extends StatelessWidget {
  final Task? task;
  final int? index;

  TaskEditPage({super.key, this.task, this.index});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      _titleController.text = task!.title;
      _descriptionController.text = task!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final title = _titleController.text;
                    final description = _descriptionController.text;

                    if (task == null) {
                      final newTask =
                          Task(title: title, description: description);
                      Provider.of<TaskProvider>(context, listen: false)
                          .addTask(newTask);
                    } else {
                      final updatedTask = Task(
                          title: title,
                          description: description,
                          isCompleted: task!.isCompleted);
                      Provider.of<TaskProvider>(context, listen: false)
                          .updateTask(index!, updatedTask);
                    }

                    AutoRouter.of(context).popForced();
                  },
                  child: Text(task == null ? 'Add' : 'Update'),
                ),
                const SizedBox(width: 10),
                task != null
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color?>(
                              Colors.red.shade300),
                        ),
                        onPressed: () {
                          Provider.of<TaskProvider>(context, listen: false)
                              .deleteTask(index!);
                          AutoRouter.of(context)
                              .popUntilRouteWithName('HomeRoute');
                        },
                        child: const Text('Delete'),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

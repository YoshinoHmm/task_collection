import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_collection/features/task/domain/entities/task.dart';
import 'package:task_collection/features/task/presentation/provider/task_provider.dart';
import 'package:task_collection/features/task/presentation/router/app_router.gr.dart';

@RoutePage()
class TaskSearchPage extends StatefulWidget {
  const TaskSearchPage({super.key});

  @override
  State<TaskSearchPage> createState() => _TaskSearchPageState();
}

class _TaskSearchPageState extends State<TaskSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Task> _searchedTasks = [];

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search tasks...',
          ),
          onChanged: (query) {
            if (query.isNotEmpty) {
              taskProvider.searchTask(query).then((tasks) {
                setState(() {
                  _searchedTasks = tasks;
                });
              });
            } else {
              setState(() {
                _searchedTasks = [];
              });
            }
          },
        ),
      ),
      body: _searchedTasks.isEmpty
          ? const Center(child: Text('No tasks found'))
          : ListView.builder(
              itemCount: _searchedTasks.length,
              itemBuilder: (context, index) {
                final task = _searchedTasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      taskProvider.toggleTaskCompletion(index);
                    },
                  ),
                  onTap: () {
                    AutoRouter.of(context).push(
                      TaskEditRoute(task: task, index: index),
                    );
                  },
                );
              },
            ),
    );
  }
}

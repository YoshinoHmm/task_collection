import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_collection/features/task/presentation/router/app_router.gr.dart';
import 'package:task_collection/features/task/presentation/widgets/task_list_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Collection'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TaskListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(TaskEditRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

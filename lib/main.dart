import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_collection/features/task/presentation/provider/task_provider.dart';
import 'package:task_collection/features/task/presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: 'Task Collection',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:task_collection/features/task/domain/entities/task.dart' as _i6;
import 'package:task_collection/features/task/presentation/pages/home_page.dart'
    as _i1;
import 'package:task_collection/features/task/presentation/pages/task_edit_page.dart'
    as _i2;
import 'package:task_collection/features/task/presentation/pages/task_search_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    TaskEditRoute.name: (routeData) {
      final args = routeData.argsAs<TaskEditRouteArgs>(
          orElse: () => const TaskEditRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.TaskEditPage(
          key: args.key,
          task: args.task,
          index: args.index,
        ),
      );
    },
    TaskSearchRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TaskSearchPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TaskEditPage]
class TaskEditRoute extends _i4.PageRouteInfo<TaskEditRouteArgs> {
  TaskEditRoute({
    _i5.Key? key,
    _i6.Task? task,
    int? index,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          TaskEditRoute.name,
          args: TaskEditRouteArgs(
            key: key,
            task: task,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskEditRoute';

  static const _i4.PageInfo<TaskEditRouteArgs> page =
      _i4.PageInfo<TaskEditRouteArgs>(name);
}

class TaskEditRouteArgs {
  const TaskEditRouteArgs({
    this.key,
    this.task,
    this.index,
  });

  final _i5.Key? key;

  final _i6.Task? task;

  final int? index;

  @override
  String toString() {
    return 'TaskEditRouteArgs{key: $key, task: $task, index: $index}';
  }
}

/// generated route for
/// [_i3.TaskSearchPage]
class TaskSearchRoute extends _i4.PageRouteInfo<void> {
  const TaskSearchRoute({List<_i4.PageRouteInfo>? children})
      : super(
          TaskSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskSearchRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

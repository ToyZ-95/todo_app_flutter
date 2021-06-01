import 'package:flutter/material.dart';
import 'package:todo_app/blocs/tasks_list_bloc.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  final List<String> tasksList;
  final TasksListBloc tasksListBloc;
  TasksList({this.tasksList, this.tasksListBloc});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasksList.length,
      itemBuilder: (context, index) {
        return TaskTile(text: tasksList[index]);
      },
    );
  }
}

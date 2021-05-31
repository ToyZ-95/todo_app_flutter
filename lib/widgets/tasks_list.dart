import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks_list_data.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: TasksListData.tasksList.length,
      itemBuilder: (context, index) {
        return TaskTile(
          text: TasksListData.tasksList[index],
        );
      },
    );
    // return ListView(
    //   children: [
    //     TaskTile(),
    //     TaskTile(),
    //     TaskTile(),
    //   ],
    // );
  }
}

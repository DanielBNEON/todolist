import 'package:flutter/material.dart';
import 'package:for_real_todo/models/to_do_task.dart';
import 'package:for_real_todo/my_home_page.dart';
import 'package:for_real_todo/widgets/is_checked_box.dart';
import 'package:for_real_todo/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  final List<ToDoTask> taskList;
  final Function(int) deleteTask;
  const TaskList({Key? key, required this.taskList, required this.deleteTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return TaskCard(task: taskList[index], deleteTask: deleteTask, index: index);
        },
        itemCount: taskList.length);
  }
}

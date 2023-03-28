import 'package:flutter/material.dart';

import '../pages/add_new_tasks.dart';

import 'widgets/task_list.dart';
import 'models/to_do_task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDoTask> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddNewTask(
              addTask: _addTask,
            ),
            TaskList(
              taskList: taskList,
              deleteTask: _deleteTask,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Theme.of(context).colorScheme.primary,
      //     child: const Icon(Icons.add),
      //     onPressed: () => setState(() {})),
    );
  }

  _addTask(ToDoTask newTask) {
    setState(() {
      taskList.add(newTask);
    });
  }

  _deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
  }
}

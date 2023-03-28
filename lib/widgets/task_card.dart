import 'package:flutter/material.dart';

import '../models/to_do_task.dart';
import 'is_checked_box.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {super.key,
      required this.task,
      required this.deleteTask,
      required this.index});

  final ToDoTask task;
  final Function(int) deleteTask;
  final int index;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          children: [
            CustomCheckBox(onCheck: onCheck),
            Text(
              '${widget.task.text} (${widget.task.quantity})',
              style: TextStyle(
                decoration: _isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            const Spacer(),
            IconButton(
              color: Colors.red,
              onPressed: () {
                widget.deleteTask(widget.index);
              },
              icon: const Icon(
                Icons.delete,
              ),
            )
          ],
        ),
      ),
    );
  }

  onCheck(bool isChecked) {
    setState(() {
      _isChecked = isChecked;
    });
  }
}

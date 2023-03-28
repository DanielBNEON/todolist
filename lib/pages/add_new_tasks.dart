import 'package:flutter/material.dart';
import 'package:for_real_todo/models/to_do_task.dart';

class AddNewTask extends StatefulWidget {
  final Function(ToDoTask) addTask;
  const AddNewTask({Key? key, required this.addTask}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Titel',
              ),
              controller: titleController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Menge',
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: () async {
                ToDoTask newTask = ToDoTask(
                  text: titleController.text,
                  quantity: int.parse(amountController.text),
                );
                widget.addTask(newTask);
                titleController.clear();
                amountController.clear();
              },
              child: const Text('Neuer Artikel hinzufügen'),
            )
          ],
        ),
      ),
    );
  }
}

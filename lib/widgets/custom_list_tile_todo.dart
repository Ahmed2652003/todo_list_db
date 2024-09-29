import 'package:flutter/material.dart';
import 'package:todo_list_app_db/models/task_model.dart';
import 'package:todo_list_app_db/models/tasks_time.dart';
import '../constants/colors.dart';

class CustomListTileTodo extends StatefulWidget {
  const CustomListTileTodo({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<CustomListTileTodo> createState() => _CustomListTileTodoState();
}

class _CustomListTileTodoState extends State<CustomListTileTodo> {
  bool isCompleted = true;
  List<TasksTime> taskTimes = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            isCompleted = !isCompleted;
            setState(() {});
          },
          icon: Icon(
            isCompleted
                ? Icons.check_box_outline_blank
                : Icons.check_box_rounded,
          ),
          color: Colors.green,
        ),
        title: Text(
          widget.task.description,
          style: TextStyle(
            decoration:
                isCompleted ? TextDecoration.none : TextDecoration.lineThrough,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.edit,
              color: kEditIcon,
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
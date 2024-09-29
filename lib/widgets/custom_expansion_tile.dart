import 'package:flutter/material.dart';
import 'package:todo_list_app_db/models/tasks_time.dart';
import '../constants/styles.dart';
import 'custom_list_tile_todo.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.tasksTime,
  });
  final TasksTime tasksTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        border: Border.all(
          color: Colors.blueAccent.withOpacity(0.5),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(
          tasksTime.time.format(context),
          style: Styles.textStyle25.copyWith(color: Colors.black),
        ),
        children: [
          Column(
            children: [
              ...List.generate(tasksTime.tasks.length, (index) {
                return Column(children: [
                  CustomListTileTodo(
                    task: tasksTime.tasks[index],
                  ),
                  const SizedBox(height: 5)
                ]);
              })
//               for(final task in tasksTime.tasks){
// CustomListTileTodo(),
//               const SizedBox(
//                 height: 5,
//               ),
//               }
            ],
          ),
        ],
      ),
    );
  }
}
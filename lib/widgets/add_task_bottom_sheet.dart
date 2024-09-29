import 'package:flutter/material.dart';
import 'package:todo_list_app_db/constants/styles.dart';
import 'package:todo_list_app_db/controllers/to_do_contoller.dart';
import 'package:todo_list_app_db/models/task_model.dart';
import 'package:todo_list_app_db/models/tasks_time.dart';
import 'custom_elvated_button.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({
    super.key,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController textController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  final List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFEFEFE),
      ),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_downward,
                size: 45,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Add Task',
              style: Styles.textStyle25.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Time',
                    style: Styles.textStyle20.copyWith(color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    time = (await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        )) ??
                        TimeOfDay.now();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            time.format(context),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: textController,
                cursorColor: Colors.black,
                cursorHeight: 25,
                cursorWidth: 3,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF6F6F6),
              ),
              onPressed: () {
                tasks.add(TaskModel(
                    id: UniqueKey().hashCode,
                    description: textController.text));

                if (textController.text.isNotEmpty) {
                  setState(() {
                    textController.clear();
                  });
                }
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 20,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    width: double.infinity,
                    height: 35,
                    color: const Color(0xff939393),
                    child: Center(
                      child: Text(
                        tasks[index].description,
                        style: Styles.textStyle18.copyWith(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomElvatedButton(
                textIcon: '',
                onPressed: () {
                  ToDoController.addTaskTime(TasksTime(
                    id: UniqueKey().hashCode,
                    time: time,
                    tasks: tasks,
                  ));
                  Navigator.pop(context);
                },
                text: 'Confirm',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
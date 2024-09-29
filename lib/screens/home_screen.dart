import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app_db/models/tasks_time.dart';
import '../functions/custom_app_bar.dart';
import '../widgets/add_task_bottom_sheet.dart';
import '../widgets/custom_elvated_button.dart';
import '../widgets/custom_expansion_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box<TasksTime>('tasksTime').listenable(),
              builder: (context, Box<TasksTime> box, _) {
                final tasksTimes = box.values.toList();
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: tasksTimes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: CustomExpansionTile(
                        tasksTime: tasksTimes[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomElvatedButton(
              text: 'Add Task',
              icon: Icons.add,
              textIcon: '+',
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const AddTaskBottomSheet();
                  },
                );
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
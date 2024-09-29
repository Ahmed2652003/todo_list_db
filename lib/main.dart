import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'models/task_model.dart';
import 'models/tasks_time.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var Hive;
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(TasksTimeAdapter());

  await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<TasksTime>('tasksTime');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xffFAFAFA)));

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task_model.dart';
part 'tasks_time.g.dart';

@HiveType(typeId: 1)
class TasksTime extends HiveObject {
  @HiveField(0)
  final TimeOfDay time;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final List<TaskModel> _tasks;

  TasksTime({
    required this.id,
    required this.time,
    required tasks,
  }) : _tasks = tasks;

  List<TaskModel> get tasks => _tasks;

  void addTask(TaskModel task) {
    _tasks.add(task);
  }

  void removeTask(TaskModel task) {
    _tasks.remove(task);
  }

  void removeAllTasks() {
    _tasks.clear();
  }
}
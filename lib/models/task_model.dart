
@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String description;

  @HiveField(2)
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });
}
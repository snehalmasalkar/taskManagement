class TaskModel {
  String id;
  String title;
  String status;
  String description;
  String assignee;

  TaskModel(
      {required this.id,
      required this.title,
      required this.status,
      required this.description,
      required this.assignee});
}

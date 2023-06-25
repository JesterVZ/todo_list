class TaskModel {
  int id;
  String title;
  String description;
  int categoryId;
  DateTime date;
  TaskModel(
      {required this.id,
      required this.categoryId,
      required this.description,
      required this.date,
      required this.title});
}

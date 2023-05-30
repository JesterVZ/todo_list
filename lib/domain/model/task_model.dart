class TaskModel {
  int id;
  String title;
  String description;
  int categoryId;
  TaskModel(
      {required this.id,
      required this.categoryId,
      required this.description,
      required this.title});
}

class Todo {
  final int id;
  final int taskId;
  final String title;
  final int isDone;

  Todo(
      {required this.id, required this.taskId, required this.title, required this.isDone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'title': title,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, taskId:$taskId, title: $title, isDone: $isDone}';
  }
}

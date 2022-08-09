class Task{
  int? id;
  final String title;
  final String description;

  Task({this.title = 'Undefined', this.description = 'Undefined'});

  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, desc: $description}';
  }
}
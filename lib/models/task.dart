class Task{
  final int id;
  final String title;
  final String description;

  Task ({this.id = 0, this.title = 'Undefined', this.description = 'Undefined'});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
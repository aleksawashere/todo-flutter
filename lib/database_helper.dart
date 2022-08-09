import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'models/task.dart';

class DatabaseHelper{

  //Method for creating database
  Future<Database> database() async{
    return openDatabase(
        join(await getDatabasesPath(), 'todo.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT)",
          );
        },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {

    Database _db = await database();
    await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);

  }

  Future<List<Task>> getTasks() async{
    Database _db = await database();
    List<Map<String,dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(title: taskMap[index]['title'], description: taskMap[index]['description']);
    });
  }
}
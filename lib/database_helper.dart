import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

import 'models/task.dart';
import 'models/todo.dart';

class DatabaseHelper{

  //Method for creating database
  Future<Database> database() async{
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
        join(await getDatabasesPath(), 'todo_v3.db'),
        onCreate: (db, version) async{
          await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY NOT NULL, title TEXT, description TEXT)");
          await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY NOT NULL, taskId INTEGER, title TEXT, isDone INTEGER)"); //isDone will have 0 as false, and 1 as true);
          //return db;
        },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    final db = await database();
    await db.insert(
        'tasks',
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async{
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateTaskDescription(int id, String description) async{
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<void> insertTodo(Todo todo) async {

    final db = await database();
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<List<Task>> getTasks() async{
    Database _db = await database();
    List<Map<String,dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]['id'],title: taskMap[index]['title'], description: taskMap[index]['description']);
    });
  }

  Future<List<Todo>> getTodo(int taskId) async{
    Database _db = await database();
    List<Map<String,dynamic>> todoMap = await _db.rawQuery('SELECT * FROM todo WHERE taskId = $taskId');
    return List.generate(todoMap.length, (index) {
      return Todo(id: todoMap[index]['id'],title: todoMap[index]['title'], isDone: todoMap[index]['isDone'], taskId: todoMap[index]['taskId']);
    });
  }

  Future<void> updateTodoDone(int id, int isDone) async{
    Database _db = await database();
    await _db.rawUpdate("UPDATE todo SET isDone = '$isDone' WHERE id = '$id'");
  }

  Future<void> deleteTask(int id) async{
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
    await _db.rawDelete("DELETE FROM todo WHERE taskId = '$id'");
  }
}